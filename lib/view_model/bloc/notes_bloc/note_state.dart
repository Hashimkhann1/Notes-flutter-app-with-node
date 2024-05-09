
import 'package:equatable/equatable.dart';
import 'package:notes_app_with_node/model/note_model/note_model.dart';
import 'package:notes_app_with_node/res/enums/enums.dart';

class NotesState extends Equatable {

  final NotesStatus notesStatus;
  final List<NoteModel> notesList;


  NotesState({this.notesList = const <NoteModel>[], this.notesStatus = NotesStatus.loading});

  NotesState copyWith({NotesStatus? notesStatus , List<NoteModel>? notesList}) {
    return NotesState(
      notesStatus: notesStatus ?? this.notesStatus,
        notesList: notesList ?? this.notesList
    );
  }

  @override
  List<Object> get props => [notesList,notesStatus];
}