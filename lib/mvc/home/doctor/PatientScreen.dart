import 'package:dollar_task/globals.dart';
import 'package:dollar_task/shared/design/SizeConfig.dart';
import 'package:flutter/material.dart';
import '../../../model/Item.dart';
import '../../../shared/AppFont.dart';
import '../../../shared/LocalString.dart';
import '../../../shared/design/ColorConstants.dart';
import '../../../shared/design/CommonConstants.dart';
import '../../../shared/inputWidget/InputField.dart';
import '../../../shared/inputWidget/InputFieldMulti.dart';
import '../../../shared/widget/CustomRounded.dart';
import '../HomeController.dart';
import 'AppointmentScreen.dart';
import 'PaymentScreen.dart';

class PatientScreen extends StatefulWidget {
  final HomeController controller;
  String doctorName;
  PatientScreen({Key? key, required this.controller,required this.doctorName}) : super(key: key);

  @override
  _PatientScreenState createState() {
    return _PatientScreenState();
  }
}

class _PatientScreenState extends State<PatientScreen> {

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
          title:Text( LocalString.getStringValue(context, 'patient_details') ??
              "المريض",  style: AppFont.regular.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
              fontSize: CommonConstants.meduimText),) ,

        ),
        body: SingleChildScrollView(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                about()
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
          Text("Full Name" ,style: AppFont.bold.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
              fontSize: CommonConstants.meduimText),),
          SizedBox(height: 5,),
          InputField(
            controller: widget.controller.registerFirstController,
            keyboardType: TextInputType.text,
            //labelText: 'Email address',
            placeholder:
            LocalString.getStringValue(context, 'first_name') ??
                'الاسم الأول',
            validator: (value) {
              if (value!.isEmpty) {
                return LocalString.getStringValue(
                    context, 'first_required') ??
                    'الاسم حقل مطلوب';
              }

              return null;
            },
            icon: Icons.person,
          ),
          SizedBox(height: 10,),
          Text("Gender" ,style: AppFont.bold.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
              fontSize: CommonConstants.meduimText),),
          SizedBox(height: 5,),
          buildDropDown(genders,item_gender),
          SizedBox(height: 10,),
          Text("Age" ,style: AppFont.bold.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
              fontSize: CommonConstants.meduimText),),
          SizedBox(height: 5,),
          buildDropDown(ages,item_age),
          SizedBox(height: 10,),
          Text("Write your Problem" ,style: AppFont.bold.copyWith(
              color: ColorConstants.black,
              fontWeight: FontWeight.bold,
              fontSize: CommonConstants.meduimText),),
          SizedBox(height: 5,),
          InputFieldMulti(
            controller: widget.controller.problemController,
            keyboardType: TextInputType.text,
            //labelText: 'Email address',
            placeholder:"",
            validator: (value) {
              if (value!.isEmpty) {
                return LocalString.getStringValue(
                    context, 'first_required') ??
                    'الاسم حقل مطلوب';
              }

              return null;
            },
            icon: Icons.person,
          ),

          Container(
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
                      return PaymentScreen(
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


  Item? item_gender;
  Item? item_age;
  var genders = [
    Item('Female',Icon(Icons.female,color:  ColorConstants.greenColor,)),
    Item('Male',Icon(Icons.male,color:   ColorConstants.greenColor))
  ];
  var ages = [
    Item('less 12 years',Icon(Icons.support_agent,color:  ColorConstants.greenColor,)),
    Item('more 12 years',Icon(Icons.person,color:   ColorConstants.greenColor)),
    Item('more 30 years',Icon(Icons.accessibility,color:   ColorConstants.greenColor)),
    Item('more 60 years',Icon(Icons.person_outline_sharp,color:   ColorConstants.greenColor))
  ];
  Widget buildDropDown(List<Item>genders,item_gender)
  {
    if(item_gender==null)
    {
      item_gender=genders[0];
    }
    return  Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Color(0xFFF2F2F2)
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: DropdownButton(
            isExpanded: true,
            value: item_gender,
            underline: Container(),
            items: genders.map((Item user) {
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
              item_gender=value as Item?;

              setState(() {
                value;
              });
            },
          ),
        ),
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