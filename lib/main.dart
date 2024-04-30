import 'package:flutter/material.dart';
//import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(
        color: Colors.white,
        child: Column(
          //Primeira parte
          //alignment: AlignmentDirectional.center,
          // children: [
          //   Container(color: Colors.white,width: 350, height: 350,),
          //   Container(color: Colors.black,width: 300, height: 300,),
          //   Container(color: Colors.red,width: 150, height: 150,),
          //   Container(color: Colors.blue, width: 75, height: 75,),
          //   Container(color: Colors.yellow,width: 37, height: 37,),
          // ],
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // children: [
          //   Container(color: Colors.blue, width: 100, height: 100,),
          //   Container(color: Colors.yellow,width: 50, height: 50,)
          // ],
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.start,
          // children: [
          //   Container(color: Colors.blue, width: 100, height: 100,),
          //   Container(color: Colors.yellow,width: 50, height: 50,)
          // ],

          //segunda parte
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                )
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                ),
                Container(
                  color: Colors.yellow,
                  width: 50,
                  height: 50,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.cyan,
                  height: 50,
                  width: 50,
                ),
                Container(
                  color: Colors.pinkAccent,
                  height: 50,
                  width: 50,
                ),
                Container(
                  color: Colors.purple,
                  height: 50,
                  width: 50,
                ),
              ],
            ),
            Container(
              color: Colors.amber,
              height: 30,
              width: 3000,
              child: Text(
                'Pablo',
                style: TextStyle(color: Colors.black, fontSize: 28),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print('Você apertou obotão');
                },
                child: Text('Aperte o botão!')),
          ],

          //Abaixo está o exercicio
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // children: [
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Container(
          //         color: Colors.red,
          //         width: 100,
          //         height: 100,
          //       ),
          //       Container(
          //         color: Colors.orange,
          //         width: 100,
          //         height: 100,
          //       ),
          //       Container(
          //         color: Colors.yellow,
          //         width: 100,
          //         height: 100,
          //       )
          //     ],
          //   ),
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Container(
          //         color: Colors.green,
          //         width: 100,
          //         height: 100,
          //       ),
          //       Container(
          //         color: Colors.lightBlue,
          //         width: 100,
          //         height: 100,
          //       ),
          //       Container(
          //         color: Colors.blue,
          //         width: 100,
          //         height: 100,
          //       )
          //     ],
          //   ),
          //   Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Container(
          //         color: Colors.purple,
          //         width: 100,
          //         height: 100,
          //       ),
          //       Container(
          //         color: Colors.pinkAccent,
          //         width: 100,
          //         height: 100,
          //       ),
          //       Container(
          //         color: Colors.black,
          //         width: 100,
          //         height: 100,
          //       )
          //     ],
          //   )
          // ]
        ),
      ),
    );
  }
}
