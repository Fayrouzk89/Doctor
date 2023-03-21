import 'package:dollar_task/globals.dart';
import 'package:dollar_task/shared/design/SizeConfig.dart';
import 'package:flutter/material.dart';
import '../../../model/Item.dart';
import '../../../model/Package.dart';
import '../../../shared/AppFont.dart';
import '../../../shared/Cards/PackageCard.dart';
import '../../../shared/Cards/PaymentCard.dart';
import '../../../shared/Cards/StatisticCard.dart';
import '../../../shared/LocalString.dart';
import '../../../shared/design/ColorConstants.dart';
import '../../../shared/design/CommonConstants.dart';
import '../../../shared/widget/CustomRounded.dart';
import '../HomeController.dart';
import 'AppointmentScreen.dart';
import 'PatientScreen.dart';
import 'ReviewScreen.dart';

class PaymentScreen extends StatefulWidget {
  final HomeController controller;
  String doctorName;
  PaymentScreen({Key? key, required this.controller,required this.doctorName}) : super(key: key);

  @override
  _PaymentScreenState createState() {
    return _PaymentScreenState();
  }
}

class _PaymentScreenState extends State<PaymentScreen> {

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
          title:Text( LocalString.getStringValue(context, 'payments') ??
              "الدفع",  style: AppFont.regular.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
              fontSize: CommonConstants.meduimText),) ,
          actions: [IconButton(
            icon: Icon(Icons.payments,color: Colors.grey,size: 25,),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ),],
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
                              return ReviewScreen(
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
          SizedBox(height: 5,),
          buildListView(),
          SizedBox(height: 5,),
          GestureDetector(
            onTap: () {

            },
            child: Container(
              height: 80,
              child: Card(
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      child:
                      Icon(Icons.add,color: ColorConstants.greenColor,),
                      backgroundColor: ColorConstants.ktransparentPrimaryColor,
                    ),
                    Text( "Add New Card",  style: AppFont.regular.copyWith(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: CommonConstants.smallText),),

                    IconButton(icon: Icon(Icons.radio_button_off,color: ColorConstants.greenColor,), onPressed: () {  },)
                  ],
                ),
              ),
            ),


          ),

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
  var Packages=[Package("Pay Pal","Chat Message with doctor","30\$",false,Icons.payments),
    Package("Google Pay","Voice Call with doctor","40\$",false,Icons.g_mobiledata_rounded ),
    Package("Apple Pay","Video call with doctor","30\$",false,Icons.apple )
  ];
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
          //return PackageCard(Packages[index]);
          return PaymentCard(Packages[index],doSomeThing);
        },
        )

    );
  }
}