import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../settings_provider.dart';
import '../widgets/theme_switch_tile.dart';
import '../widgets/language_dropdown.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Appearance',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const ThemeSwitchTile(),
          const SizedBox(height: 24),
          const Text(
            'Language',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const LanguageDropdown(),
          const SizedBox(height: 24),
          Consumer<SettingsProvider>(
            builder: (context, provider, child) {
              return SwitchListTile(
                title: const Text('Enable Notifications'),
                value: provider.notificationsEnabled,
                onChanged: provider.toggleNotifications,
              );
            },
          ),
        ],
      ),
    );
  }
}