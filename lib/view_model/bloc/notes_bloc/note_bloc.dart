


import 'package:bloc/bloc.dart';
import 'package:notes_app_with_node/view_model/bloc/notes_bloc/note_state.dart';
import 'package:notes_app_with_node/view_model/bloc/notes_bloc/notes_event.dart';

class NotesBloc extends Bloc<NotesEvent , NotesState> {

  NotesBloc() : super(NotesState()) {
    on<AddNote>(_addNote);
    on<DeleteNote>(_deleteNote);
  }

  /// adding note
  void _addNote(AddNote event , Emitter<NotesState> emit) {
    emit(state.copyWith(
      notesList: List.from(state.notesList)..add(event.noteModel)
    ));
  }

  /// deleting note
  void _deleteNote(DeleteNote event , Emitter<NotesState> emit) {
    int noteIndex = state.notesList.indexOf(state.notesList.firstWhere((element) => element.id == event.noteId));
    emit(state.copyWith(
      notesList: List.from(state.notesList)..removeAt(noteIndex)
    ));
  }

}