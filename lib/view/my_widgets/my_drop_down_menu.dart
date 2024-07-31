import 'package:flutter/material.dart';

import '../../model/app_dropdown_menu_entry.dart';

class MyDropDownMenu<T> extends StatelessWidget {
  MyDropDownMenu({super.key, required this.initialSelection, required this.onSelected, required this.dropdownMenuEntries})
      : currentSelection = initialSelection;

  final Future<T?> initialSelection;
  void Function(T?)? onSelected;
  List<AppDropdownMenuEntry<T>> dropdownMenuEntries;
  Future<T?> currentSelection;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T?>(
        future: currentSelection,
        builder: (context, snapshot) {
          return DropdownMenu<T>(
              initialSelection: snapshot.data,
              inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none),
              leadingIcon: Icon(snapshot.connectionState != ConnectionState.done
                  ? Icons.ac_unit
                  : dropdownMenuEntries.firstWhere((e) => e.value == snapshot.data).icon),
              onSelected: onSelected,
              dropdownMenuEntries: dropdownMenuEntries.map((e) => e.toDropdownMenuEntry()).toList());
        });
  }
}
