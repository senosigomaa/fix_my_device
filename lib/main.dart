import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/theme/app_colors.dart';
import 'features/splash/presentation/screens/splash_screen.dart';

void main() {
  runApp(const FixMyDeviceApp());
}

class FixMyDeviceApp extends StatelessWidget {
  const FixMyDeviceApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. توليد TextTheme كامل مبني على خط Zain
    final zainTextTheme = GoogleFonts.zainTextTheme(
      ThemeData.light().textTheme,
    );

    return MaterialApp(
      title: 'صلّحي جهازي',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primary,

        // 2. إجبار خط Zain على جميع نصوص التطبيق
        fontFamily: GoogleFonts.zain().fontFamily,
        fontFamilyFallback: [GoogleFonts.zain().fontFamily!],
        textTheme: zainTextTheme,
        primaryTextTheme: zainTextTheme,

        // 3. تطبيقه على حقول الإدخال (TextField & Hints)
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: GoogleFonts.zain(
            color: AppColors.textSecondary,
            fontSize: 13,
          ),
          labelStyle: GoogleFonts.zain(color: AppColors.textPrimary),
        ),

        // 4. تطبيقه على الـ AppBar
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: GoogleFonts.zain(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
