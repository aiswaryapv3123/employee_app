import 'dart:convert';

import 'package:employee_directory_app/src/bloc/bloc.dart';
import 'package:employee_directory_app/src/bloc/states.dart';
import 'package:employee_directory_app/src/models/get_employee_details.dart';
import 'package:employee_directory_app/src/screens/search_page.dart';
import 'package:employee_directory_app/src/utils/constants.dart';
import 'package:employee_directory_app/src/utils/utils.dart';
import 'package:employee_directory_app/src/widgets/home_page_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.colors[3],
      appBar: AppBar(
          backgroundColor: Constants.colors[3],
          leading: const Icon(Icons.menu_rounded, color:Colors.white),
        actions:[
          SizedBox(
            width: screenWidth(context, dividedBy: 1.2),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Employee App",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Constants.colors[0],
                    fontFamily:"JosefinSans"
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap:(){
                    push(context, const SearchPage());
                  },
                    child: const Icon(Icons.search_rounded, color:Colors.white)),
                SizedBox(width:screenWidth(context, dividedBy: 30))
              ],
            ),
          ),
        ]
      ),
      body: SingleChildScrollView(
        child: Container(
          width:MediaQuery.of(context).size.width,
          padding:EdgeInsets.symmetric(horizontal:screenWidth(context, dividedBy:50), vertical:screenHeight(context, dividedBy:30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: screenHeight(context, dividedBy: 30),
              // ),

              /// bloc builder for employeeData
              BlocBuilder<EmployeeBloc, EmployeeStates>(
                  builder: (BuildContext context, EmployeeStates state) {
                if (state is EmployeeErrorState) {
                  final error = state.error;
                  return SizedBox(
                    width: screenWidth(context, dividedBy: 1),
                    height: screenHeight(context, dividedBy: 1),
                    child: Center(
                      child: Text(
                        error.toString(),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily:"JosefinSans"),
                      ),
                    ),
                  );
                }
                if (state is EmployeeLoadedState) {
                  // print("Loaded State");
                  // print("Loaded State data" + state.employeeList.toString());
                  List<GetEmployeeData> employeeData = state.employeeList;
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: ListView.builder(
                        itemCount: employeeData.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              HomePageCard(employeeData: employeeData[index]),
                              SizedBox(
                                height: screenHeight(context, dividedBy: 60),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  );
                }
                return SizedBox(
                  width: screenWidth(context, dividedBy: 1),
                  height: screenHeight(context, dividedBy: 1),
                  child: const Center(
                    child: SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              }),

              /// futurebuilder
              // Container(
              //   width: screenWidth(context, dividedBy: 1),
              //   // height: screenHeight(context, dividedBy: 1),
              //   // color: Colors.pink,
              //   child: FutureBuilder<List<GetMovies>>(
              //     future: futureMovies,
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         return Container(
              //           width: screenWidth(context, dividedBy: 1),
              //           child: ListView.builder(
              //             itemCount: categories.length,
              //             shrinkWrap: true,
              //             physics: const NeverScrollableScrollPhysics(),
              //             itemBuilder: (ctx, index) {
              //               return Column(
              //                 children: [
              //                   SizedBox(
              //                     height:
              //                         screenHeight(context, dividedBy: 60),
              //                   ),
              //                   HomePageCard(
              //                       movieList: moviesByCategories[index],
              //                       category: categories[index]),
              //                 ],
              //               );
              //             },
              //           ),
              //         );
              //       } else if (snapshot.hasError) {
              //         print(snapshot.error);
              //         return Text("${snapshot.error}");
              //       }
              //       // To show a spinner while loading
              //       return Container(
              //         width: MediaQuery.of(context).size.width,
              //         height: MediaQuery.of(context).size.height * 0.8,
              //         child: const Center(
              //           child: SizedBox(
              //             width: 18,
              //             height: 18,
              //             child: CircularProgressIndicator(
              //               strokeWidth: 2,
              //               valueColor: AlwaysStoppedAnimation<Color>(
              //                 Colors.pink,
              //               ),
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),

              // BlocProvider(create:(context) => movieBloc,
              //   child:BlocListener<MovieBloc, MovieStates> (
              //     listener :(context, state) {
              //       if(state is MovieErrorState) {
              //         ScaffoldMessenger.of(context).showSnackBar(
              //           SnackBar(
              //             content: Text(state.error!),
              //           ),
              //         );
              //       }
              //     },
              //     child: Container(
              //       child: BlocBuilder<MovieBloc, MovieStates>(
              //           builder: (BuildContext context, MovieStates state) {
              //             if (state is MovieErrorState) {
              //               final error = state.error;
              //               return Container(
              //                 width: MediaQuery.of(context).size.width,
              //                 height: MediaQuery.of(context).size.height * 0.8,
              //                 child: Center(
              //                   child: Text(
              //                     error.toString(),
              //                     style: const TextStyle(
              //                         fontSize: 16,
              //                         fontWeight: FontWeight.bold,
              //                         fontFamily: "Exo-Regular"),
              //                   ),
              //                 ),
              //               );
              //             }
              //             if (state is MovieLoadedState) {
              //               print("Loaded State");
              //               List<GetMovies> movies = state.moviesList!;
              //               return Container(
              //                   width: MediaQuery.of(context).size.width,
              //                   height: MediaQuery.of(context).size.height * 0.8,
              //                   color:Colors.yellow,
              //                   child: Center(
              //                     child: Text(
              //                       movies[0].name!,
              //                       style: const TextStyle(
              //                           fontSize: 16,
              //                           fontWeight: FontWeight.bold,
              //                           fontFamily: "Exo-Regular"),
              //                     ),
              //                   ));
              //             }
              //             return Container(
              //               width: MediaQuery.of(context).size.width,
              //               height: MediaQuery.of(context).size.height * 0.8,
              //               child: const Center(
              //                 child: SizedBox(
              //                   width: 18,
              //                   height: 18,
              //                   child: CircularProgressIndicator(
              //                     strokeWidth: 2,
              //                     valueColor: AlwaysStoppedAnimation<Color>(
              //                       Colors.pink,
              //                     ),
              //                   ),
              //                 ),
              //               ),
              //             );
              //           }),
              //     ),
              //   )
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
