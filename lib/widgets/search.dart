import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../views/food_detail_view.dart';

class RecentSearch extends StatelessWidget {
  const RecentSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "RECENT SEARCH",
          style:
              GoogleFonts.lato(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: size.height * 0.25,
          child: ListView.builder(
              itemCount: searches.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: size.width * 0.28,
                        height: size.height * 0.16,
                        decoration: BoxDecoration(
                          gradient: RadialGradient(
                            center: Alignment.center,
                            colors: [
                              // Color.lerp is used to create a gradient between the color and white
                              Color.lerp(
                                  searches[index]["color"], Colors.white, 0.1)!,
                              searches[index]["color"],
                              Color.lerp(
                                  searches[index]["color"], Colors.black, 0.1)!,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Price",
                                style: GoogleFonts.lato(
                                  color: Color(0xffaf3d3d),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                "\$${searches[index]["price"]}",
                                style: GoogleFonts.lato(
                                  color: Colors.red,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        searches[index]["name"],
                        style: GoogleFonts.lato(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
                    .animate()
                    .slideY(
                      begin: 5,
                      duration: Duration(
                        milliseconds: 400 * (index + 1),
                      ),
                      curve: Curves.easeOut,
                    )
                    .fadeIn(
                      begin: 0.1,
                      delay: Duration(
                        milliseconds: 200 * (index + 1),
                      ),
                    );
              }),
        ),
      ],
    );
  }
}
