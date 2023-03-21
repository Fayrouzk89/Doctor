import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
class CustomEmptyWidget extends StatefulWidget {


  final String title;
  final String subtitle;
  final PackageImage packageImage;
  CustomEmptyWidget({Key? key, required this.title, required this.subtitle, required this.packageImage}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CustomEmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        alignment: Alignment.center,
        child: EmptyWidget(
          image: null,
          packageImage: widget.packageImage,
          title: widget.title,
          subTitle:widget.subtitle,
          titleTextStyle: TextStyle(
            fontSize: 22,
            color: Color(0xff9da9c7),
            fontWeight: FontWeight.w500,
          ),
          subtitleTextStyle: TextStyle(
            fontSize: 14,
            color: Color(0xffabb8d6),
          ),
        ),
      ),
    );
  }
}