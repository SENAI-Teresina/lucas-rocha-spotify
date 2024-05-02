import '../detalhes/about_us_page.dart';
import 'package:flutter/material.dart';

void openAboutUsPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AboutUsPage()),
  );
}

