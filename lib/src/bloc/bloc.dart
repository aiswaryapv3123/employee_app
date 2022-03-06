import 'dart:io';

import 'package:employee_directory_app/src/api/services.dart';
import 'package:employee_directory_app/src/bloc/events.dart';
import 'package:employee_directory_app/src/bloc/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeStates> {
  EmployeeBloc() : super(EmployeeInitialState()) {
    final EmployeeRepo employeeRepository = EmployeeRepo();
    on<GetEmployeeList>((event, emit) async {
      try {
        emit(EmployeeLoadingState());
        final employeeList = await employeeRepository.fetchEmployeeData();
        // print("Data from bloc");
        // print(employeeList);
        emit(EmployeeLoadedState(employeeList: employeeList));
      } on SocketException {
        emit(EmployeeErrorState(error: "No internet"));
      } on HttpException {
        emit(EmployeeErrorState(
          error: 'No Service Found',
        ));
      } on FormatException {
        emit(EmployeeErrorState(
          error: 'Invalid Response format',
        ));
      } catch (e) {
        emit(EmployeeErrorState(
          error: 'Unknown Error',
        ));
      }
    });
  }
}
