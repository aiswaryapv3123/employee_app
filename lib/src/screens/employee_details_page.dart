import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_directory_app/src/models/get_employee_details.dart';
import 'package:employee_directory_app/src/utils/constants.dart';
import 'package:employee_directory_app/src/utils/utils.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsPage extends StatefulWidget {
  final GetEmployeeData employee;
  const EmployeeDetailsPage({Key? key, required this.employee})
      : super(key: key);

  @override
  _EmployeeDetailsPageState createState() => _EmployeeDetailsPageState();
}

class _EmployeeDetailsPageState extends State<EmployeeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.colors[3],
      appBar: AppBar(
          backgroundColor: Constants.colors[3],
          leading: GestureDetector(
              onTap: () {
                pop(context);
              },
              child: const Icon(Icons.arrow_back_ios, color: Colors.white)),
          actions: [
            SizedBox(
              width: screenWidth(context, dividedBy: 1.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.employee.username ?? "UserName",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Constants.colors[0],
                        fontFamily: "JosefinSans"),
                  ),
                  const Spacer(),
                  const Icon(Icons.more_vert, color: Colors.white),
                  SizedBox(width: screenWidth(context, dividedBy: 30))
                ],
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context, dividedBy: 30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                width: screenWidth(context, dividedBy: 4),
                height: screenHeight(context, dividedBy: 4),
                imageUrl: widget.employee.profileImage ??
                    "https://www.cornwallbusinessawards.co.uk/wp-content/uploads/2017/11/dummy450x450-300x300.jpg",
                fit: BoxFit.contain,
                imageBuilder: (context, img) {
                  return Container(
                    width: screenWidth(context, dividedBy: 4),
                    // height: screenHeight(context, dividedBy: 9),
                    decoration: BoxDecoration(
                      color: Constants.colors[3].withOpacity(0.6),
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: Constants.colors[0], width: 2.0),
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: img,
                      ),
                    ),
                  );
                },
                placeholder: (context, img) => Center(
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation(Constants.colors[0]),
                    ),
                  ),
                ),
                errorWidget: (_, s, d) => const Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 50),
              ),
              Text(
                widget.employee.name!,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Constants.colors[0],
                    fontFamily: "JosefinSans"),
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 90),
              ),
              Text(
                widget.employee.website ?? "no data available",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey,
                    fontFamily: "JosefinSans"),
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 150),
              ),
              const Divider(
                color: Colors.blueGrey,
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 90),
              ),
              const Text(
                "Company Details:",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: "JosefinSans"),
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 90),
              ),
              Row(
                children: [
                  const Text(
                    "Company Name : ",
                    style:  TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
                        fontFamily: "JosefinSans"),
                  ),
                  Text(
                    widget.employee.company?.name ?? "Company",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
                        fontFamily: "JosefinSans"),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 120),
              ),
              Row(
                children: [
                  const Text(
                    "BS Details : ",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
                        fontFamily: "JosefinSans"),
                  ),
                  Text(
                    widget.employee.company?.bs ?? "BS",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
                        fontFamily: "JosefinSans"),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 120),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Catch Phrase Details : ",
                    style:  TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
                        fontFamily: "JosefinSans"),
                  ),
                  Expanded(
                    child: Text(
                      widget.employee.company?.catchPhrase ?? "Catch Phrase",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey,
                          fontFamily: "JosefinSans"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 30),
              ),
              const Text(
                "Address:",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: "JosefinSans"),
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 90),
              ),
              Text(
                widget.employee.address?.city ?? "City",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey,
                    fontFamily: "JosefinSans"),
              ),
              Text(
                widget.employee.address?.street ?? "Street",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey,
                    fontFamily: "JosefinSans"),
              ),
              Text(
                widget.employee.address?.suite ?? "Suite",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey,
                    fontFamily: "JosefinSans"),
              ),
              Text(
                widget.employee.address?.zipcode ?? "Zipcode",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey,
                    fontFamily: "JosefinSans"),
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 30),
              ),
              const Text(
                "Contact Details:",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: "JosefinSans"),
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 90),
              ),
              Text(
                widget.employee.email ?? "Email",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey,
                    fontFamily: "JosefinSans"),
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 120),
              ),
              Text(
                widget.employee.phone ?? "XX XXXXXXXXXX",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey,
                    fontFamily: "JosefinSans"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
