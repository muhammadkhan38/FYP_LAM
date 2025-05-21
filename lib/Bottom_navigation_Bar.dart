// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class BottomNavigationBarClass extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final Color color;
//   final VoidCallback onTap;
//
//   const BottomNavigationBarClass({
//     Key? key,
//     required this.icon,
//     required this.label,
//     required this.color,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, color: color),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: TextStyle(color: color, fontSize: 12),
//           ),
//         ],
//       ),
//
//     );
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Page21.dart';
import 'Page22.dart';
import 'Page23.dart';
import 'Page41.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(30),
        topLeft: Radius.circular(30),
      ),
      child: BottomAppBar(
        height: 75,
        color: Colors.black87,
        notchMargin: 8,
        elevation: 40,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, CupertinoIcons.house_alt, 'Home', 0),
            _buildNavItem(context, CupertinoIcons.doc_text, 'Document', 1),
            _buildNavItem(context, CupertinoIcons.bookmark, 'Template', 2),
            _buildNavItem(context, CupertinoIcons.person, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, int index) {
    final color = selectedIndex == index ? Colors.lightBlueAccent : Colors.grey;

    return InkWell(
      onTap: () {
        onItemTapped(index);

        switch (index) {
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (_) => const Page21()));
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (_) => const Page23()));
            break;
          case 2:
            Navigator.push(context, MaterialPageRoute(builder: (_) => const Page22()));
            break;
          case 3:
            Navigator.push(context, MaterialPageRoute(builder: (_) => const Page41()));
            break;
          default:
            break;
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          Text(label, style: TextStyle(color: color, fontSize: 12)),
        ],
      ),
    );
  }
}

