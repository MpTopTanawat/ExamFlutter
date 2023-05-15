// ignore_for_file: file_names

import 'package:exam_flutter/Data/data.dart';
import 'package:exam_flutter/ShowInfo/allNameList.dart';
import 'package:exam_flutter/ShowInfo/nameProvinceList.dart';
import 'package:exam_flutter/ShowInfo/widget/fillFormWidget.dart';
import 'package:flutter/material.dart';

String? name;
String? surname;
String? nickname;
String? province;

class ShowInformation extends StatefulWidget {
  const ShowInformation({super.key});

  @override
  State<ShowInformation> createState() => _ShowInformationState();
}

class _ShowInformationState extends State<ShowInformation> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 72, 230, 222),
          centerTitle: true,
          title: const Text(
            'รายการชื่อ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          bottom: TabBar(
            overlayColor: MaterialStateProperty.resolveWith((states) =>
                states.contains(MaterialState.pressed)
                    ? Colors.orange
                    : Colors.green),
            labelColor: const Color.fromARGB(255, 26, 168, 10),
            indicatorColor: Colors.orange,
            unselectedLabelColor: Colors.white,
            tabs: const [
              Tab(
                icon: Icon(Icons.home),
                text: 'รายชื่อทั้งหมด',
              ),
              Tab(
                icon: Icon(Icons.article_outlined),
                text: 'รายชื่อในแต่ละจังหวัด',
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: AlertDialog(
                    title: const Text('สร้างรายชื่อใหม่',
                        textAlign: TextAlign.center),
                    backgroundColor: const Color.fromARGB(255, 157, 250, 255),
                    content: Column(
                      children: [
                        FillFormWidget(
                          title: 'ชื่อ',
                          maxLength: 40,
                          onChangeTextFormField: (tmp) {
                            name = tmp;
                          },
                        ),
                        FillFormWidget(
                          title: 'นามสกุล',
                          maxLength: 40,
                          onChangeTextFormField: (tmp) {
                            surname = tmp;
                          },
                        ),
                        FillFormWidget(
                          title: 'ชื่อเล่น',
                          maxLength: 40,
                          onChangeTextFormField: (tmp) {
                            nickname = tmp;
                          },
                        ),
                        FillFormWidget(
                            title: 'จังหวัด',
                            isDropdown: true,
                            items: provinceList),
                      ],
                    ),
                    actionsAlignment: MainAxisAlignment.spaceBetween,
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen),
                        onPressed: () {
                          if ((name != '' && name != null) &&
                              (surname != '' && surname != null) &&
                              (nickname != '' && nickname != null)) {
                            setState(() {
                              nameDataList.add(
                                Data(
                                  name: name,
                                  surname: surname,
                                  nickname: nickname,
                                  province: provinceList[0],
                                  date: DateTime.now(),
                                ),
                              );
                              name = '';
                              surname = '';
                              nickname = '';
                            });
                            Navigator.pop(context);
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: (name == '' || name == null)
                                    ? const Text('กรุณากรอกชื่อของคุณ')
                                    : (surname == '' || surname == null)
                                        ? const Text('กรุณากรอกนามสกุลของคุณ')
                                        : const Text('กรุณากรอกชื่อเล่นของคุณ'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('ตกลง'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: const Text('ยืนยัน'),
                      ),
                      TextButton(
                        onPressed: () {
                          name = '';
                          surname = '';
                          nickname = '';
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'ยกเลิก',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          backgroundColor: Colors.amberAccent,
          child: const Icon(Icons.add),
        ),
        body: const TabBarView(
          children: [
            AllNameList(),
            NameProvinceList(),
          ],
        ),
      ),
    );
  }
}
