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
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Tarefas'),
        ),
        body: ListView(
          scrollDirection: Axis.horizontal,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Task("Aprender Flutter"),
            Task("Aprender bike"),
            Task("Aprender programação"),
            Task("Aprender programação"),
            Task("Aprender programação"),
            Task("Aprender programação"),
            Task("Aprender programação"),
            Task("Aprender programação"),
            Task("Aprender programação"),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String nomeTarefa;
  const Task(this.nomeTarefa,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            color: Colors.blue,
            height: 140,
          ),
          Container(
            color: Colors.white,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black26,
                  width: 72,
                  height: 100,
                ),
                Text(nomeTarefa),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    child: Icon(
                      Icons.arrow_drop_up,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
