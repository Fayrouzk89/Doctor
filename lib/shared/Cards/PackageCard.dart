import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../globals.dart' as globals;
import '../../../shared/AppFont.dart';
import '../../model/Package.dart';
import '../design/ColorConstants.dart';
import '../design/CommonConstants.dart';
import '../design/SizeConfig.dart';
class PackageCard extends StatelessWidget {
  final Package? Packages;
  final void Function(Package) callBack;
  PackageCard(
    this.Packages, this.callBack
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        width: 150,
        child: Card(
          elevation: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    child:
                    Icon( Packages!.icons,color: ColorConstants.greenColor,),
                    backgroundColor: ColorConstants.ktransparentPrimaryColor,
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text( Packages!.name!,  style: AppFont.regular.copyWith(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: CommonConstants.smallText),),
                      SizedBox(height: 10,),
                      Text(Packages!.details!,  style: AppFont.regular.copyWith(
                          color: ColorConstants.black,
                          fontWeight: FontWeight.bold,
                          fontSize: CommonConstants.smallText),),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Packages!.price!,  style: AppFont.regular.copyWith(
                      color: ColorConstants.greenColor,
                      fontWeight: FontWeight.bold,
                      fontSize: CommonConstants.smallText),),
                  Text("per 30",  style: AppFont.regular.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: CommonConstants.smallText),),
                ],
              ),
              IconButton(icon: Icon((Packages!.selected==true)?Icons.radio_button_checked_sharp:Icons.radio_button_off,color: ColorConstants.greenColor,), onPressed: () { callBack(Packages!); },)
            ],
          ),
        ),
      ),


    );
  }
}