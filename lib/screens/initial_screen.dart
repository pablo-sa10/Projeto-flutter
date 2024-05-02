import 'package:flutter/material.dart';
import 'package:projeto_dart/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.blue,
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          scrollDirection: Axis.vertical,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Task("Aprender Flutter", "assets/images/bird.jpg", 3),
            Task("Aprender bike", "assets/images/bird.jpg", 2),
            Task("Aprender programação", "assets/images/bird.jpg", 5),
            Task("Aprender a dançar", "assets/images/bird.jpg", 4),
            Task("Aprender a tocar", "assets/images/bird.jpg", 1),
            Task("Aprender programação", "assets/images/bird.jpg", 1),
            Task("Aprender programação", "assets/images/bird.jpg", 4),
            Task("Aprender programação", "assets/images/bird.jpg", 3),
            Task("Aprender programação", "assets/images/bird.jpg", 2),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.remove_red_eye, color: Colors.white),
      ),
    );
  }
}
