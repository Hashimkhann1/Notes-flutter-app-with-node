import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_app_with_node/model/note_model/note_model.dart';
import 'package:notes_app_with_node/view/add_new_note/add_new_note.dart';
import 'package:notes_app_with_node/view/my_text.dart';
import 'package:notes_app_with_node/view_model/bloc/notes_bloc/note_bloc.dart';
import 'package:notes_app_with_node/view_model/bloc/notes_bloc/note_state.dart';
import 'package:notes_app_with_node/view_model/bloc/notes_bloc/notes_event.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    /// initilazing the bloc
    final notesBloc = NotesBloc();

    return Scaffold(
      appBar: AppBar(
        title: MyText(title: 'Notes',color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24,),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<NotesBloc , NotesState>(builder: (context , state) {
        return MasonryGridView.builder(
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: state.notesList.length,
          itemBuilder: (BuildContext context, int index) {
            NoteModel currentNoteData = state.notesList[index];
            return Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(4.0,4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0
                  ),
                  BoxShadow(
                    color: Colors.blue.shade100,
                    offset: Offset(-4.0,-4.0),
                    blurRadius: 4.0,
                    spreadRadius: 1.0
                  ),
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: MyText(title: currentNoteData.title.toString(),fontSize: 21,fontWeight: FontWeight.bold,color: Colors.black87,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                      InkWell(
                        onTap: (){
                          context.read<NotesBloc>().add(DeleteNote(currentNoteData.id.toString()));
                        },
                          child: const Icon(CupertinoIcons.delete_solid,size: 18,color: Colors.grey,))
                    ],
                  ),
                  const SizedBox(height: 3,),
                  MyText(title: currentNoteData.content.toString(),fontSize: 15,color: Colors.grey.shade700,maxLines: 6,overflow: TextOverflow.ellipsis,),
                ],
              ),
            );
          },

        );
      }),

      /// floating actioi button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: (){
          Navigator.push(context, CupertinoPageRoute(
            fullscreenDialog: true,
              builder: (context) => AddNewNote()));
        },
        child: const Icon(Icons.add,color: Colors.white,size: 33,),
      ),
    );
  }
}
