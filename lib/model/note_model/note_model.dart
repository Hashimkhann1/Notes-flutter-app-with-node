

class NoteModel {
  String? id;
  String? userId;
  String? title;
  String? content;
  String? date;

  NoteModel({this.id, this.userId, this.title, this.content, this.date});

  NoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    content = json['content'];
    date = DateTime.tryParse(json['date']).toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['date'] = this.date;
    return data;
  }
}
