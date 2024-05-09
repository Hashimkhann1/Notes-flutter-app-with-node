


import 'package:bloc/bloc.dart';
import 'package:notes_app_with_node/res/enums/enums.dart';
import 'package:notes_app_with_node/view_model/bloc/notes_bloc/note_state.dart';
import 'package:notes_app_with_node/view_model/bloc/notes_bloc/notes_event.dart';
import 'package:notes_app_with_node/view_model/services_view_model/services_view_model.dart';

class NotesBloc extends Bloc<NotesEvent , NotesState> {

  NotesBloc() : super(NotesState()) {

    on<FetchNotes>(_fetchNotes);
    on<AddNote>(_addNote);
    on<DeleteNote>(_deleteNote);
    on<UpdateNote>(_updateNote);
  }


  void _fetchNotes(FetchNotes event , Emitter<NotesState> emit) async {
    // state.notesList.sort((a,b) => b.date!.compareTo(a.date!) );
    emit(state.copyWith(
      notesStatus: NotesStatus.success,
        notesList: await ApiServicesViewModel.fetchNotes('hashim@gmail.com')
    ));
    state.notesList.sort((a,b) => b.date!.compareTo(a.date!) );
  }

  /// adding note
  void _addNote(AddNote event , Emitter<NotesState> emit) {
    emit(state.copyWith(
      notesList: List.from(state.notesList)..add(event.noteModel)
    ));
    state.notesList.sort((a,b) => b.date!.compareTo(a.date!) );
    ApiServicesViewModel.addNote(event.noteModel);
  }

  /// updateing note method
  void _updateNote(UpdateNote event , Emitter<NotesState> emit) async {

    int noteIndex = await state.notesList.indexOf(state.notesList.firstWhere((element) => element.id == event.noteModel.id));
    state.notesList.removeAt(noteIndex);

    emit(state.copyWith(
        notesList: List.from(state.notesList)..insert(noteIndex,event.noteModel)
    ));
    state.notesList.sort((a,b) => b.date!.compareTo(a.date!) );
    ApiServicesViewModel.addNote(event.noteModel);
  }

  /// deleting note
  void _deleteNote(DeleteNote event , Emitter<NotesState> emit) {
    int noteIndex = state.notesList.indexOf(state.notesList.firstWhere((element) => element.id == event.noteId));
    emit(state.copyWith(
      notesList: List.from(state.notesList)..removeAt(noteIndex)
    ));
    ApiServicesViewModel.deleteNote(event.noteId);

  }

}