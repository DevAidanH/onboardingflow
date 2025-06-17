import 'package:flutter/cupertino.dart';
import 'package:onboardingflow/src/onboarding_page_data.dart';

class Page2 extends StatelessWidget {
  final VoidCallback onNext;
  final OnboardingPageData content;
  const Page2({super.key, required this.onNext, required this.content});

  @override
  Widget build(BuildContext context) {
    CupertinoDynamicColor highlightColor = CupertinoColors.activeBlue;
    if (content.colors != null) {
      highlightColor = content.colors![0];
    }
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: highlightColor,
              style: BorderStyle.solid,
            ),
          ),
          child: SizedBox(height: 500, child: content.images[0]),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 300,
          child: Center(
            child: Text(content.texts[0], textAlign: TextAlign.center),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 350,
          child: Center(
            child: Text(content.texts[1], textAlign: TextAlign.center),
          ),
        ),
        SizedBox(height: 30),
        CupertinoButton.filled(
          onPressed: () => onNext(),
          color: highlightColor,
          child: Text("Next"),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
