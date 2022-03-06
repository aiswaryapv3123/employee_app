import 'package:employee_directory_app/src/models/get_employee_details.dart';
import 'package:equatable/equatable.dart';


abstract class EmployeeStates extends Equatable {
  const EmployeeStates();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EmployeeInitialState extends EmployeeStates {}

class EmployeeLoadingState extends EmployeeStates {}

class EmployeeLoadedState extends EmployeeStates {
  List<GetEmployeeData> employeeList;
  EmployeeLoadedState({required this.employeeList});
}

class EmployeeErrorState extends EmployeeStates {
  String? error;
  EmployeeErrorState({this.error});
}
