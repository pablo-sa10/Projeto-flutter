import 'package:flutter/material.dart';

//import 'package:projeto_dart/Data/task_dao.dart';
import 'package:projeto_dart/components/difficulty.dart';

import '../Data/task_dao.dart';

class Task extends StatefulWidget {
  final String nomeTarefa;
  final String img;
  final int dificuldade;

  Task(this.nomeTarefa, this.img, this.dificuldade, {super.key});

  int nivel = 0;
  int levelCor = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assets() {
    if (widget.img.contains('http')) {
      return false;
    }
    return true;
  }

  final Map<int, Color> colorMap = {
    1: const Color.fromARGB(255, 1, 45, 165),
    2: const Color.fromARGB(255, 79, 33, 243),
    3: const Color.fromARGB(255, 84, 2, 190),
    4: const Color.fromARGB(255, 41, 0, 68),
    5: Colors.black,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: colorMap[widget.levelCor] ?? Colors.blue),
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
                        child: assets()
                            ? Image.asset(
                                widget.img,
                                fit: BoxFit.cover,
                              )
                            : Image.network(widget.img, fit: BoxFit.cover),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              widget.nomeTarefa,
                              style: const TextStyle(
                                fontSize: 24,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                        Difficulty(
                          difficultyLevel: widget.dificuldade,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      width: 70,
                      child: ElevatedButton(
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Atenção!"),
                                    content: Text("Deseja excluir a tarefa?"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancelar")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            TaskDao().delete(widget.nomeTarefa);
                                          },
                                          child: Text("Sim")),
                                    ],
                                  );
                                });
                          },
                          onPressed: () {
                            setState(() {
                              if (widget.levelCor < 6) {
                                widget.nivel++;
                              }
                            });
                            if (((widget.nivel / widget.dificuldade) / 10) >
                                1) {
                              widget.levelCor++;
                              widget.nivel = 0;
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          child: const Column(
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
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: (widget.nivel / widget.dificuldade) / 10,
                        //
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nivel ${widget.nivel}",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
