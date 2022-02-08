// source https://github.com/juliansteenbakker/flutter_settings_ui
//
//
// maby change to: https://pub.dev/packages/flutter_settings_screens
// https://www.youtube.com/watch?v=pYQAhrY_SQA

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:routr/screens/authentication/login.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Settings')),
      body: buildSettingsList(),
    );
  }

  Widget buildSettingsList() {
    return SettingsList(
      darkBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      sections: [
        CustomSection(
          child: const Padding(
            padding: EdgeInsets.only(
              top: 15,
            ),
          ),
        ),
        SettingsSection(
          title: 'General',
          tiles: [
            SettingsTile
                // .switchTile
                (
              title: 'Dark Mode',
              leading: const Icon(Icons.nightlight_rounded),
              onPressed: (context) {},
            ),
          ],
        ),
        SettingsSection(
          title: 'Account',
          tiles: [
            SettingsTile(
                title: 'Phone number', leading: const Icon(Icons.phone)),
            SettingsTile(title: 'Email', leading: const Icon(Icons.email)),
            SettingsTile(
              title: 'Sign out',
              leading: const Icon(Icons.exit_to_app),
              onPressed: (context) {
                logout(context);
              },
            ),
          ],
        ),
        SettingsSection(
          title: 'Misc',
          tiles: [
            SettingsTile(
                title: 'Terms of Service',
                leading: const Icon(Icons.description)),
            SettingsTile(
                title: 'Open source licenses',
                leading: const Icon(Icons.collections_bookmark)),
          ],
        ),
        CustomSection(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22, bottom: 8),
                child: Image.asset(
                  'assets/settings.png',
                  height: 50,
                  width: 50,
                  color: const Color(0xFF777777),
                ),
              ),
              const Text(
                'Version: 0.0.1 (1)',
                style: TextStyle(color: Color(0xFF777777)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
