// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class Group {
  final String groupName;
  Map<String, List<dynamic>> students;

  Group(
    this.groupName,
    this.students,
  );

  Group copyWith({
    String? groupName,
    Map<String, List<dynamic>>? students,
  }) {
    return Group(
      groupName ?? this.groupName,
      students ?? this.students,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'groupName': groupName,
      'students': students,
    };
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
        map['groupName'] as String,
        Map<String, List<dynamic>>.from(
          (map['students'] as Map<String, List<dynamic>>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Group.fromJson(String source) =>
      Group.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Group(groupName: $groupName, students: $students)';

  @override
  bool operator ==(covariant Group other) {
    if (identical(this, other)) return true;
    final mapEquals = const DeepCollectionEquality().equals;

    return other.groupName == groupName && mapEquals(other.students, students);
  }

  @override
  int get hashCode => groupName.hashCode ^ students.hashCode;
}
