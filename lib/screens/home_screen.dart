import 'package:bhagawad_geeta/model/chapter.dart';
import 'package:bhagawad_geeta/providers/http_provider.dart';
import 'package:bhagawad_geeta/service/http.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Chapter>> future;

  @override
  void initState() {
    super.initState();
    future = HttpService.instance.getChapters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Consumer(builder: (context, ref, child) {
          final activity = ref.watch(getChapterProvider);
          return SizedBox(
            child: switch (activity) {
              AsyncData(:final value) => ListView.builder(
                  itemCount: value.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) => Card(
                    child: ListTile(
                      title: value[index].name.text.make(),
                      subtitle: value[index].nameMeaning.text.make(),
                      leading: value[index].id.text.make(),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                ),
              AsyncError() => activity.error.toString().text.red500.bold.make(),
              _ => const CircularProgressIndicator.adaptive(),
            },
          );
        }));
  }
}
