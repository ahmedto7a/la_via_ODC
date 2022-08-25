import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          'Notification',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0.0,
      ),
      body:   SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child:
        Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          buildRow('John Hammond created Isla Nublar SOC2 compliance report ',
              'Yesterday at 11:42 PM'),
          buildRow(
              'Dennis Nedry commented on Isla Nublar SOC2 compliance report    ',
              '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”'),
          buildRow('John Hammond created Isla Nublar SOC2 compliance report ',
              'Yesterday at 11:42 PM'),
          buildRow(
              'Dennis Nedry commented on Isla Nublar SOC2 compliance report    ',
              '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”'),
          buildRow('John Hammond created Isla Nublar SOC2 compliance report ',
              'Yesterday at 11:42 PM'),
          buildRow(
              'Dennis Nedry commented on Isla Nublar SOC2 compliance report',
              ' leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.'),
          buildRow('John Hammond created Isla Nublar SOC2 compliance report ',
              'Yesterday at 11:42 PM'),
          buildRow(
              'Dennis Nedry commented on Isla Nublar SOC2 compliance report',
              '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”'),
          buildRow('John Hammond created Isla Nublar SOC2 compliance report ',
              'Yesterday at 11:42 PM'),
          buildRow(
              'Dennis Nedry commented on Isla Nublar SOC2 compliance report ',
              '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”'),
          buildRow('John Hammond created Isla Nublar SOC2 compliance report ',
              'Yesterday at 11:42 PM'),
          buildRow('John Hammond created Isla Nublar SOC2 compliance report ',
              'Yesterday at 11:42 PM'),
          buildRow(
              'Dennis Nedry commented on Isla Nublar SOC2 compliance report    ',
              '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”'),
        ]),
      ),




    //   Center(
    // child: TweenAnimationBuilder(
    // tween: Tween<double>(begin: 0, end: 1),
    // duration: Duration(milliseconds: 2000),
    // builder: (BuildContext context, double _value, child) {
    // return Opacity(
    // opacity: _value,
    // child: Padding(
    // padding: EdgeInsets.only(bottom: _value * 50),
    // child: child,
    // ),
    // );
    // },
    // )
    //   ),
    );
  }
}
// import 'package:flutter/material.dart';
//
// class Notifi extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//
// //     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Notification',
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         elevation: 0.0,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(18),
//         child:
//         Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//           buildRow('John Hammond created Isla Nublar SOC2 compliance report ',
//               'Yesterday at 11:42 PM'),
//           buildRow(
//               'Dennis Nedry commented on Isla Nublar SOC2 compliance report    ',
//               '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”'),
//           buildRow('John Hammond created Isla Nublar SOC2 compliance report ',
//               'Yesterday at 11:42 PM'),
//           buildRow(
//               'Dennis Nedry commented on Isla Nublar SOC2 compliance report    ',
//               '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”'),
//           buildRow('John Hammond created Isla Nublar SOC2 compliance report ',
//               'Yesterday at 11:42 PM'),
//           buildRow(
//               'Dennis Nedry commented on Isla Nublar SOC2 compliance report',
//               ' leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.'),
//           buildRow('John Hammond created Isla Nublar SOC2 compliance report ',
//               'Yesterday at 11:42 PM'),
//           buildRow(
//               'Dennis Nedry commented on Isla Nublar SOC2 compliance report',
//               '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”'),
//           buildRow('John Hammond created Isla Nublar SOC2 compliance report ',
//               'Yesterday at 11:42 PM'),
//           buildRow(
//               'Dennis Nedry commented on Isla Nublar SOC2 compliance report ',
//               '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”'),
//           buildRow('John Hammond created Isla Nublar SOC2 compliance report ',
//               'Yesterday at 11:42 PM'),
//           buildRow('John Hammond created Isla Nublar SOC2 compliance report ',
//               'Yesterday at 11:42 PM'),
//           buildRow(
//               'Dennis Nedry commented on Isla Nublar SOC2 compliance report    ',
//               '“ leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.”'),
//         ]),
//       ),
//     );
//   }

  Widget buildRow(String texthead, String date) {
    return Row(
      children: [
        CircleAvatar(
          foregroundImage: AssetImage('assets/images/img_avatar2.png'),
        ),
        SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                texthead,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis),
              ),


              SizedBox(
                height: 5,
              ),
              Text(
                date,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                height: 15,
                endIndent: 0,
                indent: 0.0,
              ),

            ],
          ),
        )
      ],
    );
  }