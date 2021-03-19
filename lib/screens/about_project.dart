import 'package:flutter/material.dart';
import 'package:travel_in_laos/utility/my_style.dart';

class AboutProject extends StatefulWidget {
  @override
  _AboutProjectState createState() => _AboutProjectState();
}

class _AboutProjectState extends State<AboutProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyStyle().lightColor,
      appBar: AppBar(
        backgroundColor: MyStyle().darkColor,
        title: MyStyle().textWhite('ກ່ຽວກັບແອັບພິເຄຊັນ'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Center(
            child: MyStyle().titleH1('Travel in Laos'),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: MyStyle().textBlack(
                'App ນີ້ເປັນສ້າງຂື້ນມາເພື່ອເປັນ Project Final ຂອງວິຊາ ແນະນຳສູ່ລະບົບເປັນດອຍ ພາຍໃຕ້ການນໍາພາຂອງອາຈານປະຈຳວິຊາ ຊອ.ປທ ສິດທິພອນ ພັນດາລາ'),
          ),
          Center(
            child: MyStyle().textDark('ຈຸດປະສົງ ແລະ ເປົ້າໝາຍ'),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: MyStyle().textBlack(
                'ພວກເຮົາມີຈຸດປະສົງທີ່ຢາກສ້າງແອັບຂື້ນມາເພື່ອສົ່ງເສີມການທ່ອງທ່ຽວໃນລາວໃຫ້ເປັນທີ່ຮູ້ຈັກຫຼາຍຂື້ນ. ເຊິ່ງພວກເຮົາໄດ້ລວມເອົາແຫຼ່ງທ່ອງທ່ຽວທັງ 3 ພາກມາໄວ້ໃນແອັບນີ້ເພື່ອຄວາມສະດວກໃນການຄົ້ນຫາຂໍ້ມູນອີກດ້ວຍ.'),
          ),
          Center(
            child: MyStyle().textDark('ແຮງບັນດານໃຈ'),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: MyStyle().textBlack(
                'ພວກເຮົາໄດ້ແຮງບັນດານໃຈມາຈາກທີ່ຕົນເອງມັກທ່ອງທ່ຽວຢູ່ກ່ອນແລ້ວ ແຕ່ຈະໄປໃສແຕ່ລະຄັ້ງແມ່ນມີຄວາມຍາກລຳບາກໃນການຫາຂໍ້ມູນຫຼາຍເພາະຍັງບໍ່ທັນມີແອັບຫຼືເວັບທີ່ລວບລວມແຫຼ່ງທ່ອງທ່ຽວມາໄວ້ບ່ອນດຽວເທື່ອ ແລະ ນີ້ກໍຄືແຮງບັນດາໃຈ ແລະ ແຮງຜັກດັນໃນການເຮັດແອັບໃນຄັ້ງນີ້.'),
          ),
        ],
      ),
    );
  }
}
