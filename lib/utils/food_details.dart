import 'package:flutter/cupertino.dart';
import 'package:food_ui/widgets/buy.dart';

import '../widgets/categories.dart';
import '../widgets/search.dart';
import '../widgets/tags.dart';

List<Widget> foodDetailsWidget(BuildContext context) => [
      SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.4,
      ),
      // category
      // Categories(),
      RecentSearch(),
      Tags(),
      Buy()
    ];
