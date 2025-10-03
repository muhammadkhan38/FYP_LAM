import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home_page.dart';
import 'Page22.dart';
import 'Pending_Agreement_page.dart';
import 'Profile_Page.dart';

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
        topRight: Radius.circular(25),
        topLeft: Radius.circular(25),
      ),
      child: BottomAppBar(
        height: 79,
        color: Color(0xFF474646),
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
    final color = selectedIndex == index ? Color(0xFF00C2FF) : Colors.grey;

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

