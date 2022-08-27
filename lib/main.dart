// import 'dart:math';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var numImages = [1, 2, 3, 4, 5, 6, 7, 8, 9];
//   var numOne = 1;
//   var numTwo = 1;
//   var numThree = 1;
//   bool check = null;
//   int score = 0;

//   chooseNum() {
//     var chooseNum = numImages.sublist(1, 4);
//     final _random = new Random();
//     int req_num = chooseNum[_random.nextInt(chooseNum.length)];
//     int randomnumber = _random.nextInt(4);
//     if (randomnumber == 1) {
//       numOne = req_num;
//     } else if (randomnumber == 2) {
//       numTwo = req_num;
//     } else if (randomnumber == 3) {
//       numThree = req_num;
//     } else {
//       numOne = req_num;
//     }
//     print(randomnumber);
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Text(
//           "Choose the Number $req_num",
//           style: TextStyle(
//             fontSize: 20,
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             InkWell(
//               onTap: () {
//                 if (req_num == numOne) {
//                   check = true;
//                 } else {
//                   check = false;
//                 }
//                 setState(() {});
//               },
//               child: Image.asset(
//                 'images/num$numOne.png',
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 if (req_num == numTwo) {
//                   check = true;
//                 } else {
//                   check = false;
//                 }
//                 setState(() {});
//               },
//               child: Image.asset(
//                 'images/num$numTwo.png',
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 if (req_num == numThree) {
//                   check = true;
//                 } else {
//                   check = false;
//                 }
//                 setState(() {});
//               },
//               child: Image.asset(
//                 'images/num$numThree.png',
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Myanmar Number"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             chooseNum(),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   check = null;
//                   numImages.shuffle();
//                 });
//               },
//               child: Text("Refresh"),
//             ),
//             check == true
//                 ? Text("Your answer is correct")
//                 : check == false
//                     ? Text("Your answe is incorrect")
//                     : Container()
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var engNumber = 4;
  var firstImage = 2;
  var secondImage = 4;
  var thirdImage = 6;

  List myanmarNumList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  // var a;
  // var b;
  // var c;
  var showAnswer = '';

  void getRandom() {
    myanmarNumList.shuffle();
    firstImage = myanmarNumList[0];
    secondImage = myanmarNumList[1];
    thirdImage = myanmarNumList[2];
    print(firstImage);
    print(secondImage);
    print(thirdImage);
    var answerList = [firstImage, secondImage, thirdImage];
    answerList.shuffle();
    engNumber = answerList[0];
  }

  void chechAnswer(int cardNumber) {
    if (engNumber == cardNumber) {
      showAnswer = "your ans is correct";
    } else {
      showAnswer = 'your ans is wrong.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Learn Myanmar Number")),
      body: Center(
          child: Column(
        children: [
          Text("Select the number $engNumber"),
          InkWell(
            onTap: () {
              print(">>>>>>>>>>>>>>>>>>>>>>>");
              setState(() {
                chechAnswer(firstImage);
                getRandom();
              });
            },
            child: Image.asset(
              'images/$firstImage.png',
              height: 150,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                chechAnswer(secondImage);
                getRandom();
              });
            },
            child: Image.asset('images/$secondImage.png', height: 150),
          ),
          InkWell(
            onTap: () {
              setState(() {
                chechAnswer(thirdImage);
                getRandom();
              });
            },
            child: Image.asset(
              'images/$thirdImage.png',
              height: 150,
            ),
          ),
          Text(showAnswer),
        ],
      )),
    );
  }
}
