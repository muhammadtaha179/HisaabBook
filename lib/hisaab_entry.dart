import 'package:flutter/material.dart';

class HisaabEntry extends StatelessWidget {
  int? id;
  String title;
  String subtitle;
  String number;

  HisaabEntry(this.title, this.subtitle, this.number);

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      'title': title,
      'subtitle': subtitle,
      'number': number,
    };
    if (id != null) map['id'] = id!;
    return map;
  }

  static HisaabEntry fromMap(Map<String, Object?> map) {
    var data = HisaabEntry(
      map['title'] as String,
      map['subtitle'] as String,
      map['number'] as String,
    );
    if (map.containsKey('id')) data.id = map['id'] as int;
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
