import 'package:app/core/util/constants.dart';
import 'package:app/onboarding/utils/constants.dart';
import 'package:app/onboarding/presentation/widgets/common/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FeatureSection extends StatefulWidget {
  const FeatureSection({Key? key}) : super(key: key);

  @override
  State<FeatureSection> createState() => _FeatureSectionState();
}

class _FeatureSectionState extends State<FeatureSection> {
  int _currentIndex = 0;
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CarouselSlider.builder(
              carouselController: buttonCarouselController,
              itemCount: features.length,
              itemBuilder: (context, index, realIndex) {
                return Row(
                  children: <Widget>[
                    // Left side (GIF)
                    Flexible(
                      flex: 1,
                      child: ClipRRect(
                        // Wrap the Image.asset with ClipRRect
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(213),
                          bottomLeft: Radius.circular(218),
                          bottomRight: Radius.circular(216),
                        ),
                        child: Image.asset(
                          features[index].gif,
                          fit: BoxFit.fill,
                          height: 400,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    const AppSizedBoxOfWidth(width: 96.0),
                    // Right side (Content)
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            features[index].heading,
                            style: const TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          const AppSizedBoxOfHeight(height: 16),
                          Text(
                            features[index].subHeading,
                            style: const TextStyle(fontSize: 16.0),
                          ),

                          const AppSizedBoxOfHeight(height: 32),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: features[index]
                                .details
                                .map((e) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: lightGreen),
                                            child: const Icon(
                                              Icons.done,
                                              color: darkGreen,
                                            ),
                                          ),
                                          const AppSizedBoxOfWidth(width: 16),
                                          Container(child: Text(e)),
                                        ],
                                      ),
                                    ))
                                .toList(),
                          )
                          // Add more content here as needed
                        ],
                      ),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                viewportFraction: 1,
                height: 400, // Expand to content height
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 10),
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: false,
                initialPage: 0,
                disableCenter: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Positioned(
              left: 0,
              child: IconButton(
                icon: const Icon(
                  color: Colors.grey,
                  Icons.keyboard_arrow_left_rounded,
                  size: 60,
                ),
                onPressed: () {
                  buttonCarouselController.previousPage();
                  if (_currentIndex > 0) {
                    setState(() {
                      _currentIndex--;
                    });
                  }
                },
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                icon: const Icon(
                  color: Colors.grey,
                  Icons.keyboard_arrow_right_rounded,
                  size: 60,
                ),
                onPressed: () {
                  buttonCarouselController.nextPage();
                  if (_currentIndex < features.length - 1) {
                    setState(() {
                      _currentIndex++;
                    });
                  }
                },
              ),
            ),
          ],
        ),
        const AppSizedBoxOfHeight(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: features.asMap().entries.map((entry) {
            final int index = entry.key;
            final bool isActive = _currentIndex == index;
            return Container(
              width: 20.0,
              height: 20.0,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
                border: isActive
                    ? null
                    : Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 1.0, // Adjust the width as needed
                      ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
