import 'package:flutter/material.dart';
import '../AppFont.dart';
import '../LocalString.dart';
import 'package:flutter/material.dart';
import '../../../globals.dart' as globals;
import '../design/ColorConstants.dart';
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double barHeight = 50.0;
  MainAppBar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight );
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                      size: 26.0,
                    ),
                  )),
            ],
            leadingWidth: 0,
            primary: true,
            title: Text(
              '',
              style: AppFont.bold.copyWith(
                  color: ColorConstants.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            )),
        preferredSize: Size.fromHeight(kToolbarHeight));
  }
}



