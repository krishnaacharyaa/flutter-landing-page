import 'package:app/core/util/constants.dart';
import 'package:app/core/util/entities.dart';
import 'package:app/core/util/responsive/responsive_layout.dart';
import 'package:app/core/util/responsive/responsive_text.dart';
import 'package:app/core/util/responsive/responsive_text_style.dart';
import 'package:app/onboarding/domain/model.dart';
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
            Column(
              children: [
                CarouselSlider.builder(
                  carouselController: buttonCarouselController,
                  itemCount: features.length,
                  itemBuilder: (context, index, realIndex) {
                    return !isMobile(context)
                        ? Row(
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                child: GIFContainer(
                                    gifContent: features[index].gif),
                              ),
                              AppSizedBoxOfWidth(
                                  width: isDesktop(context) ? 96.0 : 72),
                              Flexible(
                                  flex: 1,
                                  child: ContentContainer(
                                      featureModel: features[index])),
                            ],
                          )
                        : Column(
                            children: [
                              GIFContainer(gifContent: features[index].gif),
                              const AppSizedBoxOfHeight(),
                              _DotContainer(
                                currentIndex: _currentIndex,
                              ),
                            ],
                          );
                  },
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: !isMobile(context) ? 400 : 450,
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
                isMobile(context)
                    ? ContentContainer(featureModel: features[_currentIndex])
                    : const SizedBox.shrink()
              ],
            ),
            Positioned(
              top: isMobile(context) ? 200 : null,
              left: 0,
              child: Visibility(
                visible: _currentIndex != 0,
                child: IconButton(
                  icon: Icon(
                    color: Colors.grey,
                    Icons.keyboard_arrow_left_rounded,
                    size: isDesktop(context) ? 60 : 40,
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
            ),
            Positioned(
              top: isMobile(context) ? 200 : null,
              right: 0,
              child: Visibility(
                visible: _currentIndex != features.length - 1,
                child: IconButton(
                  icon: Icon(
                    color: Colors.grey,
                    Icons.keyboard_arrow_right_rounded,
                    size: isDesktop(context) ? 60 : 40,
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
            ),
          ],
        ),
        AppSizedBoxOfHeight(height: !isMobile(context) ? 32 : 16),
        !isMobile(context)
            ? _DotContainer(
                currentIndex: _currentIndex,
              )
            : const SizedBox.shrink()
      ],
    );
  }
}

class _DotContainer extends StatefulWidget {
  final int currentIndex;
  const _DotContainer({required this.currentIndex});

  @override
  State<_DotContainer> createState() => _DotContainerState();
}

class _DotContainerState extends State<_DotContainer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: features.asMap().entries.map((entry) {
        final int index = entry.key;
        final bool isActive = widget.currentIndex == index;
        return Container(
          width: !isMobile(context) ? 20.0 : 16,
          height: !isMobile(context) ? 20.0 : 16,
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                isActive ? Theme.of(context).primaryColor : Colors.transparent,
            border: isActive
                ? null
                : Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1.0,
                  ),
          ),
        );
      }).toList(),
    );
  }
}

class ContentContainer extends StatefulWidget {
  FeatureModel featureModel;
  ContentContainer({required this.featureModel, super.key});

  @override
  State<ContentContainer> createState() => _ContentContainerState();
}

class _ContentContainerState extends State<ContentContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ResponsiveText(
            text: widget.featureModel.heading,
            textStyle: getResponsiveTextStyle(context, AppTextTheme.headline)),
        const AppSizedBoxOfHeight(height: 16),
        ResponsiveText(
            text: widget.featureModel.subHeading,
            textStyle: getResponsiveTextStyle(context, AppTextTheme.title)),

        const AppSizedBoxOfHeight(height: 32),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.featureModel.details
              .map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(!isMobile(context) ? 4 : 2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: lightGreen),
                          child: Icon(
                            Icons.done,
                            size: !isMobile(context) ? 24 : 16,
                            color: darkGreen,
                          ),
                        ),
                        const AppSizedBoxOfWidth(width: 16),
                        Expanded(
                          child: ResponsiveText(
                            text: e,
                            textStyle: getResponsiveTextStyle(
                                context, AppTextTheme.title),
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        )
        // Add more content here as needed
      ],
    );
  }
}

class GIFContainer extends StatelessWidget {
  String gifContent;
  GIFContainer({
    super.key,
    required this.gifContent,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: curvedBorderRadius,
      child: Image.asset(
        gifContent,
        fit: BoxFit.fill,
        height: 400,
        width: double.infinity,
      ),
    );
  }
}
