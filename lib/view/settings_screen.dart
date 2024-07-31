import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:template01/model/app_dropdown_menu_entry.dart';
import 'package:template01/view/my_widgets/my_drop_down_menu.dart';

import '../controler/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
        init: SettingsController.to,
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Settings'),
            ),
            body: ListView(
              children: [
                ListTile(
                  title: const Text('Theme Mode'),
                  trailing: MyDropDownMenu<ThemeMode>(
                      initialSelection: controller.themeMode,
                      onSelected: (value) {
                        controller.themeMode = (() async => value ?? ThemeMode.light)();
                      },
                      dropdownMenuEntries: const [
                        AppDropdownMenuEntry(value: ThemeMode.light, label: 'Light', icon: Icons.light_mode_outlined),
                        AppDropdownMenuEntry(value: ThemeMode.dark, label: 'Dark', icon: Icons.dark_mode_outlined),
                        AppDropdownMenuEntry(value: ThemeMode.system, label: 'System', icon: Icons.circle_outlined)
                      ]),
                  onTap: () {},
                )
              ],
            ),
          );
        });
  }
}
