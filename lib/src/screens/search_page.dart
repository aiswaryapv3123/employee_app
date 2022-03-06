
import 'package:employee_directory_app/src/utils/constants.dart';
import 'package:employee_directory_app/src/utils/utils.dart';
import 'package:employee_directory_app/src/widgets/profile_icon.dart';
import 'package:employee_directory_app/src/widgets/user_text_field.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.colors[3],
      appBar: AppBar(
          backgroundColor: Constants.colors[3],
          leading: Container(),
          actions: [
            SizedBox(
                width: screenWidth(context, dividedBy: 1),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight(context, dividedBy: 50),
                    ),
                    UserFormField(
                        label: "Search by name/Email",
                        textEditingController: searchTextEditingController,
                      onTapSearch: (){},
                    ),
                  ],
                )),
          ]),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(context, dividedBy: 50),
              vertical: screenHeight(context, dividedBy: 30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          Card(
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
                                  const ProfileIcon(
                                      image:
                                      "https://randomuser.me/api/portraits/men/1.jpg",
                                      radius: 6),
                                  SizedBox(
                                    width: screenWidth(context, dividedBy: 30),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Leanne Graham",
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
                                        children: const [
                                          Text(
                                            "Company Name: ",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.blueGrey,
                                                fontFamily: "JosefinSans"),
                                          ),
                                          Text(
                                            "Romaguera-Crona",
                                            style: TextStyle(
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
                          SizedBox(
                            height: screenHeight(context, dividedBy: 60),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
