import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageSharedPreferences extends StatefulWidget {
  @override
  _HomePageSharedPreferencesState createState() =>
      _HomePageSharedPreferencesState();
}

class _HomePageSharedPreferencesState extends State<HomePageSharedPreferences> {
  TextEditingController _controller = TextEditingController();
  List<String> _todos = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  // Todo'larni SharedPreferences dan yuklash
  Future<void> _loadTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _todos = prefs.getStringList('todos') ?? [];
    });
  }

  // Todo'ni SharedPreferences ga saqlash
  Future<void> _saveTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('todos', _todos);
  }

  // Yangi Todo qo'shish
  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todos.add(_controller.text);
        _controller.clear();
      });
      _saveTodos();
    }
  }

  // Todo'ni o'chirish
  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
    _saveTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo App")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: "Add a new todo"),
            ),
          ),
          ElevatedButton(
            onPressed: _addTodo,
            child: Text("Add Todo"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_todos[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removeTodo(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
