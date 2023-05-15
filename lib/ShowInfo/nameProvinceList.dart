// ignore_for_file: depend_on_referenced_packages, file_names

import 'package:exam_flutter/Data/data.dart';
import 'package:exam_flutter/ShowInfo/bloc/feed_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameProvinceList extends StatefulWidget {
  const NameProvinceList({super.key});

  @override
  State<NameProvinceList> createState() => _NameProvinceListState();
}

class _NameProvinceListState extends State<NameProvinceList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedBlocBloc(),
      child: BlocBuilder<FeedBlocBloc, FeedProvinceState>(
        buildWhen: (previous, current) =>
            previous.nameDataList != current.nameDataList,
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: provinceList.length,
            itemBuilder: (context, index) {
              bool tmpProvinceName = false;
              for (var element in nameDataList) {
                if (provinceList[index] == element.province) {
                  tmpProvinceName = true;
                }
              }
              return Column(
                children: [
                  if (tmpProvinceName)
                    Container(
                      margin:
                          const EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(provinceList[index].toString()),
                          const Icon(Icons.arrow_drop_down_sharp),
                        ],
                      ),
                    ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: nameDataList.length,
                    itemBuilder: (context, indexName) {
                      if (provinceList[index] ==
                          nameDataList[indexName].province) {
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.all(15),
                          child: ListTile(
                            title: Text(
                                '${nameDataList[indexName].name.toString()} ${nameDataList[indexName].surname.toString()}(${nameDataList[indexName].nickname.toString()})'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    timeagoText(nameDataList[indexName].date!)),
                                Text(nameDataList[indexName]
                                    .province
                                    .toString()),
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
                                            nameDataList.removeAt(indexName);
                                            Navigator.pop(context);
                                          });
                                        },
                                        child: const Text('ยืนยัน'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('ยกเลิก',
                                            style:
                                                TextStyle(color: Colors.grey)),
                                      ),
                                    ],
                                  ),
                                );
                                // BlocProvider.of<FeedBlocBloc>(context).add(
                                //     FeedProvinceEvent(
                                //         nameDataList: nameDataList));
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ),
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
