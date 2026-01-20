import 'package:flutter/material.dart';

/// عنصر واجهة المحطات المتوفرة
class StationDropdown extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final List<String> stations;
  final ValueChanged<String?>? onChanged;

  const StationDropdown({
    super.key,
    required this.hintText,
    required this.controller,
    required this.stations,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownMenu<String>(
        controller: controller,
        enableSearch: true,
        enableFilter: true,
        requestFocusOnTap: true,
        menuHeight: 400,
        width:
            MediaQuery.of(context).size.width -
            32, /////////////////////////////
        hintText: hintText,
        onSelected: onChanged,
        dropdownMenuEntries: stations
            .map((station) => DropdownMenuEntry(label: station, value: station))
            .toList(),
      ),
    );
  }
}
