import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_node/model/note_model/note_model.dart';
import 'package:notes_app_with_node/view/my_text.dart';
import 'package:notes_app_with_node/view_model/bloc/notes_bloc/note_bloc.dart';
import 'package:notes_app_with_node/view_model/bloc/notes_bloc/notes_event.dart';
import 'package:uuid/uuid.dart';

class AddNewNote extends StatelessWidget {
  AddNewNote({super.key});

  FocusNode noteFocus = FocusNode();

  final titleController = TextEditingController();
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: MyText(title: 'Add Note'),
        actions: [
          IconButton(
              onPressed: () {

                context.read<NotesBloc>().add(AddNote(NoteModel(
                    id: Uuid().v1(),
                    userId: 'hashim@gmail.com',
                    title: titleController.text.toString(),
                    content: noteController.text.toString(),
                    date: DateTime.now().toString(),
                )));

                Navigator.pop(context);
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              autofocus: true,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              onSubmitted: (val) {
                if (val != '') {
                  noteFocus.requestFocus();
                }
              },
              decoration: const InputDecoration(
                  hintText: 'Title', border: InputBorder.none),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TextField(
                controller: noteController,
                maxLines: null,
                focusNode: noteFocus,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                    hintText: 'Note', border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
