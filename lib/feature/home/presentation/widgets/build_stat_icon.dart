import 'package:flutter/material.dart';

class BuildStatIcon extends StatelessWidget {
  final TextTheme textTheme; 
  final IconData icon;
  final String label;
  final Color color;
  const BuildStatIcon({
    required this.textTheme,
    required this.icon,
    required this.label,
    required this.color,
    super.key});

  @override  
  Widget build(BuildContext context) {
      return Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }
  }