import 'package:bhagawad_geeta/providers/http_provider.dart';
import 'package:bhagawad_geeta/providers/theme_provider.dart';
import 'package:bhagawad_geeta/screens/verses_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ref.watch(appThemeProvider) == ThemeMode.light? Colors.amber.shade100 : Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: 'श्रीमद् भगवद् गिता'.text.bold.white.make(),
        centerTitle: true,
        actions: [
          Switch.adaptive(
            thumbIcon: MaterialStatePropertyAll(
              Icon(
                ref.watch(appThemeProvider) == ThemeMode.light
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
            ),
            value: ref.watch(appThemeProvider) != ThemeMode.light,
            onChanged: (value) {
              ref.read(appThemeProvider.notifier).toggle();
            },
          ),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final activity = ref.watch(getChapterProvider);
          return SizedBox(
            child: switch (activity) {
              AsyncData(:final value) => ListView.builder(
                  itemCount: value.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => ListTile(
                    style: ListTileStyle.drawer,
                    title:
                        '${value[index].name}  -  ${value[index].nameMeaning}'
                            .text
                            .make(),
                    subtitle: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.list).pOnly(right: 12),
                        '${value[index].versesCount} Verses'.text.make()
                      ],
                    ),
                    leading: value[index]
                        .id
                        .text
                        .center
                        .make()
                        .box
                        .width(20)
                        .height(20)
                        .amber400
                        .make(),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VersesScreen(
                          verseId: value[index].id,
                          chapterTitle: value[index].name,
                          chapterDescription: value[index].chapterSummary,
                        ),
                      ),
                    ),
                  ),
                ),
              AsyncError() => activity.error.toString().text.red500.bold.make(),
              _ => const CircularProgressIndicator.adaptive(),
            },
          );
        },
      ).p20(),
    );
  }
}
