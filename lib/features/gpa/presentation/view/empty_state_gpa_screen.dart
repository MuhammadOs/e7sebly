import 'package:flutter/material.dart';

class EmptyStateGPAScreen extends StatelessWidget {
  const EmptyStateGPAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/img/icons/empty.png', height: 200),
          const SizedBox(height: 20),
          const Text('! مفيش اي مادة',
              style: TextStyle(
                  fontSize: 24, fontFamily: "mess_bold", color: Colors.white)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
