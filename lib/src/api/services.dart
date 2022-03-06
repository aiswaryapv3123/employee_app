
import 'dart:convert';

import 'package:employee_directory_app/src/models/get_employee_details.dart';
import 'package:http/http.dart' as http;

class EmployeeRepo {
  final _provider = EmployeeServices();

  Future<List<GetEmployeeData>> fetchEmployeeData() {
    return _provider.getEmployeeData();
  }
}

class EmployeeServices  {

  static const baseUrl = "www.mocky.io";
  static const String _GET_DATA = "/v2/5d565297300000680030a986";
  //http://www.mocky.io/v2/5d565297300000680030a986
  @override
  Future<List<GetEmployeeData>> getEmployeeData() async {
    // TODO: implement getMovies
    final response = await http.get(
      Uri.parse('http://www.mocky.io/v2/5d565297300000680030a986'),
    );
    final data = jsonDecode(response.body);
    // print("Response");
    // print(data);
    // print("Employee response");
    // print(response);
    List<GetEmployeeData> employeeData = getEmployeeDataFromJson(response.body);
    // print("Employee data");
    // print(employeeData);
    return employeeData;
  }
}