import 'package:employee_directory_app/src/utils/constants.dart';
import 'package:employee_directory_app/src/utils/utils.dart';
import 'package:flutter/material.dart';

class UserFormField extends StatefulWidget {
  const UserFormField({
    Key? key,
    required this.label,
    required this.textEditingController,
    this.onTapSearch,
  }) : super(key: key);
  final String label;
  final TextEditingController textEditingController;
  final Function? onTapSearch;

  @override
  _UserFormFieldState createState() => _UserFormFieldState();
}

class _UserFormFieldState extends State<UserFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth(context, dividedBy: 30),
      ),
      child: Row(
        children: [
          SizedBox(
            width: screenWidth(context, dividedBy: 1.2),
            height: screenHeight(context, dividedBy: 15),
            child: TextField(
              controller: widget.textEditingController,
              cursorColor: Constants.colors[0],
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Constants.colors[0]),
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: widget.label,
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey,
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context, dividedBy: 50),
                    vertical: screenHeight(context, dividedBy: 120)),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueGrey, width: 0.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blueGrey, width: 0.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
              onTap: () {
                widget.onTapSearch!();
              },
              child: const Icon(Icons.search_rounded, color: Colors.white, size:26)),
        ],
      ),
    );
  }
}
