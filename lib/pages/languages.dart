import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import '../components/top_bar.dart';

class languageScreen extends StatelessWidget {
  const languageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const LocaleText("language"),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () => Locales.change(context, 'en'),
            title: LocaleText('english'),
          ),
          ListTile(
              title: LocaleText('amharic'),
              onTap: () => Locales.change(context, 'am')),
          Text('current_language_is: ' +
              Locales.currentLocale(context)!.languageCode),
          // Text('Current Locale: ' + context.currentLocale.languageCode), // with Extension
        ],
      ),
    );
  }
}
