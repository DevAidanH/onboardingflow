import 'package:flutter/cupertino.dart';

class OnboardingPageData {
  final String title;
  final List<String> texts;
  final List<Widget> images;
  final List<String>? prices;
  final List<Color>? colors;

  OnboardingPageData({
    required this.title,
    required this.texts,
    required this.images,
    this.prices,
    this.colors
  });
}