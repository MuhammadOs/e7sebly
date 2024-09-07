import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wifi_configuration_2/wifi_configuration_2.dart';

class Qrcode extends StatefulWidget {
  const Qrcode({super.key});

  @override
  _QrcodeState createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  String? scannedData;
  bool _isFlashOn = false;
  bool _isFrontCamera = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      if (kDebugMode) {
        print('Camera permission granted');
      }
    } else {
      if (kDebugMode) {
        print('Camera permission denied');
      }
      _showPermissionDeniedDialog();
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Camera Permission Required'),
        content: const Text(
            'This app requires camera access to scan QR codes. Please grant the permission in settings.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    if (kDebugMode) {
      print('QR View created');
    }
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (kDebugMode) {
        print('QR Code scanned: ${scanData.code}');
      }
      setState(() {
        result = scanData;
        scannedData = scanData.code;
        _isLoading = false;
      });
    });
  }

  void _toggleFlash() async {
    if (controller != null) {
      _isFlashOn = !_isFlashOn;
      await controller!.toggleFlash();
      setState(() {});
    }
  }

  void _switchCamera() async {
    if (controller != null) {
      _isFrontCamera = !_isFrontCamera;
      await controller!.flipCamera();
      setState(() {});
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0XFF1D6BDD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 90,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: (w <= 550) ? 25 : 30,
          ),
        ),
        title: Text(
          "الماسح الضوئي",
          style: TextStyle(
            fontFamily: "mess_bold",
            color: Colors.white,
            fontSize: (w <= 550) ? 25 : 30,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _toggleFlash,
            icon: Icon(
              _isFlashOn ? Icons.flash_off : Icons.flash_on,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: _switchCamera,
            icon: const Icon(
              Icons.camera_front,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: (w <= 550) ? 250.0 : 300.0,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (_isLoading)
                  ? const CircularProgressIndicator()
                  : (scannedData != null)
                      ? _buildResultWidget(scannedData!)
                      : const Text(
                          'Scan a code',
                          style: TextStyle(color: Colors.white),
                        ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultWidget(String data) {
    final Uri uri = Uri.tryParse(data) ?? Uri();
    if (uri.scheme.startsWith('http')) {
      return GestureDetector(
        onTap: () {
          _launchURL(data);
        },
        child: Text(
          'Open Link: $data',
          style: const TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    } else if (uri.scheme == 'mailto') {
      return GestureDetector(
        onTap: () {
          _launchURL(data);
        },
        child: Text(
          'Send Email: $data',
          style: const TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    } else if (uri.scheme == 'tel') {
      return GestureDetector(
        onTap: () {
          _launchURL(data);
        },
        child: Text(
          'Call: $data',
          style: const TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    } else if (uri.scheme == 'sms') {
      return GestureDetector(
        onTap: () {
          _launchURL(data);
        },
        child: Text(
          'Send SMS: $data',
          style: const TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    } else if (uri.scheme == 'whatsapp') {
      return GestureDetector(
        onTap: () {
          _launchURL(data);
        },
        child: Text(
          'WhatsApp: $data',
          style: const TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    } else if (uri.scheme == 'WIFI') {
      return GestureDetector(
        onTap: () {
          setState(() {
            _isLoading = true;
          });
          _connectToWifi(data);
        },
        child: Text(
          'Connect to Wi-Fi: $data',
          style: const TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    } else if (data.endsWith('.png') ||
        data.endsWith('.jpg') ||
        data.endsWith('.jpeg')) {
      return Image.network(data, fit: BoxFit.cover);
    } else if (data.endsWith('.pdf')) {
      return GestureDetector(
        onTap: () {
          _launchURL(data);
        },
        child: Text(
          'Open PDF: $data',
          style: const TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    } else {
      return Text(
        'Text: $data',
        style: const TextStyle(color: Colors.white),
      );
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url.trim());

    try {
      if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
        if (kDebugMode) {
          print('Could not launch $url');
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch the URL: $url')),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception occurred while launching URL: $e');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Exception occurred: $e')),
      );
    }
  }

  Future<void> _connectToWifi(String wifiData) async {
    try {
      // Parse Wi-Fi QR code data
      // Format: WIFI:T:<encryption>;S:<SSID>;P:<password>;H:<hidden>;;
      final wifiInfo = wifiData.substring(5).split(';');
      String ssid = '';
      String password = '';
      String encryption = 'WPA';
      bool hidden = false;

      for (var info in wifiInfo) {
        if (info.startsWith('S:')) {
          ssid = info.substring(2);
        } else if (info.startsWith('P:')) {
          password = info.substring(2);
        } else if (info.startsWith('T:')) {
          encryption = info.substring(2);
        } else if (info.startsWith('H:')) {
          hidden = info.substring(2) == 'true';
        }
      }

      final wifiConfiguration = WifiConfiguration();

      await wifiConfiguration.connectToWifi(
        ssid,
        password,
        encryption,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Connected to Wi-Fi: $ssid')),
      );
    } catch (e) {
      if (kDebugMode) {
        print('Exception occurred while connecting to Wi-Fi: $e');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Exception occurred while connecting to Wi-Fi: $e'),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
