import 'package:flutter/material.dart';
import 'package:projeto_dart/components/task.dart';
import 'package:projeto_dart/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.blue,
        title: const Text('Tarefas', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FormScreen()));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
