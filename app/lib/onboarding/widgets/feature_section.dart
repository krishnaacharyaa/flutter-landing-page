import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FeatureSection extends StatefulWidget {
  const FeatureSection({Key? key}) : super(key: key);

  @override
  _FeatureSectionState createState() => _FeatureSectionState();
}

class _FeatureSectionState extends State<FeatureSection> {
  final List<String> gifs = [
    "gifs/background_removal.gif",
    "gifs/background_removal.gif",
    "gifs/background_removal.gif",
    "gifs/background_removal.gif",
  ];

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
              itemCount: gifs.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    children: <Widget>[
                      // Left side (GIF)
                      Flexible(
                        flex: 1,
                        child: Image.asset(
                          gifs[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      // Right side (Content)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Item $index',
                            style: const TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Description for Item $index goes here.',
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          // Add more content here as needed
                        ],
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                enlargeFactor: 0.9,
                height: 400, // Expand to content height
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
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
                icon: const Icon(Icons.chevron_left),
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
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  buttonCarouselController.nextPage();
                  if (_currentIndex < gifs.length - 1) {
                    setState(() {
                      _currentIndex++;
                    });
                  }
                },
              ),
            ),
          ],
        ),
        // Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: gifs.asMap().entries.map((entry) {
            final int index = entry.key;
            final bool isActive = _currentIndex == index;
            return Container(
              width: 10.0,
              height: 10.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
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
