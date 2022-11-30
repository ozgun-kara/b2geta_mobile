import 'package:flutter/material.dart';

class AppDarkTheme {
  String appFontFamily = "Axiforma";


  Color pageBackgroundColor1 = const Color(0xFF21233A);
  Color pageBackgroundColor2 = const Color(0xFF2D304B);
  Color pageBackgroundColor3 = const Color(0xFF22243B);



  Color mainTextColor = const Color(0xFF14142B);
  Color subTextColor = const Color(0xFF6E7191);
  Color strokeHeaderColor = const Color.fromRGBO(110, 113, 145, 0.25);
  Color placeholderColor = const Color(0xFFA0A3BD);
  Color lineColor = const Color(0xFFD6D8E7);
  Color white = const Color(0xFFFFFFFF);
  Color secondaryColor = const Color(0xFF0088B1);
  Color primaryColor = const Color(0xFF9B1C73);

  Color warningColor = const Color(0xFFF4B740);
  Color errorColor = const Color(0xFFED2E7E);
  Color successColor = const Color(0xFF00BA88);

  LinearGradient primaryGradient = const LinearGradient(
    colors: <Color>[
      Color(0xFF622D6C),
      Color(0xFFB93290),
    ],
  );
  LinearGradient primaryDisabledGradient = const LinearGradient(
    colors: <Color>[
      Color.fromRGBO(110, 113, 145, 0.1),
      Color.fromRGBO(110, 113, 145, 0.1),
    ],
  );
  LinearGradient secondaryGradient = const LinearGradient(
    colors: <Color>[
      Color(0xFF154D80),
      Color(0xFF00ABDF),
    ],
  );
  LinearGradient accentGradient = const LinearGradient(
    colors: <Color>[
      Color(0xFFB33491),
      Color(0xFF0F588E),
    ],
  );
  LinearGradient ebookGradient = const LinearGradient(
    colors: <Color>[
      Color(0xFF801515),
      Color(0xFFDF0000),
    ],
  );

  LinearGradient consultancyGradient = const LinearGradient(
    colors: <Color>[
      Color(0xFFED7B3C),
      Color(0xFFE1665A),
    ],
  );

  LinearGradient podcastGradient = const LinearGradient(
    colors: <Color>[
      Color(0xFF4B2053),
      Color(0xFFD766B4),
    ],
  );
}
