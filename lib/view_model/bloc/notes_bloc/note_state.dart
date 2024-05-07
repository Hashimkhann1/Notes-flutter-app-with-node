
import 'package:equatable/equatable.dart';
import 'package:notes_app_with_node/model/note_model/note_model.dart';

class NotesState extends Equatable {

  final List<NoteModel> notesList;

  NotesState({this.notesList = const <NoteModel>[],});

  NotesState copyWith({List<NoteModel>? notesList}) {
    return NotesState(notesList: notesList ?? this.notesList);
  }

  @override
  List<Object> get props => [notesList];
}