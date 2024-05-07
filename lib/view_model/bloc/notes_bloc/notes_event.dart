

import 'package:equatable/equatable.dart';
import 'package:notes_app_with_node/model/note_model/note_model.dart';

abstract class NotesEvent extends Equatable {

  const NotesEvent();

  @override
  List<Object> get props => [];

}

/// add note event
class AddNote extends NotesEvent {

  final NoteModel noteModel;
  AddNote(this.noteModel);

}

/// update note event
class UpdateNote extends NotesEvent {}

/// delete note event
class DeleteNote extends NotesEvent {
  final String noteId;
  DeleteNote(this.noteId);
}