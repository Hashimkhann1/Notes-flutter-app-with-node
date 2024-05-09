import 'dart:convert';
import 'dart:developer';

import 'package:notes_app_with_node/model/note_model/note_model.dart';
import 'package:http/http.dart' as http;

class ApiServicesViewModel {

  static String _baseurl = 'http://10.0.2.2:5000/notes/';

  // : 'http://192.168.10.11	:5000/notes/';

  /// adding note to mongo db method
  static Future<void> addNote(NoteModel noteModel) async {
    Uri requestUrl = Uri.parse(_baseurl + 'add');
    var responce = await http.post(requestUrl, body: noteModel.toJson());
    var decode = jsonDecode(responce.body);
    log(decode.toString());
  }

  /// deleting note from mongodb method
  static Future<void> deleteNote(String noteId) async {

    Uri requestUrl = Uri.parse(_baseurl + 'delete/${noteId}');
    var responce = await http.delete(requestUrl);
    var decode = jsonDecode(responce.body);
  }


  /// fetch data
  static Future<List<NoteModel>> fetchNotes(String userId) async {
    Uri requestUrl = Uri.parse(_baseurl + 'list/${userId}');
    var responce = await http.get(requestUrl);
    print(responce.statusCode);

    var decode = jsonDecode(responce.body);

    List<NoteModel> notes = [];
    for(var noteMap in decode){
      NoteModel noteModel = NoteModel.fromJson(noteMap);
      notes.add(noteModel);
    }
    return notes;
  }


}