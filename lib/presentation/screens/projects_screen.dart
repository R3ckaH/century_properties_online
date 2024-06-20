import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../domain/entities/project.dart';
import '../widgets/_widgets.dart';
import '../widgets/components/_components.dart';

class ProjectsScreen extends StatefulWidget {
  final Project item;
  final bool isTap;
  ProjectsScreen({this.item, this.isTap = true});

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   actions: [
        //     Container(
        //       margin: EdgeInsets.only(right: 10),
        //       child: CircleAvatar(
        //         backgroundColor: CPColors.darkGrey,
        //         radius: 22,
        //         child: CircleAvatar(
        //           radius: 20,
        //           backgroundImage: AssetImage('images/user_icon.png'),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  TopCarousel(
                    images: [widget.item.bannerUrl],
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProjectDescriptionAndButton(
                          item: widget.item,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        LiveView(widget.item.url),
                      ],
                    ),
                  )
                ],
              ),
            ),
            widget.isTap
                ? CustomButtonBack(
                    adsOnPressed: () {},
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
