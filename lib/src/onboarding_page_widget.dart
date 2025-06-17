import 'package:flutter/cupertino.dart';
import 'package:onboardingflow/onboardingflow.dart';
import 'package:onboardingflow/src/pages/page1.dart';
import 'package:onboardingflow/src/pages/page2.dart';
import 'package:onboardingflow/src/pages/paywall.dart';
import 'package:onboardingflow/src/pages/welcome.dart';

class OnboardingPageWidget extends StatefulWidget {
  final List<OnboardingPageData> pageContent;
  final CupertinoPageRoute appRoute;
  const OnboardingPageWidget({super.key, required this.pageContent, required this.appRoute});

  @override
  State<OnboardingPageWidget> createState() => _OnboardingPageWidgetState();
}

class _OnboardingPageWidgetState extends State<OnboardingPageWidget> {
  
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            //Welcome page
            Welcome(onNext: () async {_pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);}, content: widget.pageContent[0]),

            //Page 1
            Page1(onNext: () async {_pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);}, content: widget.pageContent[1]),

            //Page 2
            Page2(onNext: () async {_pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);}, content: widget.pageContent[2]),

            //Paywall
            Paywall(onNext: () {Navigator.pushReplacement(context, widget.appRoute);}, content: widget.pageContent[3])
          ],
        )
      )
    );
  }
}