import 'package:coin_pay/core/utils/color_res.dart';
import 'package:coin_pay/features/home_page/widgets/home_page_widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: ColorRes.primaryColor,
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: ColorRes.lightGrey.withAlpha(30),
                ),
              ),
            ],
          ),
          const HomePageWidgets(),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: bottomNavBar(),
          ),
        ],
      ),
     
    );
  }
}
