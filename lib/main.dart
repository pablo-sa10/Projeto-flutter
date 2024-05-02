import 'package:flutter/material.dart';
import 'package:projeto_dart/difficulty.dart';
//import 'dart:ui';

//import 'package:projeto_dart/project.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
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
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nomeTarefa;

  final String img;
  final int dificuldade;

  const Task(this.nomeTarefa, this.img, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: Colors.blue),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 72,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.img,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 200,
                              child: Text(
                                widget.nomeTarefa,
                                style: TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )),
                          Difficulty(
                            difficultyLevel: widget.dificuldade,
                          ),
                        ],
                      ),
                      Container(
                        height: 50,
                        width: 70,
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nivel++;
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.white,
                                ),
                                Text(
                                  "UP",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? (nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Nivel $nivel",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
