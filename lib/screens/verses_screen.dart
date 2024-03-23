import 'package:bhagawad_geeta/providers/http_provider.dart';
import 'package:bhagawad_geeta/providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:velocity_x/velocity_x.dart';

class VersesScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: chapterTitle.text.bold.white.make(),
        centerTitle: true,
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
            return switch (activity) {
              AsyncData(:final value) => ListView.builder(
                  itemCount: value.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      leading: value[index].id.text.make(),
                      title: value[index].text.text.make(),
                      subtitle:
                          value[index].translation.firstWhere((element) => element.language == appLang).description.text.make(),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                      ),
                    ),
                  ).py16(),
                ).expand(),
              AsyncError() => activity.error.toString().text.red500.bold.make(),
              _ => const Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
            };
          })
        ],
      ).p20(),
    );
  }
}
