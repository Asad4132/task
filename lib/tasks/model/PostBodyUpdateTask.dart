class PostBodyUpdateTask {
  bool completed;

  PostBodyUpdateTask({this.completed});

  PostBodyUpdateTask.fromJson(Map<String, dynamic> json) {
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['completed'] = this.completed;
    return data;
  }
}
