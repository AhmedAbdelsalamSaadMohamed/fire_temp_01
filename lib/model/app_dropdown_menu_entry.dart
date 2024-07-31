import 'package:flutter/material.dart';

class AppDropdownMenuEntry<T> {
  /// Creates an entry that is used with [DropdownMenu.dropdownMenuEntries].
  const AppDropdownMenuEntry({required this.value, required this.label, required this.icon});

  final T value;
  final String label;
  final IconData icon;

  DropdownMenuEntry<T> toDropdownMenuEntry() {
    return DropdownMenuEntry<T>(label: this.label, value: this.value, leadingIcon: Icon(this.icon));
  }
}
