class Task {
  int count;
  List<Data> data;

  Task({this.count, this.data});

  Task.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  bool completed;
  String sId;
  String description;
  String owner;
  String createdAt;
  String updatedAt;
  int iV;

  Data(
      {this.completed,
      this.sId,
      this.description,
      this.owner,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    completed = json['completed'];
    sId = json['_id'];
    description = json['description'];
    owner = json['owner'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['completed'] = this.completed;
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['owner'] = this.owner;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
