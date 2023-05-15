// ignore_for_file: depend_on_referenced_packages

import 'package:timeago/timeago.dart' as timeago;

class Data {
  final String? name;
  final String? surname;
  final String? nickname;
  final DateTime? date;
  final String? province;

  final String? age;
  final String? career;
  final String? email;
  final String? phoneNumber;

  final String? idCard;
  final String? birthday;
  final String? address;

  Data({
    this.name,
    this.surname,
    this.nickname,
    this.date,
    this.province,
    this.age,
    this.career,
    this.email,
    this.phoneNumber,
    this.idCard,
    this.address,
    this.birthday,
  });
}

List<Data> nameDataList = [
  Data(
    name: 'nick11',
    surname: 'nat',
    nickname: 'N',
    date: DateTime.now(),
    province: "เชียงราย",
  ),
  Data(
    name: 'nick21',
    surname: 'nat',
    nickname: 'P',
    date: DateTime.now(),
    province: "กรุงเทพมหานคร",
  ),
  Data(
    name: 'nick31',
    surname: 'nat',
    nickname: 'M',
    date: DateTime.now(),
    province: "กรุงเทพมหานคร",
  ),
  Data(
    name: 'nick41',
    surname: 'nat',
    nickname: 'O',
    date: DateTime.now(),
    province: "ภูเก็ต",
  ),
  Data(
    name: 'nick51',
    surname: 'nat',
    nickname: 'B',
    date: DateTime.now(),
    province: "กระบี่",
  ),
  Data(
    name: 'nick61',
    surname: 'nat',
    nickname: 'A',
    date: DateTime.now(),
    province: "พะเยา",
  ),
  Data(
    name: 'nick225',
    surname: 'nat',
    nickname: 'G',
    date: DateTime.now(),
    province: "สระแก้ว",
  ),
  Data(
    name: 'nick6452',
    surname: 'nat',
    nickname: 'J',
    date: DateTime.now(),
    province: "น่าน",
  ),
]; // HomePage Province

List<Data> personalDataList = [
  Data(
    name: 'nicky27',
    surname: 'nat79',
    nickname: 'M',
    age: '35',
    career: 'ช่างเชื่อม',
    email: 'abcd@gmail.com',
    phoneNumber: '0812345679',
    idCard: '1234567891235',
    address:
        '8888 ถ. ลูกรัง ซอย ลูกนก เขต ตัดใหม่ \nแขวง แยกคลองน่านน้ำ จังหวัด กรุงเทพมหานคร',
    birthday: '29 กุมภาพันธ์ 1988',
  ),
  Data(
    name: 'nicky88',
    surname: 'nat68',
    nickname: 'O',
    age: '35',
    career: 'ช่างประปา',
    email: 'abc@gmail.com',
    phoneNumber: '0812345678',
    idCard: '1234567891237',
    address:
        '7777 ถ. ลูกรัง ซอย ลูกนก เขต ตัดใหม่ \nแขวง แยกคลองน่านน้ำ จังหวัด บึงกาฬ',
    birthday: '28 มีนาคม 1988',
  ),
  Data(
    name: 'nicky22',
    surname: 'nat64',
    nickname: 'P',
    age: '35',
    career: 'ช่างอิฐ',
    email: 'abd@gmail.com',
    phoneNumber: '0812345677',
    idCard: '1234567891234',
    address:
        '6666 ถ. ลูกรัง ซอย ลูกนก เขต ตัดใหม่ \nแขวง แยกคลองน่านน้ำ จังหวัด กาฬสินธุ์',
    birthday: '27 มกราคม 1988',
  ),
  Data(
    name: 'nicky64',
    surname: 'nat34',
    nickname: 'Q',
    age: '35',
    career: 'ช่างไม้',
    email: 'acd@gmail.com',
    phoneNumber: '0812345676',
    idCard: '1234567891238',
    address:
        '5555 ถ. ลูกรัง ซอย ลูกนก เขต ตัดใหม่ \nแขวง แยกคลองน่านน้ำ จังหวัด ชัยนาท',
    birthday: '26 พฤษภาคม 1988',
  ),
  Data(
    name: 'nicky25',
    surname: 'nat83',
    nickname: 'S',
    age: '35',
    career: 'ช่างยนต์',
    email: 'bcd@gmail.com',
    phoneNumber: '0812345675',
    idCard: '1234567891233',
    address:
        '4 ถ. ลูกรัง ซอย ลูกนก เขต ตัดใหม่ \nแขวง แยกคลองน่านน้ำ จังหวัด ชลบุรี',
    birthday: '25 กุมภาพันธ์ 1988',
  ),
  Data(
    name: 'nicky92',
    surname: 'nat71',
    nickname: 'T',
    age: '35',
    career: 'วิศวกร',
    email: 'abcdefg@gmail.com',
    phoneNumber: '0812345674',
    idCard: '1234567891232',
    address:
        '258/88875 ถ. ลูกรัง ซอย ลูกนก เขต ตัดใหม่ \nแขวง แยกคลองน่านน้ำ จังหวัด สิงห์บุรี',
    birthday: '24 เมษายน 1988',
  ),
]; // Personal Information Page

