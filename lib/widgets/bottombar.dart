import 'package:flutter/material.dart';
class BuildBottonNav extends StatelessWidget {
  const BuildBottonNav({super.key, required this.index, required this.icon, required this.onTap, required this.selectedIndex});
  final int index;
  final IconData icon;
  final int selectedIndex;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: selectedIndex == index ? Color(0xFFCEA700) : Color(0xFFD3CECE),
        size: 30,
      ),
    );
  }
}
