import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template01/view/settings_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
               /* const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,

                  ),
                  child: Text('Drawer Header'),
                ),*/
                //const DrawerButtonIcon(),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {},
                ),

              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Get.to(const SettingsScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
