import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../utils/food_details.dart';

List<Map<String, dynamic>> categories = [
  {"name": "Banana", "price": "72.5", "color": const Color(0xffebd04c)},
  {"name": "Turnip", "price": "50.5", "color": const Color(0xfffea9b0)},
  {"name": "Renegade", "price": "40.0", "color": const Color(0xff717ba8)},
];
List<Map<String, dynamic>> searches = [
  {"name": "WHITE", "color": const Color(0xffffffff), "price": "9"},
  {"name": "BLACK", "color": const Color(0xff000000), "price": "10"},
  {"name": "BLUE", "color": const Color(0xff0551f3), "price": "14"},
];
List<Map<String, dynamic>> tags = [
  {"name": "05", "isSelected": false},
  {"name": "06", "isSelected": false},
  {"name": "07", "isSelected": false},
  {"name": "08", "isSelected": false},
  {"name": "09", "isSelected": false},
  {"name": "10", "isSelected": true},
  {"name": "11", "isSelected": false},
  {"name": "12", "isSelected": false},
];

class FoodDetailsView extends StatefulWidget {
  final String assetName;
  const FoodDetailsView({required this.assetName, super.key});

  @override
  State<FoodDetailsView> createState() => _FoodDetailsViewState();
}

class _FoodDetailsViewState extends State<FoodDetailsView> {
  List<Widget> _animatedWidgets = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (Widget i in foodDetailsWidget(context)) {
        setState(() {
          _animatedWidgets.add(i);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.sizeOf(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff2f343e),
      body: Stack(
        children: [
          // Food
          Positioned(
            // top is set to -5% of the height to make the image look better
            top: (size.height * 0.1),
            child: Hero(
              tag: widget.assetName,
              child: SizedBox(
                width: size.width,
                child: Image.asset(
                    // filterQuality is set to high to make the image look better
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    height: size.width * 0.45,
                    widget.assetName),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _animatedWidgets
                  .map((e) => e
                      .animate()
                      .slideY(
                          begin: 5,
                          duration: Duration(
                            milliseconds:
                                500 * (_animatedWidgets.indexOf(e) + 1),
                          ),
                          curve: Curves.easeOut)
                      .fadeIn(
                        begin: 0.1,
                        delay: Duration(
                            milliseconds:
                                300 * (_animatedWidgets.indexOf(e) + 1)),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
