import 'package:flutter/cupertino.dart';
import 'package:onboardingflow/src/onboarding_page_data.dart';

class Welcome extends StatelessWidget {
  final VoidCallback onNext;
  final OnboardingPageData content;
  const Welcome({super.key, required this.onNext, required this.content});

  @override
  Widget build(BuildContext context) {
    CupertinoDynamicColor highlightColor = CupertinoColors.activeBlue;
    if (content.colors != null) {
      highlightColor = content.colors![0];
    }
    return Column(
      children: [
        SizedBox(height: 50),
        content.images[0],
        Text(
          content.title,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(content.texts[0]),
        SizedBox(height: 100),
        CupertinoButton.filled(
          onPressed: () => onNext(),
          color: highlightColor,
          child: Text("Get Started"),
        ),
      ],
    );
  }
}
