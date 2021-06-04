import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/models/employee.dart';
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/models/controller/employee_controller.dart';

Future<List<Employee>> fetchEmployees(http.Client client) async {
  final response =
  await client.get('http://192.168.180.135:8000/api/',headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},);

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseEmployee, response.body);
}