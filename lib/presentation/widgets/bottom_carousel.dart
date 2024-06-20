import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../domain/entities/fproject.dart';
import 'components/custom_text_lato.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BottomCarousel extends StatelessWidget {
  final FeatureProject item;

  BottomCarousel({@required this.item});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(1),
      child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 4,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
          ),
          items: item.imgRoomList.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: [
                    InteractiveViewer(
                      child: Image.asset(
                        item.imgSrc,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: CustomTextLato(
                        item.title,
                        color: Colors.white,
                        size: 10.0.sp,
                      ),
                    )
                  ],
                );
              },
            );
          }).toList()),
    );
  }
}
