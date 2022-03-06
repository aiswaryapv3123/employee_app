import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_directory_app/src/utils/constants.dart';
import 'package:employee_directory_app/src/utils/utils.dart';
import 'package:flutter/material.dart';

class ProfileIcon extends StatefulWidget {
  final String image;
  final double? radius;
  const ProfileIcon({Key? key, required this.image, this.radius = 4})
      : super(key: key);

  @override
  _ProfileIconState createState() => _ProfileIconState();
}

class _ProfileIconState extends State<ProfileIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
        width: screenWidth(context, dividedBy: widget.radius!),
        height: screenHeight(context, dividedBy: 9),
        imageUrl: widget.image,
        fit: BoxFit.contain,
        imageBuilder: (context, img) {
          return Container(
            width: screenWidth(context, dividedBy: widget.radius!),
            // height: screenHeight(context, dividedBy: 9),
            decoration: BoxDecoration(
              color: Constants.colors[3].withOpacity(0.6),
              shape: BoxShape.circle,
              border: Border.all(color: Constants.colors[0], width: 2.0),
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
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
