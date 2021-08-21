import 'package:getx_boilerplate/features/presentation/components/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:getx_boilerplate/features/presentation/utils/common.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Home"),
      body: Container(
        padding: EdgeInsets.all(12),
        child: CustomImageCarousel(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CustomImageCarousel extends StatefulWidget {
  const CustomImageCarousel({
    Key? key,
  }) : super(key: key);

  @override
  _CustomImageCarouselState createState() => _CustomImageCarouselState();
}

class _CustomImageCarouselState extends State<CustomImageCarousel> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [1, 2, 3, 4]
                .map(
                  (e) => Container(
                    color: kColorPrimary,
                  ),
                )
                .toList(),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [1, 2, 3, 4].asMap().entries.map((e) {
            final isCurrent = currentIndex == e.key;
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              color: isCurrent ? kColorPrimary : Colors.grey,
              height: isCurrent ? 8 : 4,
              width: isCurrent ? 15 : 4,
              // decoration: BoxDecoration(borderRadius: ),
              margin: EdgeInsets.only(right: 12),
            );
          }).toList(),
        )
      ],
    );
  }
}
