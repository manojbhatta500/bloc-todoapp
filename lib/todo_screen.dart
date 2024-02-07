import 'package:blocapi/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatelessWidget {
  ToDoScreen({super.key});

  TextEditingController inputdata = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      controller: inputdata,
                      decoration: const InputDecoration(
                        hintText: 'Enter your text',
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        print(inputdata.text);

                        BlocProvider.of<TodoBloc>(context)
                            .add(AddTodoEvent(currenttodo: inputdata.text));

                        Navigator.pop(context);
                        inputdata.clear();
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todolist.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('No  Task Found'),
                ],
              ),
            );
          } else if (state.todolist.isNotEmpty) {
            return ListView.builder(
                itemCount: state.todolist.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Card(
                      elevation: 10,
                      child: ListTile(
                        title: Text(state.todolist[index]),
                        trailing: IconButton(
                            onPressed: () {
                              print('pressed the delete button');
                              BlocProvider.of<TodoBloc>(context).add(
                                  DeleteTodoEvent(
                                      currentitemtodelete:
                                          state.todolist[index]));
                            },
                            icon: const Icon(Icons.delete)),
                      ),
                    ),
                  );
                });
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
