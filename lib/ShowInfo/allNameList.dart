// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:exam_flutter/Data/data.dart';
import 'package:exam_flutter/ShowInfo/bloc/feed_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllNameList extends StatefulWidget {
  const AllNameList({super.key});

  @override
  State<AllNameList> createState() => _AllNameListState();
}

class _AllNameListState extends State<AllNameList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedBlocBloc(),
      child: BlocBuilder<FeedBlocBloc, FeedProvinceState>(
        buildWhen: (previous, current) =>
            previous.nameDataList != current.nameDataList,
        builder: (context, state) {
          return ListView.builder(
            itemCount: nameDataList.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(15),
                  child: ListTile(
                    title: Text(
                        '${nameDataList[index].name.toString()} ${nameDataList[index].surname.toString()}(${nameDataList[index].nickname.toString()})'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(timeagoText(nameDataList[index].date!)),
                        Text(nameDataList[index].province.toString()),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('คุณแน่ใจหรือ?'),
                            content: const Text(
                                'หากคุณลบรายชื่อนี้แล้ว คุณจะไม่สามารถกู้คืนได้อีกต่อไป!'),
                            actions: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightGreen),
                                onPressed: () {
                                  setState(() {
                                    nameDataList.removeAt(index);
                                    Navigator.pop(context);
                                  });
                                },
                                child: const Text('ยืนยัน'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('ยกเลิก',
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            ],
                          ),
                        );
                        // BlocProvider.of<FeedBlocBloc>(context)
                        //     .add(FeedProvinceEvent(nameDataList: nameDataList));
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
