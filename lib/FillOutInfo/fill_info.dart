// ignore_for_file: depend_on_referenced_packages

import 'package:exam_flutter/Data/data.dart';
import 'package:exam_flutter/ShowInfo/bloc/feed_bloc_bloc.dart';
import 'package:exam_flutter/ShowInfo/widget/fillFormWidget.dart';
import 'package:exam_flutter/mainApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

int currentStep = 0;
List<Step> stepperList = [];

String? name;
String? surname;
String? nickname;
String age = '6';
String? career;
String? email;
String? phoneNumber;

String? idCard;
String? birthday;
String? address;

class FillOutInformation extends StatelessWidget {
  const FillOutInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedBlocBloc(),
      child: BlocBuilder<FeedBlocBloc, FeedProvinceState>(
        buildWhen: (previous, current) =>
            previous.index != current.index ||
            previous.nameDataList != current.nameDataList,
        builder: (context, state) {
          stepperList = [
            Step(
                title: const Text('ข้อมูลส่วนตัว'),
                content: Column(
                  children: [
                    FillFormWidget(
                      title: 'ชื่อ',
                      onChangeTextFormField: (tmp) {
                        name = tmp;
                      },
                    ),
                    FillFormWidget(
                      title: 'นามสกุล',
                      onChangeTextFormField: (tmp) {
                        surname = tmp;
                      },
                    ),
                    FillFormWidget(
                      title: 'ชื่อเล่น',
                      onChangeTextFormField: (tmp) {
                        nickname = tmp;
                      },
                    ),
                    FillFormWidget(
                      title: 'อายุ',
                      onChangeTextFormField: (tmp) {
                        age = tmp;
                      },
                      isDropdown: true,
                      items: ageList,
                      valueDropdown: age,
                    ),
                    FillFormWidget(
                      title: 'อาชีพ',
                      onChangeTextFormField: (tmp) {
                        career = tmp;
                      },
                    ),
                    FillFormWidget(
                      title: 'อีเมล',
                      onChangeTextFormField: (tmp) {
                        email = tmp;
                      },
                    ),
                    FillFormWidget(
                      title: 'เบอร์โทรศัพท์',
                      maxLength: 10,
                      onChangeTextFormField: (tmp) {
                        phoneNumber = tmp;
                      },
                    )
                  ],
                ),
                isActive: currentStep == 0,
                state:
                    currentStep == 0 ? StepState.editing : StepState.complete),
            Step(
                title: const Text('ข้อมูลตามบัตรประชาชน'),
                content: Column(
                  children: [
                    FillFormWidget(
                      title: 'เลขประจำตัวประชาชน / Passport',
                      maxLength: 13,
                      onChangeTextFormField: (tmp) {
                        idCard = tmp;
                      },
                    ),
                    FillFormWidget(
                      title: 'วันเดือนปีเกิด',
                      onChangeTextFormField: (tmp) {
                        birthday = tmp;
                      },
                    ),
                    FillFormWidget(
                      title: 'ที่อยู่',
                      onChangeTextFormField: (tmp) {
                        address = tmp;
                      },
                    ),
                  ],
                ),
                isActive: currentStep >= 1,
                state: currentStep >= 1 ? StepState.editing : StepState.indexed)
          ];

          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 72, 230, 222),
              centerTitle: true,
              title: const Text(
                'กรอกข้อมูลส่วนตัว',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            ),
            body: SafeArea(
              child: Stepper(
                type: StepperType.vertical,
                steps: stepperList,
                currentStep: currentStep,
                onStepContinue: () {
                  if (currentStep < 1) {
                    // Part - Personal information
                    if ((name != '' && name != null) &&
                        (surname != '' && surname != null) &&
                        (nickname != '' && nickname != null) &&
                        (career != '' && career != null) &&
                        (email != '' && email != null) &&
                        (phoneNumber != '' && phoneNumber != null)) {
                      currentStep += 1;
                      BlocProvider.of<FeedBlocBloc>(context).add(
                        FeedProvinceEvent(
                          index: currentStep,
                          nameDataList: stepperList,
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: (name == '' || name == null)
                              ? const Text('กรุณากรอกชื่อของคุณ')
                              : (surname == '' || surname == null)
                                  ? const Text('กรุณากรอกนามสกุลของคุณ')
                                  : (nickname == '' || nickname == null)
                                      ? const Text('กรุณากรอกชื่อเล่นของคุณ')
                                      : (career == '' || career == null)
                                          ? const Text('กรุณากรอกอาชีพของคุณ')
                                          : const Text(
                                              'กรุณากรอกเบอร์โทรศัพท์ของคุณ'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('ตกลง'),
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    // Part - IDCard information
                    if ((idCard != '' && idCard != null) &&
                        (birthday != '' && birthday != null) &&
                        (address != '' && address != null)) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('ยืนยันข้อมูลใช่หรือไม่?'),
                          content: const Text(
                              'หากยืนยันข้อมูลดังกล่าวแล้ว จะไม่สามารถกลับมาแก้ไขย้อนหลังได้!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                currentStep = 0;
                                numIndex = 2;
                                personalDataList.add(
                                  Data(
                                    address: address,
                                    age: age,
                                    birthday: birthday,
                                    career: career,
                                    email: email,
                                    idCard: idCard,
                                    name: name,
                                    nickname: nickname,
                                    phoneNumber: phoneNumber,
                                    surname: surname,
                                  ),
                                );

                                name = '';
                                surname = '';
                                nickname = '';
                                career = '';
                                email = '';
                                phoneNumber = '';
                                idCard = '';
                                birthday = '';
                                address = '';

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainApp(),
                                    ));
                              },
                              child: const Text('ตกลง'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'ยกเลิก',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: (idCard == '' || idCard == null)
                              ? const Text('กรุณากรอกบัตรประจำตัวประชาชนของคุณ')
                              : (birthday == '' || birthday == null)
                                  ? const Text('กรุณากรอกวันเกิดของคุณ')
                                  : const Text('กรุณากรอกที่อยู่ของคุณ'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('ตกลง'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
                onStepCancel: () {
                  if (currentStep >= 1) {
                    currentStep -= 1;
                    BlocProvider.of<FeedBlocBloc>(context).add(
                      FeedProvinceEvent(
                        index: currentStep,
                        nameDataList: stepperList,
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
