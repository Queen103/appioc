// ignore_for_file: prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers

class CRUD {
  // Create data in Firebase
  void createData(String data) {
    var databaseReference;
    databaseReference.push().set({'text': data});
    var _textController;
    _textController.clear();
  }
}
