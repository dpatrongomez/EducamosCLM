import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const CustomListTile({
    super.key,
    this.title = 'Title',
    this.subtitle,
    this.icon = Icons.star,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      dense: true,
      leading: Icon(
        icon,
        color: const Color(0xff909090),
      ),
      title: Text(
        title!,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: subtitle == null
          ? null
          : Text(
              subtitle!,
            ),
    );
  }
}