class TaskModel {
  String title;

  int data;
  String description;
  bool isDone;
  String id;

  TaskModel(
      {required this.title,
      required this.data,
      required this.description,
      this.isDone = false,
      this.id = ""});

  TaskModel.fromData(Map<String, dynamic> data)
      : this(
            title: data["title"],
            data: data["data"],
            description: data["description"],
            isDone: data["isDone"],
            id: data["id"]);

  Map<String, dynamic> toData() {
    return {
      "title": title,
      "data": data,
      "description": description,
      "isDone": isDone,
      "id": id
    };
  }
}
