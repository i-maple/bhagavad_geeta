import 'package:bhagawad_geeta/providers/theme_provider.dart';
import 'package:bhagawad_geeta/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/home',
          themeMode: ref.watch(appThemeProvider),
          darkTheme: ThemeData.dark(),
          routes: {
            '/home': (context) => const HomeScreen(),
          },
        );
      },
    );
  }
}
