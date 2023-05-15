import 'package:exam_flutter/Data/data.dart';
import 'package:flutter/material.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 72, 230, 222),
        centerTitle: true,
        title: const Text(
          'ประวัติข้อมูลส่วนตัว',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: personalDataList.length,
          itemBuilder: (context, index) {
            return informationPerson(
                personalDataList[index].name,
                personalDataList[index].surname,
                personalDataList[index].nickname,
                personalDataList[index].age,
                personalDataList[index].career,
                personalDataList[index].email,
                personalDataList[index].phoneNumber,
                personalDataList[index].idCard,
                personalDataList[index].birthday,
                personalDataList[index].address);
          },
        ),
      ),
    );
  }
}

Card informationPerson(
    String? name,
    String? surname,
    String? nickname,
    String? age,
    String? career,
    String? email,
    String? phoneNumber,
    String? idCard,
    String? birthday,
    String? address) {
  return Card(
    color: const Color.fromARGB(255, 255, 245, 213),
    margin: const EdgeInsets.all(10),
    elevation: 3,
    child: Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'ชื่อ-นามสกุล : ',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                "${name!} ${surname!}",
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'ชื่อเล่น : ',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                nickname!,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'อายุ : ',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                age!,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'เลขบัตรประจำตัวประชาชน : ',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                idCard!,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'วันเดือนปีเกิด : ',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                birthday!,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'ที่อยู่ : ',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                address!,
                style: const TextStyle(fontSize: 15),
                maxLines: null,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'อาชีพ : ',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                career!,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'อีเมล : ',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                email!,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                'เบอร์โทรศัพท์ : ',
                style: TextStyle(fontSize: 17),
              ),
              Text(
                phoneNumber!,
                style: const TextStyle(fontSize: 17),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
