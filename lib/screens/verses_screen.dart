import 'package:bhagawad_geeta/model/verses.dart';
import 'package:bhagawad_geeta/providers/http_provider.dart';
import 'package:bhagawad_geeta/providers/language_provider.dart';
import 'package:bhagawad_geeta/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nepali_utils/nepali_utils.dart';
import 'package:velocity_x/velocity_x.dart';

final List<String> languages = ['english', 'हिन्दी', 'संस्कृत'];

class VersesScreen extends ConsumerWidget {
  const VersesScreen({
    super.key,
    required this.verseId,
    required this.chapterTitle,
    required this.chapterDescription,
  });

  final int verseId;
  final String chapterTitle;
  final String chapterDescription;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ref.watch(appThemeProvider) == ThemeMode.light
          ? Colors.amber.shade100
          : Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: chapterTitle.text.bold.white.make(),
        centerTitle: true,
        actions: [
          DropdownButton(
              value: ref.watch(appLanguageProvider),
              items: languages
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: e.text.make(),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                ref.read(appLanguageProvider.notifier).toggle(value!);
              }),
        ],
      ),
      body: Column(
        children: [
          chapterDescription.text.justify.semiBold.size(16).make(),
          const SizedBox(
            height: 12,
          ),
          Consumer(builder: (context, ref, child) {
            final activity = ref.watch(getVerseProvider(verseId));
            final appLang = ref.watch(appLanguageProvider);

            openCommentaryPopup(BuildContext context, Verse verse) async {
              await showDialog(
                  context: context,
                  builder: (_) {
                    return Dialog.fullscreen(
                      backgroundColor:
                          ref.watch(appThemeProvider) == ThemeMode.light
                              ? Colors.amber.shade100
                              : Colors.black,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.close),
                            ),
                          ).pOnly(bottom: 20),
                          ref.watch(appLanguageProvider) == 'संस्कृत' ||
                                  ref.watch(appLanguageProvider) == 'हिन्दी'
                              ? 'अध्याय ${NepaliUnicode.convert(
                                  verse.chapterNumber.toString(),
                                )}'
                                  .text
                                  .bold
                                  .size(22)
                                  .amber600
                                  .make()
                                  .py16()
                              : 'Chapter ${verse.chapterNumber.toString()}'
                                  .text
                                  .bold
                                  .size(22)
                                  .amber600
                                  .make()
                                  .py16(),
                          ref.watch(appLanguageProvider) == 'संस्कृत' ||
                                  ref.watch(appLanguageProvider) == 'हिन्दी'
                              ? verse.text.text.size(20).make().py20()
                              : verse.translation
                                  .firstWhere((element) =>
                                      element.language ==
                                      (appLang == 'हिन्दी'
                                          ? 'hindi'
                                          : 'english'))
                                  .description
                                  .text
                                  .size(20)
                                  .make()
                                  .py20(),
                          if (ref.watch(appLanguageProvider) == 'संस्कृत')
                            ListTile(
                              title: verse.text.text.size(18).make().py20(),
                            )
                          else
                            ListTile(title: verse.commentary
                                .firstWhere((element) =>
                                    element.language ==
                                    (appLang == 'हिन्दी' ? 'hindi' : 'english'))
                                .description
                                .text
                                .size(18)
                                .make()
                                .py20(),)
                        ],
                      ).p32().scrollVertical(),
                    );
                  });
            }

            return switch (activity) {
              AsyncData(:final value) => Column(
                  children: [
                    ListView.builder(
                      itemCount: value.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ListTile(
                        title: Text.rich(
                          TextSpan(
                            children: [
                              switch (appLang) {
                                'sanskrit' =>
                                  'स्लोक ${NepaliUnicode.convert(value[index].verseNumber.toString())} :- \n\n'
                                      .textSpan
                                      .bold
                                      .amber600
                                      .size(16)
                                      .make(),
                                'english' =>
                                  'Verse: ${value[index].verseNumber} :- \n\n'
                                      .textSpan
                                      .bold
                                      .amber600
                                      .size(16)
                                      .make(),
                                'hindi' =>
                                  'स्लोक ${NepaliUnicode.convert(value[index].verseNumber.toString())} :- \n\n'
                                      .textSpan
                                      .bold
                                      .amber600
                                      .size(16)
                                      .make(),
                                _ =>
                                  'स्लोक ${NepaliUnicode.convert(value[index].verseNumber.toString())} :- \n\n'
                                      .textSpan
                                      .bold
                                      .amber600
                                      .size(18)
                                      .make(),
                              },
                              appLang == 'संस्कृत'
                                  ? value[index].text.textSpan.bold.make()
                                  : value[index]
                                      .translation
                                      .firstWhere(
                                        (element) =>
                                            element.language ==
                                            (appLang == 'हिन्दी'
                                                ? 'hindi'
                                                : 'english'),
                                      )
                                      .description
                                      .textSpan
                                      .bold
                                      .make(),
                            ],
                          ),
                        ),
                        onTap: () async =>
                            openCommentaryPopup(context, value[index]),
                      ).py16(),
                    ),
                  ],
                ),
              AsyncError() => activity.error.toString().text.red500.bold.make(),
              _ => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
            };
          })
        ],
      ).p20().scrollVertical(),
    );
  }
}
