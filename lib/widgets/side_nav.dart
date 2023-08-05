import 'package:flutter/material.dart';
import 'package:meals/widgets/Micro/drawer_item.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key, required this.onSelecScreen});

  final void Function(String identifier) onSelecScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(.7),
              ],
            )),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 36,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                const SizedBox(width: 16),
                Text(
                  "Meals",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ],
            ),
          ),
          DrawerItem(
            icon: Icons.restaurant,
            title: "Meals",
            onTapItem: () {
              onSelecScreen("meals");
            },
          ),
          DrawerItem(
            icon: Icons.settings,
            title: "Fillters",
            onTapItem: () {
              onSelecScreen("filters");
            },
          ),
        ],
      ),
    );
  }
}
