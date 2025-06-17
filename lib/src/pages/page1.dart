import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:onboardingflow/src/onboarding_page_data.dart';

class Page1 extends StatelessWidget {
  final VoidCallback onNext;
  final OnboardingPageData content;
  const Page1({super.key, required this.onNext, required this.content});

  @override
  Widget build(BuildContext context) {
    CupertinoDynamicColor highlightColor = CupertinoColors.activeBlue;
    if (content.colors != null) {
      highlightColor = content.colors![0];
    }
    return Column(
      children: [
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 30,
                top: -100,
                child: Transform.rotate(
                  angle: -30 * (math.pi / 180),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: highlightColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: SizedBox(height: 450, child: content.images[0]),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                top: 50,
                child: Transform.rotate(
                  angle: 20 * (math.pi / 180),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: highlightColor,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: SizedBox(height: 450, child: content.images[1]),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 300,
          child: Center(
            child: Text(content.texts[0], textAlign: TextAlign.center),
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
