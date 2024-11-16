import 'package:flutter/material.dart';
import 'package:offline_app/todo/alerd.dart';
import 'package:offline_app/todo/todo_title.dart';

class HomePageToDo extends StatefulWidget {
  const HomePageToDo({super.key});

  @override
  State<HomePageToDo> createState() => HomePageToDoState();
}

class HomePageToDoState extends State<HomePageToDo> {
  TextEditingController todoEditingController = TextEditingController();
  List mytitle = [
    ["Make Tutorial", false],
    ["Do Bxarci", false]
  ];
  void deleteFunction(int index) {
    setState(() {
      mytitle.removeAt(index);
    });
  }

  void onSave() {
    setState(() {
      if (todoEditingController.text.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Not todo")));
      } else {
        mytitle.add([todoEditingController.text, false]);
        todoEditingController.clear();
      }
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    void chekbox(bool? value, int index) {
      setState(() {
        mytitle[index][1] = !mytitle[index][1];
      });
    }

    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text(
          "TO DO",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
          itemCount: mytitle.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => My()));
              },
              child: TitleList(
                title: mytitle[index][0],
                chekbox: mytitle[index][1],
                value: (value) => chekbox(value, index),
                deleteFunction: (context) => deleteFunction(index),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => Alerd(
                    todoEditingController: todoEditingController,
                    onSave: onSave));
          }),
    );
  }
}

class My extends StatelessWidget {
  const My({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
