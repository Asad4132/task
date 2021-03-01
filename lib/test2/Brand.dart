import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Brand {
  bool isChecked;
  String brand;
  List<DateTime> date;
  List<TimeOfDay> time;
  final ItemScrollController itemScrollController = ItemScrollController();
  int clickedDateIndex;
  Brand({this.isChecked = false, this.brand, this.date, this.time});

  Brand.fromJson(Map<String, dynamic> json) {
    isChecked = json['isChecked'];
    brand = json['brand'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isChecked'] = this.isChecked;
    data['brand'] = this.brand;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}
