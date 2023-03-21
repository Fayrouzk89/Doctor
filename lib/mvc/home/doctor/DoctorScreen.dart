import 'package:dollar_task/globals.dart';
import 'package:dollar_task/shared/design/SizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../shared/AppFont.dart';
import '../../../shared/Cards/StatisticCard.dart';
import '../../../shared/LocalString.dart';
import '../../../shared/design/ColorConstants.dart';
import '../../../shared/design/CommonConstants.dart';
import '../../../shared/widget/CustomRounded.dart';
import '../HomeController.dart';
import 'AppointmentScreen.dart';

class DoctorScreen extends StatefulWidget {
  final HomeController controller;
  String doctorName;
  DoctorScreen({Key? key, required this.controller,required this.doctorName}) : super(key: key);

  @override
  _DoctorScreenState createState() {
    return _DoctorScreenState();
  }
}

class _DoctorScreenState extends State<DoctorScreen> {

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }
  Future<void> _loadData() async {
    try {



    } catch (err) {

    }
  }
  onChanged(String va)
  {

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  RefreshIndicator(
      onRefresh: _loadData,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:Text(widget.doctorName,  style: AppFont.regular.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
              fontSize: CommonConstants.meduimText),) ,
          actions: [
            IconButton(
              icon: Icon(Icons.more_outlined,color: Colors.grey,size: 25,),
              tooltip: 'Comment Icon',
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite_border,color: Colors.grey,size: 25,),
              tooltip: 'Comment Icon',
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.white,
                elevation: 10,
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                                image: AssetImage('images/doctor.jpg'),
                                fit: BoxFit.cover),
                            borderRadius:
                            BorderRadius.all(Radius.circular(75.0)),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {

                      },
                      child:Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(widget.doctorName,  style: AppFont.regular.copyWith(
                              color: ColorConstants.black,
                              fontWeight: FontWeight.bold,
                              fontSize: CommonConstants.meduimText),),
                           SizedBox(height: 10,),

                          Text("Molan Hospital in London UK",  style: AppFont.regular.copyWith(
                              color: ColorConstants.black,
                              fontWeight: FontWeight.w300,
                              fontSize: CommonConstants.smallText),)
                        ],
                      )
                    ),
                  ],
                ),
              ),
              buildSecondRow(),
              about()
            ],
          ) //<Widget>[]
        ),
      ),
    );
  }
 Widget buildSecondRow()
 {
   return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       StatisticCard(
         category:
         "Patients",
        detils: "40000",
         icons: Icons.people_alt_sharp,
       ),
       StatisticCard(
         category:
         "Years Experience",
         detils: "10+",
         icons: Icons.photo_sharp,
       ),
       StatisticCard(
         category:
         "Rating",
         detils: "4.5",
         icons: Icons.star,
       ),

       StatisticCard(
         category:
         "Reviews",
         detils: "2344",
         icons: Icons.people_alt_sharp,
       ),
     ],
   );
 }
 Widget about()
 {
   return Padding(
     padding: const EdgeInsets.all(12),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text("About Me" ,style: AppFont.bold.copyWith(
             color: ColorConstants.black,
             fontWeight: FontWeight.bold,
             fontSize: CommonConstants.meduimText),),
         SizedBox(height: 5,),
         ReadMoreText(
           'The Flutter framework builds its layout via the composition of widgets, The Flutter framework builds its layout via the composition of widgets everything that you construct programmatically is a widget and these are compiled together to create the user interface. ',
           trimLines: 4,
           style: AppFont.bold.copyWith(
               color: ColorConstants.black,
               fontWeight: FontWeight.w300,
               fontSize: CommonConstants.smallText),
           colorClickableText: ColorConstants.greenColor,
           trimMode: TrimMode.Line,
           trimCollapsedText: '...Read more',
           trimExpandedText: ' Less',
         ),
         SizedBox(height: 10,),
         Text("Working Time" ,style: AppFont.bold.copyWith(
             color: ColorConstants.black,
             fontWeight: FontWeight.bold,
             fontSize: CommonConstants.meduimText),),
         SizedBox(height: 5,),
         Text("Mon - Fri, 8:00AM - 2:00 PM" ,style: AppFont.bold.copyWith(
             color: ColorConstants.black,
             fontWeight: FontWeight.w300,
             fontSize: CommonConstants.smallText),),
         SizedBox(height: 10,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text("Reviews" ,style: AppFont.bold.copyWith(
                 color: ColorConstants.black,
                 fontWeight: FontWeight.bold,
                 fontSize: CommonConstants.meduimText),),
             GestureDetector(
               onTap: () {

               },
               child: Padding(
                 padding: const EdgeInsets.only(left: 8.0, right: 8),
                 child: Text(
                   "View All",
                   textAlign: TextAlign.center,
                   style: TextStyle(
                       fontSize: CommonConstants.header1Text,
                       color: ColorConstants.greenColor,
                       fontWeight: FontWeight.bold,
                       fontFamily: CommonConstants.largeTextFont),
                 ),
               ),
             )
           ],
         ),
         SizedBox(height: 20,),
         Text("Make Appointment" ,style: AppFont.bold.copyWith(
             color: ColorConstants.black,
             fontWeight: FontWeight.bold,
             fontSize: CommonConstants.meduimText),),
         SizedBox(height: 10,),
         buildDates(),
         Container(
             alignment: Alignment.center,
             margin: EdgeInsets.symmetric(
                 horizontal: CommonConstants.horizontalPaddingButton,
                 vertical: CommonConstants.verticalPaddingButton),
             child: CustomRounded(
               text:  LocalString.getStringValue(context, 'create_appointment') ??
                   "انشاء موعد",
               textSize: CommonConstants.textButton,
               textColor:Colors.white ,
               color:ColorConstants.greenColor   ,
               size: Size(SizeConfig().screenWidth * 0.8,
                   CommonConstants.roundedHeight),
               pressed: () {
                 Navigator.push(context, MaterialPageRoute(
                   builder: (context) {
                     return AppointmentScreen(
                       controller: widget.controller, doctorName: widget.doctorName,
                     );
                   },
                 ));
               },
             )),
       ],
     ),
   );
 }
 Widget buildDates()
 {
   return Row(
     mainAxisAlignment: MainAxisAlignment.center,
     crossAxisAlignment: CrossAxisAlignment.center,
     children: [
       buildSingleDate("Mon","10"),
       SizedBox(width: 5,),
       buildSingleDate("Tue","11"),
       SizedBox(width: 5,),
       buildSingleDate("Wed","12"),
       SizedBox(width: 5,),
       buildSingleDate("Thru","13"),
       SizedBox(width: 5,),
       buildSingleDate("Fri","14")
     ],
   );
 }
 Widget buildSingleDate(String date,String num)
 {
  return Container(
       width: SizeConfig().screenWidth/6,
       height:  SizeConfig().screenWidth/6,
       decoration: BoxDecoration(
         border: Border.all(
             color: ColorConstants.greenColor,
             width: 2.0,
             style: BorderStyle.solid
         ),
         borderRadius: BorderRadius.circular(20),
         color: Colors.white,
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Text(date,style: AppFont.bold.copyWith(
               color: ColorConstants.black,
               fontWeight: FontWeight.w300,
               fontSize: CommonConstants.smallText),),
           SizedBox(height: 10,),
           Text(num,style: AppFont.bold.copyWith(
               color: ColorConstants.black,
               fontWeight: FontWeight.w300,
               fontSize: CommonConstants.smallText)),
         ],
       )
   );
 }
}