import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TopCarousel extends StatelessWidget {
  final List<String> images;

  const TopCarousel({Key key, this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        height: 25.0.h,
        viewportFraction: 1,
        enableInfiniteScroll: images.length > 1,
        autoPlay: images.length > 1,
        autoPlayInterval: Duration(seconds: 5),
        initialPage: 0,
      ),
      items: images.map((item) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.black),
          child: Opacity(
            opacity: 0.8,
            child: Image.network(
              item,
              fit: BoxFit.fill,
              width: double.infinity,
              errorBuilder: (_, __, ___) {
                return Image.asset(
                  'images/default_image.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              },
              height: 25.0.h,
            ),
          ),
        );
      }).toList(),
    );
  }
}
