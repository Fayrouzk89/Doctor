import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mvc/home/HomeController.dart';
import 'mvc/home/HomeScreen.dart';


class PublicController{
 static openHome(BuildContext context)
  {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return HomeScreen(
          controller: HomeController()
        );
      },
    ));
  }
}