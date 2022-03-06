import 'package:employee_directory_app/src/models/get_employee_details.dart';
import 'package:employee_directory_app/src/screens/employee_details_page.dart';
import 'package:employee_directory_app/src/utils/constants.dart';
import 'package:employee_directory_app/src/utils/utils.dart';
import 'package:employee_directory_app/src/widgets/profile_icon.dart';
import 'package:flutter/material.dart';

class HomePageCard extends StatefulWidget {
  final GetEmployeeData employeeData;
  const HomePageCard({Key? key, required this.employeeData}) : super(key: key);

  @override
  _HomePageCardState createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        push(context, EmployeeDetailsPage(employee: widget.employeeData));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(context, dividedBy: 30)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileIcon(
                  image: widget.employeeData.profileImage ??
                      "https://www.cornwallbusinessawards.co.uk/wp-content/uploads/2017/11/dummy450x450-300x300.jpg",
                  radius: 6),
              SizedBox(
                width: screenWidth(context, dividedBy: 30),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.employeeData.name!,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Constants.colors[1],
                        fontFamily: "JosefinSans"),
                  ),
                  SizedBox(
                    height: screenHeight(context, dividedBy: 200),
                  ),
                  Row(
                    children: [
                      const Text(
                        "Company Name: ",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey,
                            fontFamily: "JosefinSans"),
                      ),
                      Text(
                        widget.employeeData.company?.name ?? "not available",
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey,
                            fontFamily: "JosefinSans"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
