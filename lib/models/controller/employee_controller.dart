import 'dart:convert';

import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/models/employee.dart';

// A function that converts a response body into a List<Album>.
List<Employee> parseEmployee(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Employee>((json) => Employee.fromJson(json)).toList();
}