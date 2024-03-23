import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class AppTheme extends _$AppTheme {
  @override
  ThemeMode build() {
    return ThemeMode.light;
  }

  toggle(){
    state == ThemeMode.light? state = ThemeMode.dark : state = ThemeMode.light;
  }
}