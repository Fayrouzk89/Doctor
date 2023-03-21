import 'package:dollar_task/mvc/home/doctor/DoctorScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../shared/AppFont.dart';
import '../../shared/Cards/CategoryCard.dart';
import '../../shared/LocalString.dart';
import '../../shared/design/ColorConstants.dart';
import '../../shared/design/CommonConstants.dart';
import '../../shared/design/CommonWidget.dart';
import '../../shared/design/SizeConfig.dart';
import '../../shared/widget/BannersWidgit.dart';
import '../../shared/widget/ChipListCustom.dart';
import '../../shared/widget/CustomTextFormField.dart';
import '../../shared/widget/RoundedIconButton.dart';
import 'HomeController.dart';
import 'NavigationItem.dart';
import 'Navs/MainScreen.dart';
import '../../globals.dart' as globals;
class HomeScreen extends StatefulWidget {
  final HomeController controller;
  HomeScreen({Key? key, required this.controller}) : super(key: key);

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationItem> navigationItems = getNavigationItemList();

  NavigationItem? selectedItem;
  @override
  void initState() {
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
  Future<void> _loadData() async {
    try {
      widget.controller!.callMethods();


    } catch (err) {
      rethrow;
    }
  }
  onChanged(String va)
  {

  }
  TextEditingController searchcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  RefreshIndicator(
      onRefresh: _loadData,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              elevation: 0,
              shadowColor: Colors.white,
              snap: false,
              toolbarHeight:150,
              pinned: true,
              titleSpacing: 0,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                 titlePadding: EdgeInsets.all(0),
                  centerTitle: true,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 8.0,right: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage:
                                    AssetImage("images/user.jpeg"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  SizedBox(width: 20,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text( LocalString.getStringValue(context, 'good_morning') ??
                                          "Good Morning",  style: AppFont.regular.copyWith(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold,
                                          fontSize: CommonConstants.smallText),),
                                      SizedBox(height: 10,),
                                      Text("User",  style: AppFont.regular.copyWith(
                                          color: ColorConstants.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: CommonConstants.meduimText),),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.notifications_none,color: Colors.grey,size: 30,),
                                    tooltip: 'Comment Icon',
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.favorite_border,color: Colors.grey,size: 30,),
                                    tooltip: 'Comment Icon',
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.exit_to_app,color: Colors.grey,size: 30,),
                                    tooltip: 'Comment Icon',
                                    onPressed: () {
                                      widget.controller.exitApp();
                                    },
                                  ),
                                ],
                              ), //IconButton

                            ],
                          ),
                        ),
                        SizedBox(
                            width: SizeConfig().screenWidth* 0.895,
                            child: CustomTextFormField(
                              onChanged: onChanged,
                              hintValue: "search",
                              fillColor: ColorConstants.backgroundColor,
                              icon: InkWell(
                                  onTap: () {},
                                  child:  Icon(Icons.search,
                                      size: 30.0, color: ColorConstants.greenColor)),
                              iconButton: InkWell(
                                  onTap: () {

                                  },
                                  child: Padding(
                                      padding: const EdgeInsets.all(13.0),
                                      child: Icon( Icons.filter_list_alt,color: ColorConstants.greenColor,))),
                              controller: searchcontroller,
                            )),
                      ],
                    ),
                  ),
                  background: Container(color: Color(0xFFffffff),),
              ), //FlexibleSpaceBar
              expandedHeight: 100,

              backgroundColor: Colors.white,
              leading:  Container(),
              leadingWidth: 0, //<Widget>[]
            ),
            //SliverAppBar

            new SliverFillRemaining(

              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BannersWidgit(),
                  ),
                  buildHeader(LocalString.getStringValue(context, 'doctor_speciality') ??
                      " اختصاصاات الدكاترة",LocalString.getStringValue(context, 'view_all') ?? "مشاهدة الكل",(){}),
                  CommonWidget.rowHeight(height: 10.0),
                  buildDoctor(),
                  buildHeader(LocalString.getStringValue(context, 'top_doctors') ??
                      " أفضل الدكاترة",LocalString.getStringValue(context, 'view_all') ?? "مشاهدة الكل",(){}),
                  CommonWidget.rowHeight(height: 10.0),
                  buildBest()
                ],
              ),
            )
          ], //<Widget>[]
        ),
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: buildNavigationItems(),
          ),
        ),
      ),
    );
  }
  int currentcatIndex=0;
  List<IconData> dataIcon=[Icons.open_with_rounded,Icons.support_rounded,Icons.accessibility_sharp,Icons.healing_sharp ,Icons.handyman_rounded,Icons.male,Icons.female,Icons.more];
  List<String> data=["General","Dermatology","Cardiology","OPHTHALMIC SURGERY" ,"PATHOLOGY","PEDIATRICS","RHEUMATOLOGY","more"];
  Widget buildDoctor()
  {
   return GridView.builder(
     padding: EdgeInsets.all(0),
     physics: const NeverScrollableScrollPhysics(),
     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
       // number of items per row
       crossAxisCount: 4,
       // vertical spacing between the items
       mainAxisSpacing: 6,
       // horizontal spacing between the items
       crossAxisSpacing: 3,
       mainAxisExtent:
       SizeConfig().screenWidth * ColorConstants.categoryWidth +
           28,
     ),
     // number of items in your list
     itemCount: data.length,
     shrinkWrap: true,
     itemBuilder: (BuildContext context, int index) {
       return Container(
         child: CategoryCard(
           category:
           data[index],
           icons: dataIcon[index],
         ),
       );
     },
   );
  }
  Widget buildHeader(String text1,String text2,GestureTapCallback  pressed)
  {
    return Row(children: [
      Padding(
        padding: EdgeInsets.only(
            left: CommonConstants.paddingleft,
            right: CommonConstants.paddingright),
        child: Text(
          text1,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: CommonConstants.header1Text,
              color: ColorConstants.textColor,
              fontWeight: FontWeight.bold,
              fontFamily: CommonConstants.largeTextFont),
        ),
      ),
      Spacer(),
      GestureDetector(
        onTap: () {
          pressed;
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Text(
            text2,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: CommonConstants.header1Text,
                color: ColorConstants.greenColor,
                fontWeight: FontWeight.bold,
                fontFamily: CommonConstants.largeTextFont),
          ),
        ),
      )
    ]);
  }
  Widget buildBest()
  {
    return Container(
      child: ChipListCustom(
        shouldWrap: true,
        //scrollPhysics: AlwaysScrollableScrollPhysics(),
        supportsMultiSelect: false,
        listOfChipNames: data,

        activeBgColorList: [ ColorConstants.greenColor],
        inactiveBgColorList: [Colors.white],
        activeTextColorList: [Colors.white],

        inactiveTextColorList: [ColorConstants.greenColor
        ],
        inactiveBorderColorList: [ColorConstants.greenColor],
        listOfChipIndicesCurrentlySeclected: [currentcatIndex],
        activeBorderColorList: [Theme
            .of(context)
            .primaryColor
        ],
        extraOnToggle: (val) {
          currentcatIndex = val;
          setState(() {});
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DoctorScreen(
                  controller: widget.controller, doctorName: data[currentcatIndex],
              );
            },
          ));
        },
      ),
    );
  }
  Widget getNavScreen()
  {
   return
       MainScreen(controller: widget.controller);
  }
  List<Widget> buildNavigationItems(){
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
    list.add(buildNavigationItem(navigationItem));
    }
    return list;
  }
  navigateToPage(NavigationItem item)
  {
    if(selectedItem==navigationItems[0])
      {
        widget.controller.rate=0;
        widget.controller.callMethods();
      }
  }
  Widget buildNavigationItem(NavigationItem item){
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = item;
          navigateToPage(item);
        });
      },
      child: Container(
        width: 50,
        child: Stack(
          children: <Widget>[

            selectedItem == item
                ? Center(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorConstants.kPrimaryColorShadow,
                ),
              ),
            )
                : Container(),

            Center(
              child: Icon(
                item.iconData,
                color: selectedItem == item ? ColorConstants.kPrimaryColor : Colors.grey[400],
                size: 24,
              ),
            )

          ],
        ),
      ),
    );
  }
List<Widget> buildDealers()
{
  List<Widget> list = [];
  return list;
}
  List<Widget> buildDeals(){
    List<Widget> list = [];

    return list;
  }


}