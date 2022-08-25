class Note {
  int id;
  String title;
  String content;
  String dateTimeEdited;
  String dateTimeCreated;

  Note(
      { this.id=0,
        required this.title,
        required   this.content,
        required   this.dateTimeEdited,
        required  this.dateTimeCreated});

  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "title": this.title,
      "content": this.content,
      "dateTimeEdited": this.dateTimeEdited,
      "dateTimeCreated": this.dateTimeCreated,
    };
  }
}
