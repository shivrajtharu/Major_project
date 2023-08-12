import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/color.dart';
import '../res/theme_provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        title: const Text('Settings'),
      ),
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              SwitchListTile(
                title: const Text('Enable Notifications'),
                value: true, // Replace with your own logic
                onChanged: (newValue) {
                  setState(() {
                    // Update your notification settings
                  });
                },
              ),
              SwitchListTile(
                title: const Text('Dark Mode'),
                value: themeProvider.isDarkMode,
                onChanged: (newValue) {
                  themeProvider.toggleTheme();
                },
              ),
              // Add more settings options as needed
            ],
          );
        },
      ),
    );
  }
}
