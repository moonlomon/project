// // ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       body: IPhone141(),
//     ),
//   ));
// }
//
// class IPhone141 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Stack(
//         key: Key(
//           "iPhone 14 - 1 (1:8)",
//         ),
//         children: [
//           Positioned(
//             left: 51,
//             top: 60,
//             child: Container(
//               key: Key(
//                 child: Container(
//                   "Rectangle 1 (1:10)",
//                 ),
//                 width: 351,
//                 height: 195,
//                 decoration: BoxDecoration(
//                   color: Color(
//                     0xffd9d9d9,
//                   ),
//                 ),
//               ),
//               width: 351,
//               height: 195,
//               decoration: BoxDecoration(
//                 color: Color(
//                   0xffd9d9d9,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             left: 90.5,
//             top: 157,
//             child: Image.network(
//               "grida://assets-reservation/images/2:2",
//               width: 271,
//               height: 71,
//               key: Key(
//                 "Ellipse 1 (2:2)",
//               ),
//             ),
//           ),
//           Positioned(
//             left: 87,
//             top: 99,
//             child: SizedBox(
//               child: Text(
//                 "소환사이름",
//                 key: Key(
//                   "소환사이름 (2:4)",
//                 ),
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontFamily: "Inter",
//                   letterSpacing: 0,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               width: 99,
//               height: 23,
//             ),
//           ),
//           Positioned(
//             left: 263,
//             top: 99,
//             child: SizedBox(
//               child: Text(
//                 "티어",
//                 key: Key(
//                   "티어 (2:5)",
//                 ),
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontFamily: "Inter",
//                   letterSpacing: 0,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               width: 99,
//               height: 24,
//             ),
//           ),
//           Positioned(
//             left: 56,
//             top: 296,
//             child: Container(
//               child: Container(
//                 key: Key(
//                   "Rectangle 2 (2:6)",
//                 ),
//                 width: 96,
//                 height: 248,
//                 decoration: BoxDecoration(
//                   color: Color(
//                     0xffd9d9d9,
//                   ),
//                 ),
//               ),
//               width: 96,
//               height: 248,
//               decoration: BoxDecoration(
//                 color: Color(
//                   0xffd9d9d9,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             left: 179,
//             top: 296,
//             child: Container(
//               child: Container(
//                 key: Key(
//                   "Rectangle 3 (2:7)",
//                 ),
//                 width: 96,
//                 height: 248,
//                 decoration: BoxDecoration(
//                   color: Color(
//                     0xffd9d9d9,
//                   ),
//                 ),
//               ),
//               width: 96,
//               height: 248,
//               decoration: BoxDecoration(
//                 color: Color(
//                   0xffd9d9d9,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             left: 306,
//             top: 296,
//             child: Container(
//               child: Container(
//                 key: Key(
//                   "Rectangle 4 (2:8)",
//                 ),
//                 width: 96,
//                 height: 248,
//                 decoration: BoxDecoration(
//                   color: Color(
//                     0xffd9d9d9,
//                   ),
//                 ),
//               ),
//               width: 96,
//               height: 248,
//               decoration: BoxDecoration(
//                 color: Color(
//                   0xffd9d9d9,
//                 ),
//               ),
//             ),
//           ),
//
//           /// stack requires empty non positioned widget to work properly. refer: https://github.com/flutter/flutter/issues/49631#issuecomment-582090992
//           Container(),
//         ],
//       ),
//       padding: EdgeInsets.symmetric(),
//       decoration: BoxDecoration(
//         color: Colors.white,
//       ),
//     );
//   }
// }
