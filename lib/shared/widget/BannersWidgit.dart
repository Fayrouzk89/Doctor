import 'package:flutter/material.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';
import '../AppSize.dart';
import '../design/ColorConstants.dart';


class BannersWidgit extends StatelessWidget {


  const BannersWidgit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void bannersFun(int index) async {

    }

    return SizedBox(
        width: AppSize(context).width * 0.9,
        height: AppSize(context).height * 0.2,
        child: Column(children: [
          Expanded(
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                      onTap: () => bannersFun(index),
                      child: Container(

                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: Colors.black,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Image.asset('images/doctor_cover.jpg',fit: BoxFit.fitWidth,)
                          /*
                          CustomCachNetworkImage(
                              image: "http://via.placeholder.com/350x150")
                              
                           */
                      
                      ));
                },
                pagination: SwiperPagination(
                    margin: EdgeInsets.zero,
                    builder: SwiperCustomPagination(builder:
                        (BuildContext context, SwiperPluginConfig? config) {
                      return ConstrainedBox(
                        child: Align(
                          alignment: Alignment.center,
                          child: DotSwiperPaginationBuilder(
                              color: ColorConstants.greyColor1,
                              activeColor: ColorConstants.primaryColor,
                              size: 10.0,
                              activeSize: 10.0)
                              .build(context, config),
                        ),
                        constraints: const BoxConstraints.expand(height: 20.0),
                      );
                    })),
                outer: true,
                autoplay: true,
                itemCount: 4 ?? 0,
              )),
        ]));
  }
}
