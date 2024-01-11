// import 'package:flutter/material.dart';
//
// import '../widget/diagnostics_item_button.dart';
// import '../widget/drop_down_button.dart';
// import '../widget/user_info_box.dart';
//
// class UserInfo extends StatefulWidget {
//   const UserInfo({super.key});
//
//   @override
//   State<UserInfo> createState() => _UserInfoState();
// }
//
// class _UserInfoState extends State<UserInfo> {
//   @override
//   Widget build(BuildContext context) {
//     const userInfoTextStyle = TextStyle(
//       fontSize: 17,
//       fontWeight: FontWeight.bold,
//       color: Color.fromRGBO(153, 0, 153, 1),
//     );
//
//     const h3 = TextStyle(
//       fontSize: 18,
//       fontWeight: FontWeight.bold,
//     );
//
//     return Column(
//       children: [
//         Container(
//           child: Row(
//             children: [
//               Text(
//                 'Age',
//                 style: userInfoTextStyle,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               UserInfoBox(
//                 title: 'age',
//                 size: 100,
//                 inputType: 'num',
//               ),
//               SizedBox(
//                 width: 40,
//               ),
//               Text(
//                 'Gender',
//                 style: userInfoTextStyle,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               MyDropdownButton(
//                 items: ['male', 'female'],
//                 value: 'male',
//               ),
//               SizedBox(
//                 width: 40,
//               ),
//               Text(
//                 'Years of education',
//                 style: userInfoTextStyle,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               UserInfoBox(
//                 title: 'education',
//                 size: 100,
//                 inputType: 'num',
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           // Row(
//           //   children: [
//           //     Text(
//           //       'Years of education',
//           //       style: userInfoTextStyle,
//           //     ),
//           //     SizedBox(
//           //       width: 10,
//           //     ),
//           //     UserInfoBox(
//           //       title: 'education',
//           //       size: 150,
//           //       inputType: 'num',
//           //     ),
//           //   ],
//           // ),
//           SizedBox(
//             height: 15,
//           ),
//           const Text(
//             'Diagnostic Item',
//             style: h3,
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           Row(
//             children: [
//               ItemButton(buttonText: 'Dementia', buttonValue: 1),
//               SizedBox(
//                 width: 40,
//               ),
//               ItemButton(buttonText: 'Depression', buttonValue: 2),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
