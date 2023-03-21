import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../globals.dart' as globals;
import '../../../shared/AppFont.dart';
import '../design/ColorConstants.dart';
import '../design/CommonConstants.dart';
import '../design/SizeConfig.dart';
class CategoryCard extends StatelessWidget {
  final String? category;
  final IconData? icons;
  CategoryCard({
    this.category,this.icons
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        decoration: BoxDecoration(
          //  border: Border.all(color: Color(0xffeeeeee), width: 2.0),
          //color: Colors.white38,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.white10,
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        margin: EdgeInsets.all(1),
        //height: ColorConstants.categoryHeight,
        width: SizeConfig().screenWidth*ColorConstants.categoryWidth-10,
        height: SizeConfig().screenWidth*ColorConstants.categoryWidth+5,
        child:
        Column(
          children: [
            Container(
              height: SizeConfig().screenWidth*ColorConstants.categoryWidth,
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                    backgroundColor: ColorConstants.greenColor.withAlpha(80),
                    radius: SizeConfig().screenWidth*ColorConstants.categoryWidth,
                    child:  Icon(icons,size: 40,color: ColorConstants.greenColor,)
                ),
              ),
            ),
            Text(
              (category!),
              textAlign: TextAlign.center,
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: ColorConstants.textColor,
                  fontFamily: CommonConstants.largeTextFont),)
          ],
        )

        ),

    );
  }
}