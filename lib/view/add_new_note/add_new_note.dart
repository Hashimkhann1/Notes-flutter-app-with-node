import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_node/model/note_model/note_model.dart';
import 'package:notes_app_with_node/view/my_text.dart';
import 'package:notes_app_with_node/view_model/bloc/notes_bloc/note_bloc.dart';
import 'package:notes_app_with_node/view_model/bloc/notes_bloc/notes_event.dart';
import 'package:uuid/uuid.dart';

class AddNewNote extends StatefulWidget {

  final bool isUpdate;
  final NoteModel? noteModel;
  AddNewNote({super.key,required this.isUpdate,this.noteModel});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  FocusNode noteFocus = FocusNode();

  final titleController = TextEditingController();
  final noteController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.isUpdate){
      titleController.text = widget.noteModel!.title.toString();
      noteController.text = widget.noteModel!.content.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: MyText(title: widget.isUpdate ? "Update Note" : 'Add Note',color: Colors.white,fontWeight: FontWeight.bold,),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        actions: [
          IconButton(
              onPressed: () {
                
                if(widget.isUpdate){
                  widget.noteModel!.title = titleController.text.toString();
                  widget.noteModel!.content = noteController.text.toString();
                  widget.noteModel?.date = DateTime.now().toString();
                  context.read<NotesBloc>().add(UpdateNote(widget.noteModel!));
                }else{
                  context.read<NotesBloc>().add(AddNote(NoteModel(
                    id: Uuid().v1(),
                    userId: 'hashim@gmail.com',
                    title: titleController.text.toString(),
                    content: noteController.text.toString(),
                    date: DateTime.now().toString(),
                  )));
                }
                Navigator.pop(context);

              },
              icon: const Icon(Icons.check,color: Colors.white,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              autofocus: widget.isUpdate ? false : true,
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
