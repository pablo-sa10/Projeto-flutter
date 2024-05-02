import 'package:flutter/material.dart';
import 'package:projeto_dart/task.dart';

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
        title: Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: Duration(milliseconds: 800),
        child: ListView(
          scrollDirection: Axis.vertical,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Task(
                "Aprender Flutter",
                "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
                3),
            Task(
                "Aprender bike",
                "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
                2),
            Task(
                "Aprender programação",
                "https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg",
                5),
            Task(
                "Aprender a dançar",
                "https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg",
                4),
            Task("Aprender a tocar",
                "https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg", 1),
            Task(
                "Aprender programação",
                "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
                1),
            Task(
                "Aprender programação",
                "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
                4),
            Task(
                "Aprender programação",
                "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
                3),
            Task(
                "Aprender programação",
                "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
                2),
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
        child: Icon(Icons.remove_red_eye, color: Colors.white),
      ),
    );
  }
}
