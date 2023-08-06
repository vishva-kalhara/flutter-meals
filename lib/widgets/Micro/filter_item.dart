import 'package:flutter/material.dart';

// @immutable
class FilterItem extends StatefulWidget {
  const FilterItem({super.key, required this.title, required this.onChangedStat});

  final String title;
  // final String subTitle;

  final void Function(bool currStat) onChangedStat;

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  var currStat = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: currStat,
      onChanged: (isChecked) {
        setState(() {
          currStat = isChecked;
        widget.onChangedStat(currStat);
        });
      },
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        "Only include ${widget.title} meals",
        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 33, right: 22),
    );
  }
}
