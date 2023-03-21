import 'package:dollar_task/globals.dart';
import 'package:dollar_task/shared/design/SizeConfig.dart';
import 'package:flutter/material.dart';
import '../../../model/Item.dart';
import '../../../model/Package.dart';
import '../../../shared/AppFont.dart';
import '../../../shared/Cards/PackageCard.dart';
import '../../../shared/Cards/StatisticCard.dart';
import '../../../shared/LocalString.dart';
import '../../../shared/design/ColorConstants.dart';
import '../../../shared/design/CommonConstants.dart';
import '../../../shared/widget/CustomRounded.dart';
import '../HomeController.dart';
import 'AppointmentScreen.dart';
import 'PatientScreen.dart';
typedef doSomeThing(Package package);
class PackageScreen extends StatefulWidget {
  final HomeController controller;
  String doctorName;
  PackageScreen({Key? key, required this.controller,required this.doctorName}) : super(key: key);

  @override
  _PackageScreenState createState() {
    return _PackageScreenState();
  }
}

class _PackageScreenState extends State<PackageScreen> {

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
        appBar:  AppBar(
          title:Text( LocalString.getStringValue(context, 'select_package') ??
              "اختر حزمة",  style: AppFont.regular.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
              fontSize: CommonConstants.meduimText),) ,
        ),
        body: SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Center(child: about()),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                          horizontal: CommonConstants.horizontalPaddingButton,
                          vertical: CommonConstants.verticalPaddingButton),
                      child: CustomRounded(
                        text:  LocalString.getStringValue(context, 'next') ??
                            "التالي",
                        textSize: CommonConstants.textButton,
                        textColor:Colors.white ,
                        color:ColorConstants.greenColor   ,
                        size: Size(SizeConfig().screenWidth * 0.8,
                            CommonConstants.roundedHeight),
                        pressed: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return PatientScreen(
                                controller: widget.controller, doctorName: widget.doctorName,
                              );
                            },
                          ));
                        },
                      )),
                ),
              ],
            ) //<Widget>[]
        ),
      ),
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
          Text("Select Duration" ,style: AppFont.bold.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
              fontSize: CommonConstants.meduimText),),
          SizedBox(height:10,),
          buildDropDown(),
          SizedBox(height: 10,),
          Text("Select Package" ,style: AppFont.bold.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
              fontSize: CommonConstants.meduimText),),
          buildListView(),
          SizedBox(height: 5,),

        ],
      ),
    );
  }
  var users = [
     Item('30 Minutes',Icon(Icons.history,color:  ColorConstants.greenColor,)),
     Item('40 Minutes',Icon(Icons.history,color:   ColorConstants.greenColor)),
     Item('50 Minutes',Icon(Icons.history,color:  ColorConstants.greenColor)),
     Item('60 Minutes',Icon(Icons.history,color:  ColorConstants.greenColor)),
  ];
  int index=0;
  Item? user;
  Widget buildDropDown()
  {
    if(index==0)
      {
        user=users[0];
      }
    return  Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Color(0xFFF2F2F2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: DropdownButton(
            isExpanded: true,
            value: user,
            underline: Container(),
            items: users.map((Item user) {
              return DropdownMenuItem(
                value: user,
                child: Row(
                  children: [
                    user.icon,
                    SizedBox(width: 10,),
                    Text(
                      user.name,
                      style:  AppFont.bold.copyWith(
                          color: ColorConstants.black,
                          fontWeight: FontWeight.w300,
                          fontSize: CommonConstants.smallText),
                    ),
                  ],
                ),
              );
            }).toList(),
            onChanged: (value) {
              user=value as Item?;
              index++;
              setState(() {
                value;
              });
            },
          ),
        ),
      ),
    );
  }
 void doSomeThing (Package p)
  {
   print("callBack");

   for (int i=0;i<Packages.length;i++)
     {
       Packages[i].selected=false;
     }
   p.selected=true;
   setState(() {

   });
  }
  var Packages=[Package("Messaging","Chat Message with doctor","30\$",false,Icons.mail),
    Package("Voice Call","Voice Call with doctor","40\$",false,Icons.call ),
    Package("Video","Video call with doctor","30\$",false,Icons.video_call )
  ];

  Widget buildListView()
  {
    return  Container(
      // height: 300,
        child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount:Packages.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:1,
              mainAxisSpacing:3,
              mainAxisExtent: 100

          ), itemBuilder: (BuildContext context, int index) {
          return PackageCard(Packages[index],doSomeThing);
        },
        )

    );
  }
}