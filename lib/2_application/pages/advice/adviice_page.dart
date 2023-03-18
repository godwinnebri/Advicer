import 'package:adviser_app/2_application/core/services/theme_service.dart';
import 'package:adviser_app/2_application/core/widgets/custom_button.dart';
import 'package:adviser_app/2_application/pages/advice/widgets/advice_field.dart';
import 'package:adviser_app/2_application/pages/advice/widgets/error_message.dart';
import 'package:adviser_app/2_application/pages/advice/widgets/welcome_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AdvicePage extends StatelessWidget {
  const AdvicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Advicer',
          style: themeData.textTheme.headline1,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: CupertinoSwitch(
              value: Provider.of<ThemeService>(context).isDarkModeOn,
              onChanged: ((value) {
                Provider.of<ThemeService>(context, listen: false).toggleTheme();
              }),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 40, 24, 30),
        child: Column(
          children: [
            Expanded(child: WelcomeField(themeData: themeData)
                //     ErrorMessage(
                //   themeData: themeData,
                //   message: 'You are not connected to the internet',
                // )

                //     AdviceField(
                //   advice: 'Make sure you stfoijfijsiojfi',
                //   themeData: themeData,
                // )

                // Center(
                //   child: CircularProgressIndicator(
                //     color: themeData.colorScheme.secondary,
                //   ),
                // ),

                ),
            SizedBox(
              height: 160,
              child: Center(
                child: CustomButton(
                  text: 'Get Advise',
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
