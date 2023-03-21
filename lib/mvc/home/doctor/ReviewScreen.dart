import 'package:dollar_task/globals.dart';
import 'package:dollar_task/shared/design/SizeConfig.dart';
import 'package:flutter/material.dart';
import '../../../shared/AppFont.dart';
import '../../../shared/LocalString.dart';
import '../../../shared/design/ColorConstants.dart';
import '../../../shared/design/CommonConstants.dart';
import '../../../shared/widget/CustomRounded.dart';
import '../HomeController.dart';


class ReviewScreen extends StatefulWidget {
  final HomeController controller;
  String doctorName;
  ReviewScreen({Key? key, required this.controller,required this.doctorName}) : super(key: key);

  @override
  _ReviewScreenState createState() {
    return _ReviewScreenState();
  }
}

class _ReviewScreenState extends State<ReviewScreen> {

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
          title:Text( LocalString.getStringValue(context, 'review_summary') ??
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
          Card(
            color: Colors.white,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  buildRow("Date & Hour","Dec 22,2022 -10:00AM"),
                  SizedBox(height: 5,),
                  buildRow("Package","Message"),
                  SizedBox(height: 5,),
                  buildRow("Duration","30 Minutes"),
                  SizedBox(height: 5,),
                ],
              ),
            )
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8),
            child: Column(
              children: [
                buildRow("Amount","20 \$"),
                SizedBox(height: 10,),
                buildRow("Duration(30 Minutes)","1*20\$"),
                SizedBox(height: 10,),
                buildRow("Total","20\$"),
              ],
            ),
          ),
          SizedBox(height: 10,),
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
                      Icon(Icons.apple,color: ColorConstants.greenColor,),
                      backgroundColor: ColorConstants.ktransparentPrimaryColor,
                    ),
                    Text( "Apple Pay",  style: AppFont.regular.copyWith(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: CommonConstants.smallText),),

                    IconButton(icon: Icon(Icons.radio_button_checked_sharp,color: ColorConstants.greenColor,), onPressed: () {  },)
                  ],
                ),
              ),
            ),


          )

        ],
      ),
    );
  }
 Widget buildRow(String text1,String text2)
 {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8),
          child: Text(text1,style: AppFont.regular.copyWith(
              color: Colors.black26,
              fontWeight: FontWeight.bold,
              fontSize: CommonConstants.smallText), ),
        ),
      ),
      Text("90:sds ",style: AppFont.bold.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: CommonConstants.smallText), ),
    ],
  );
 }
}