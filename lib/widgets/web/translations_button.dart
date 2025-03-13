import 'package:flutter/material.dart';
import 'package:google_clone/widgets/web/language_text.dart';

class TranslationsButton extends StatelessWidget {
  const TranslationsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      alignment: WrapAlignment.center,
      children: [
        Text("Google offered in:"),

        SizedBox(width: 5),
        LanguageText(title: 'English'),
        SizedBox(width: 5),
        LanguageText(title: 'اردو'),
        SizedBox(width: 5),
        LanguageText(title: 'پشتو'),
        // SizedBox(width: 5),
        // LanguageText(title: 'मराठी'),
        // SizedBox(width: 5),
        // LanguageText(title: 'தமிழ்'),
        // SizedBox(width: 5),
        // LanguageText(title: 'ગુજરાતી'),
        // SizedBox(width: 5),
        // LanguageText(title: 'ಕನ್ನಡ'),
        // SizedBox(width: 5),
        // LanguageText(title: 'മലയാളം'),
        // SizedBox(width: 5),
        // LanguageText(title: 'ਪੰਜਾਬੀ'),
      ],
    );
  }
}
