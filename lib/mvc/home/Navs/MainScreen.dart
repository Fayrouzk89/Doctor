import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../shared/LocalString.dart';
import '../../../shared/design/ColorConstants.dart';
import '../../../shared/design/SizeConfig.dart';
import '../../../shared/widget/CustomEmptyWidget.dart';
import '../../../shared/widget/RoundedIconButton.dart';
import '../HomeController.dart';


class MainScreen extends StatefulWidget {
  final HomeController controller;
  MainScreen({Key? key, required this.controller}) : super(key: key);

  @override
  _MainScreenState createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    widget.controller!.callMethods();
  }

  @override
  void dispose() {
    super.dispose();
  }
  TextEditingController? _editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
   Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: EdgeInsets.all(3),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8),
                      child: TextField(
                         controller: _editingController,
                        decoration: InputDecoration(
                          hintText:  LocalString.getStringValue(context, 'search_with') ??
                              "ابحث هنا",
                          hintStyle: TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.only(left: 10,right: 10),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 24.0, left: 16.0),
                            child: IconButton(
                              onPressed: () {
                                String title="";
                                if(_editingController!.text!=null && _editingController!.text!="")
                                  {
                                    title=_editingController!.text!.toString();
                                  }
                                //widget.controller.callSearch(title);
                              },
                              icon: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 3,),
                  RoundedIconButton(
                    onTap: () {
                      displayFilter();
                    },
                    icon: 'images/filter.svg',
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Container(
              //    physics: BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [

                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            LocalString.getStringValue(context, 'products_new') ??
                                "المنتجات الحديثة",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400],
                            ),
                          ),

                          Row(
                            children: [

                              Text(
                                LocalString.getStringValue(context, 'view_all') ?? "مشاهدة الكل",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.kPrimaryColor,
                                ),
                              ),

                              SizedBox(
                                width: 8,
                              ),

                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: ColorConstants.kPrimaryColor,
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                    Obx(
                          () =>buildProductBody(),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      );
  }
  Widget buildProductBody() {
    /*
    return (widget.controller!.Products!=null && widget.controller!.Products.value!=null && widget.controller!.Products.value!.data!.length>0)?
    Container(
      // height: 300,
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),

          scrollDirection: Axis.vertical,
          itemCount:widget.controller!.Products.value!.data!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing:3,

          ),
          itemBuilder: (BuildContext context, int index) {
          return ProductCard(
            product: widget.controller!.Products.value!.data![index],
          );
        },
        )
    ):
    (widget.controller!.Products!=null && widget.controller!.Products.value!=null && widget.controller!.Products.value!.data!.length==0)?
    EmptyWidgetCustom():

     */
   return ShimmerWidget();
  }
  Widget EmptyWidgetCustom()
  {
    return CustomEmptyWidget(title: LocalString.getStringValue(
        context, 'products_list') ??
        "قائمة المنتجات", subtitle: LocalString.getStringValue(
        context, 'no_data_found') ??
        "لا يوجد منتجات", packageImage: PackageImage.Image_2);
  }
  Widget ShimmerWidget()
  {
    return Container(
      // height: 300,
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),

          scrollDirection: Axis.vertical,
          itemCount:6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing:3,

          ), itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 200,
            width: SizeConfig().screenWidth*0.5,
            margin:
            EdgeInsets.only(right: 10, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),

            ),
            child: Shimmer(
              duration: Duration(seconds: 1),
              interval: Duration(seconds: 1),
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  height: 110,
                  width: SizeConfig().screenWidth*0.5,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10)),
                      color: Colors.grey[300]),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 15, width: 130, color: Colors.grey[300]),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 10,
                                    width: 50,
                                    color: Colors.grey[300]),
                              ]),
                        ]),
                  ),
                ),
              ]),
            ),
          );
        },
        )
    );
  }
  displayFilter()
  {
    final _dialog = RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        LocalString.getStringValue(
            context, 'rating_product') ??
            "تقييم المنتج",
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      // your app's logo?
      image: Image.asset('images/logo.png',width: 100,height: 100,),
      submitButtonText:  LocalString.getStringValue(
          context, 'confirm_rating') ??
          "تأكيد",
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');
           widget.controller.rate= response.rating!.toInt();
        // TODO: add your own logic
       // _rateAndReviewApp(response.rating);
      },
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => _dialog,
    );
  }
}