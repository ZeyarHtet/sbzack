import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key key }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var diceOne = 1;
  var diceTwo = 1;

  List diceImages = [1,2,3,4,5,6];


  String picture = "images/dice1.png";

  void changeDiceOne () {
    setState(() {
     diceImages.shuffle();
     diceOne = diceImages[0];
          
        });
  }

  void changeDiceTwo () {
    setState(() {
      diceImages.shuffle();          
      diceTwo = diceImages[0];

        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dice"),),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/gress.jpg") ,fit: BoxFit.cover,
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (){
                changeDiceOne();
              },
              child: Image.asset(
               'images/dice$diceOne.png',
              width: 150,
              height: 150,
              color: Colors.black,),
            ),
              InkWell(
                onTap: (){
                  changeDiceTwo();
              },
                child: Image.asset(
                'images/dice$diceTwo.png',
                width: 150, 
                height: 150,
                color: Colors.black,),
              ),
              

          ],
        ),
      ),
    );
  }
}