import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/constant/color.dart';
import '../cubit/authentication/authentication_cubit.dart';
import '../cubit/project/project_cubit.dart';
import '../widgets/_widgets.dart';
import '../widgets/components/_components.dart';
import '../widgets/top_carousel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext ctx) => AlertDialog(
                        title: CustomTextLato('Are you sure?'),
                        content: CustomTextLato(
                            'You are going to logout your account.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(false),
                            child: CustomTextLato('NO'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop(true);
                              context.read<AuthenticationCubit>().logOut();
                            },
                            child: CustomTextLato(
                              'YES',
                              color: CPColors.green,
                            ),
                          ),
                        ],
                      ));
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 1.0),
          child: BlocBuilder<ProjectCubit, ProjectState>(
            builder: (context, state) {
              if (state is ProjectLoading) {
                return LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(CPColors.green),
                  backgroundColor: Colors.white,
                );
              } else if (state is ProjectError) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.white,
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextLato('Check your connection'),
                        Icon(
                          Icons.wifi_off,
                          color: CPColors.grey,
                        )
                      ],
                    )));
              }
              return SizedBox();
            },
          ),
        ),
        title: Image.asset(
          'images/century_logo.png',
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocBuilder<ProjectCubit, ProjectState>(
              builder: (context, state) {
                if (state is ProjectLoaded) {
                  return TopCarousel(
                    images: state.projects
                        .map((project) => project.bannerUrl)
                        .toList(),
                  );
                }
                return SizedBox();
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: BlocBuilder<ProjectCubit, ProjectState>(
                builder: (context, state) {
                  if (state is ProjectLoading) {
                    return Center(
                      child: Container(
                        child: CustomTextLato(
                          'Please wait...',
                          size: 10.0.sp,
                        ),
                      ),
                    );
                  } else if (state is ProjectLoaded) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<AuthenticationCubit, AuthenticationState>(
                          builder: (context, state) {
                            if (state is Authenticated) {
                              return CustomTextLato(
                                'WELCOME ${state.user.username.toUpperCase()} ,',
                                size: 10.0.sp,
                                color: CPColors.darkGreen,
                                weight: FontWeight.w900,
                                style: FontStyle.italic,
                              );
                            }
                            return Container();
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomTextLato(
                          'FEATURED PROJECTS',
                          weight: FontWeight.w900,
                          size: 10.0.sp,
                        ),
                        FeaturedProjects(
                          list: state.projects,
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
