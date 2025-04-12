import 'package:flutter/material.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.language),
        title: const Text('App Language'),
        trailing: DropdownButton<String>(
          value: 'English',
          onChanged: (value) {},
          items: const [
            DropdownMenuItem(
              value: 'English',
              child: Text('English'),
            ),
            DropdownMenuItem(
              value: 'Russian',
              child: Text('Russian'),
            ),
            // Add more languages
          ],
        ),
      ),
    );
  }
}