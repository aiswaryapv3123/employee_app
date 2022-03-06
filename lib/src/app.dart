import 'package:employee_directory_app/src/bloc/bloc.dart';
import 'package:employee_directory_app/src/bloc/events.dart';
import 'package:employee_directory_app/src/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EmployeeBloc employeeBloc = EmployeeBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _loadData();
    employeeBloc.add(GetEmployeeList());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create:(context) => employeeBloc,
        child:HomePage(),
      ),
    );
  }
}
