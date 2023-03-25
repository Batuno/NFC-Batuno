import 'package:app/view/app.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(await App.withDependency());
}
// import 'package:flutter/material.dart';

// class SearchAdd extends StatelessWidget {
//   const SearchAdd({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.grey[300],
//         body: Center(
//           child: Container(
//             padding: const EdgeInsets.all(50),
//             decoration: BoxDecoration(
//               color: Colors.grey[300],
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
  //                 //bottom right is darker
  //                 BoxShadow(
  //                   color: Colors.grey.shade500,
  //                   offset: const Offset(4, 4),
  //                   blurRadius: 15,
  //                   spreadRadius: 1,
  //                 ),
  //                 //top left is lighter
  //                 const BoxShadow(
  //                   color: Colors.white,
  //                   offset: Offset(-4, -4),
  //                   blurRadius: 15,
  //                   spreadRadius: 1,
  //                 ),
//               ],
//             ),
//             child: const Text("hello"),
//           ),
//         ),
//       ),
//     );
//   }
// }
