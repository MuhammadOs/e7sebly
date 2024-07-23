import 'package:flutter/material.dart';

class CourseListItem extends StatelessWidget {
  final String name;
  final String grade;
  final VoidCallback onDelete;

  CourseListItem({required this.name, required this.grade, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Dismissible(
      key: Key(name), // Ensure a unique key for each item
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        // Call the onDelete callback when the item is dismissed
        onDelete();
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.square_rounded, color: Colors.orange, size: w * 0.05),
                const SizedBox(width: 10),
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: "mont_bold",
                    color: Colors.white,
                    fontSize: w * 0.05,
                  ),
                ),
              ],
            ),
            Text(
              grade,
              style: TextStyle(
                fontFamily: "mont_bold",
                color: Colors.white,
                fontSize: w * 0.05,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
