# Onboarding Flow Widget

## Features

* Display three to fours pages including a page wall on your application in a pre-determind style

## Usage

Add the following to pub.spec assuming the project is within my working folder.

`onboardingflow:
    path: ../onboardingflow`

Then within the app create a widget called onboarding.dart and insert something like the following.

```dart
import 'package:flutter/cupertino.dart';
import 'package:onboardingflow/onboardingflow.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final List<OnboardingPageData> pageContent = [
      OnboardingPageData(
        title: "Welcome to\nClicker Counter", 
        texts: ["Count clicks. Unlock insights."], 
        images: [Image.asset("lib/assets/icon.png")],
      ),
      OnboardingPageData(
        title: "", 
        texts: ["Seamlessly count entries, exits, or any metric that matters.\nDesigned for door staff and event managers who need accurate, real-time tracking with ease."], 
        images: [Image.asset("lib/assets/image1.png"), Image.asset("lib/assets/recording1.gif")]
      ),
      OnboardingPageData(
        title: "", 
        texts: ["Go beyond the count — unlock patterns in guest flow and peak times.", "Turn headcounts into insights. Make smarter staffing and security decisions."], 
        images: [Image.asset("lib/assets/recording2.gif")]
      ),
      OnboardingPageData(
        title: "", 
        texts: ["Detailed Analytics & Reporting", "Real-Time Attendance Tracking", "Share data across your organization"], 
        images: [Image.asset("lib/assets/icon.png")]
      )
    ];
    return OnboardingPageWidget(pageContent: pageContent, appRoute: CupertinoPageRoute(builder: (context) => Mainscaffold()));
  }
}
```

Here you can see the information required for each page. It is import that each one of the `onboardingPageData` holds the correct amount of information. 

### Index 0 - Welcome page
* `title` must be valid
* `texts` must contain one item
* `images` must contain one item

### Index 1 - Page 1
* `title` must be empty
* `textts` must contain one item
* `images` must contain two items

### Index 2 - Page 2
* `title` must be empty
* `textts` must contain two items
* `images` must contain one item

### Index 3 - Paywall - leave blank if not required. 
* `title` must be empty
* `textts` must contain three items
* `images` must contain one item

In addition all pages have access to the following
`prices` - must contain two peices of information if used.
'colors' - must contain one Color and must be declared on all pages if used on one. 

## Additional information

Private package for use within my apps for smooth onboarding flow and paywall intergration. 
