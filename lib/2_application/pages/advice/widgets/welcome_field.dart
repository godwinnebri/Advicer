import 'package:flutter/material.dart';

class WelcomeField extends StatelessWidget {
  const WelcomeField({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          40,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff6564A7).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 80,
            offset: const Offset(0, 10),
          ),
        ],
        color: themeData.colorScheme.primaryContainer,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '👋',
            style: TextStyle(fontSize: 54),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(34, 20, 34, 40),
            child: Text(
              'Click the button to get an advise',
              style: themeData.textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
