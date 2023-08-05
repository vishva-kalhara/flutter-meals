import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.icon, required this.title, required this.onTapItem});

  final IconData icon;
  final String title;
  final void Function() onTapItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontSize: 24,
            ),
      ),
      onTap: onTapItem,
    );
  }
}
