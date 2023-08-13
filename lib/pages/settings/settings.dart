import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lilac_machine_test/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Settings"),
        ),
        body: Consumer<ThemeNotifier>(
          builder: (_, themeData, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                    value: switchValue,
                    onChanged: (value) {
                      switchValue = value;
                      setState(() {});
                      themeData.toggleTheme();
                    },
                  ),
                  Text("Change theme")
                ],
              ),
            );
          },
        ));
  }
}
