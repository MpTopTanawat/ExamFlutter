// ignore_for_file: depend_on_referenced_packages, file_names

import 'dart:async';

import 'package:exam_flutter/FillOutInfo/fill_info.dart';
import 'package:exam_flutter/Personal_Info/personal_info.dart';
import 'package:exam_flutter/ShowInfo/ShowInfo.dart';
import 'package:exam_flutter/ShowInfo/bloc/feed_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<Widget> items = [
  const Icon(
    Icons.home,
    size: 36,
  ),
  const Icon(
    Icons.group,
    size: 36,
  ),
  const Icon(
    Icons.person_outline,
    size: 36,
  ),
];
List listPage = [
  const Center(
    child: ShowInformation(),
  ),
  const Center(
    child: FillOutInformation(),
  ),
  const Center(
    child: PersonalInformation(),
  ),
];

int numIndex = 0;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedBlocBloc(),
      child: BlocBuilder<FeedBlocBloc, FeedProvinceState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
              height: 55,
              items: items,
              index: numIndex,
              animationCurve: Curves.easeInToLinear,
              buttonBackgroundColor: Colors.amber,
              backgroundColor: Colors.grey.shade200,
              color: const Color.fromARGB(119, 21, 227, 242),
              onTap: (index) {
                Timer.periodic(const Duration(milliseconds: 50), (timer) {
                  numIndex = index;
                  BlocProvider.of<FeedBlocBloc>(context)
                      .add(FeedProvinceEvent(index: numIndex));
                  timer.cancel();
                });
              },
            ),
            body: listPage.elementAt(numIndex),
          );
        },
      ),
    );
  }
}