String timeagoText(DateTime datetime) {
  var dateNow = DateTime.now(); // เวลาที่อยู่ในเครื่อง
  var diffTime = dateNow.difference(datetime);
  // เอาเวลาที่อยู่ในเครื่อง(date_now) เทียบกับ เวลาที่โพสถูกสร้างขึ้น
  var subTimeAgo = dateNow.subtract(diffTime);
  var timeAgo = timeago.format(subTimeAgo, locale: 'th');

  return timeAgo;
}

List<String> ageList = [for (int i = 6; i <= 100; i++) '$i'];

List<String> provinceList = [
  "กรุงเทพมหานคร",
  "กระบี่",
  "กาญจนบุรี",
  "กาฬสินธุ์",
  "กำแพงเพชร",
  "ขอนแก่น",
  "จันทบุรี",
  "ฉะเชิงเทรา",
  "ชลบุรี",
  "ชัยนาท",
  "ชัยภูมิ",
  "ชุมพร",
  "เชียงราย",
  "เชียงใหม่",
  "ตรัง",
  "ตราด",
  "ตาก",
  "นครนายก",
  "นครปฐม",
  "นครพนม",
  "นครราชสีมา",
  "นครศรีธรรมราช",
  "นครสวรรค์",
  "นนทบุรี",
  "นราธิวาส",
  "น่าน",
  "บึงกาฬ",
  "บุรีรัมย์",
  "ปทุมธานี",
  "ประจวบคีรีขันธ์",
  "ปราจีนบุรี",
  "ปัตตานี",
  "พระนครศรีอยุธยา",
  "พังงา",
  "พัทลุง",
  "พิจิตร",
  "พิษณุโลก",
  "เพชรบุรี",
  "เพชรบูรณ์",
  "แพร่",
  "พะเยา",
  "ภูเก็ต",
  "มหาสารคาม",
  "มุกดาหาร",
  "แม่ฮ่องสอน",
  "ยะลา",
  "ยโสธร",
  "ร้อยเอ็ด",
  "ระนอง",
  "ระยอง",
  "ราชบุรี",
  "ลพบุรี",
  "ลำปาง",
  "ลำพูน",
  "เลย",
  "ศรีสะเกษ",
  "สกลนคร",
  "สงขลา",
  "สตูล",
  "สมุทรปราการ",
  "สมุทรสงคราม",
  "สมุทรสาคร",
  "สระแก้ว",
  "สระบุรี",
  "สิงห์บุรี",
  "สุโขทัย",
  "สุพรรณบุรี",
  "สุราษฎร์ธานี",
  "สุรินทร์",
  "หนองคาย",
  "หนองบัวลำภู",
  "อ่างทอง",
  "อุดรธานี",
  "อุทัยธานี",
  "อุตรดิตถ์",
  "อุบลราชธานี",
  "อำนาจเจริญ"
];
