import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice Locale change'),
        actions: [],
      ),
      body: Column(
        children: [
          TextButton(onPressed: () {}, child: Text('change your language')),
          Switch(
              value: isSwitched,
              onChanged: (value) {
                context.setLocale(Locale(value ? 'en' : 'es'));
                setState(() {
                  isSwitched = value;
                });
              })
        ],
      ),
    );
  }
}
