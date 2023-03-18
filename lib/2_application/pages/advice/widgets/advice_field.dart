import 'package:flutter/material.dart';

class AdviceField extends StatelessWidget {
  const AdviceField({
    Key? key,
    required this.themeData,
    required this.advice,
  }) : super(key: key);

  final ThemeData themeData;

  final String advice;

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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(34, 20, 34, 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '📝',
              style: TextStyle(fontSize: 54),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(34, 20, 34, 40),
              child: Text(
                advice,
                style: themeData.textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
