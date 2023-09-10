import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';
import 'package:flutter/material.dart';

class CommunitySection extends StatefulWidget {
  const CommunitySection({Key? key}) : super(key: key);

  @override
  _CommunitySectionState createState() => _CommunitySectionState();
}

class _CommunitySectionState extends State<CommunitySection> {
  final List<String> svgPaths = [
    'images/cbs.png', // Replace with your png paths
    'images/corridor.png',
    'images/google.png',
    'images/microsoft.png',
    'images/nb.png',
    'images/nick.png',
    'images/ny.png',
    'images/rga.png',
    'images/vox.png'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ScrollLoopAutoScroll(
        gap: 0,
        delayAfterScrollInput: const Duration(seconds: 8),
        delay: const Duration(seconds: 0),
        duration: const Duration(minutes: 10),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: svgPaths.map((svgPath) {
            return Container(
                height: 80,
                width: MediaQuery.of(context).size.width / 10,
                alignment: Alignment.center,
                child: Image.asset(svgPath));
          }).toList(),
        ),
      ),
    );
  }
}
