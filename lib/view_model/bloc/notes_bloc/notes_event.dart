

import 'package:equatable/equatable.dart';
import 'package:notes_app_with_node/model/note_model/note_model.dart';

abstract class NotesEvent extends Equatable {

  const NotesEvent();

  @override
  List<Object> get props => [];

}
/// ftech Notes
class FetchNotes extends NotesEvent {}

/// add note event
class AddNote extends NotesEvent {

  final NoteModel noteModel;
  const AddNote(this.noteModel);

}

/// update note event
class UpdateNote extends NotesEvent {
  final NoteModel noteModel;
  const UpdateNote(this.noteModel);
}

/// delete note event
class DeleteNote extends NotesEvent {
  final String noteId;
  const DeleteNote(this.noteId);
}