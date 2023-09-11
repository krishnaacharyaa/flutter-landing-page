import 'package:app/onboarding/domain/model/award_model.dart';
import 'package:app/onboarding/domain/model/feature_model.dart';
import 'package:flutter/material.dart';
// Pages constants
// OnBoarding

const double heightBetweenElementsDesktop = 56;
const double heightBetweenElementsTablet = 48;
const double heightBetweenElementsMobile = 32;

const BorderRadius curvedBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(213),
  bottomLeft: Radius.circular(218),
  bottomRight: Radius.circular(216),
);

// Widget Constants
// Nav elements
const String product = "Product";
const String subscribe = "Subscribe";
const String about = "About";
const List<String> navItems = [product, subscribe, about];
const String logoTitle = "ImagineWorks";
const String logoIcon = "assets/svg/logo.svg";
// NavBar Constants
const double logoSizeDesktop = 50;
const double logoSizeTablet = 40;
const double logoSizeMobile = 30;

// Hero Constants
const String heading = "Imagination Meets Intelligence";
const String subHeading =
    "As AI as your collaborator to create anything you can imagine";
const String heroImage = "assets/images/hero_image.png";

const double heroImageHeightDesktop = 500;
const double heroImageHeightTablet = 450;
const double heroImageHeightMobile = 400;

// Feature Constants
final List<FeatureModel> features = [
  FeatureModel(
      gif: "assets/gifs/custom_ai_training.gif",
      heading: "Custom AI Training",
      subHeading: "Create your own custom portrait generator for text to image",
      details: [
        "Upload your desired photos",
        "Give a unique name",
        "Click Create Portrait"
      ]),
  FeatureModel(
      gif: "assets/gifs/background_removal.gif",
      heading: "Background Removal",
      subHeading: "Remove background from any video",
      details: [
        "Import your clip",
        "Create a Mask for object of interest",
        "Click Export "
      ]),
  FeatureModel(
      gif: "assets/gifs/text_to_image.gif",
      heading: "Text to Image",
      subHeading: "Create an image by entering descriptive text.",
      details: ["Write your prompt", "Adjust Settings ", "Click Generate"]),
  FeatureModel(
      gif: "assets/gifs/inpainting.gif",
      heading: "Inpainting",
      subHeading: "Automatically remove unwanted objects throughout your clip",
      details: ["Import your clips", "Inpaint", "Click Export"]),
];

const double heightOfCarousel = 400;
const double sizeOfDotDesktopTablet = 20;
const double sizeOfDotMobile = 16;
const int timeToWaitForEachCarousel = 10;

// Awards Constants
final List<AwardModel> awards = [
  AwardModel(
      imageUrl: 'assets/images/award_1.png', title: "Stage 1 & 2 Winners"),
  AwardModel(
      imageUrl: "assets/images/award_2.png",
      title: "Second place in 3/4 events"),
  AwardModel(
      imageUrl: "assets/images/award_3.png",
      title: "Finalist in the virtual circuit")
];
const String learnMore = "Learn More";

// SubFeature Constants
const String subFeatureHeading = "Create Personal Image";
const String subFeatureGIF1 = "assets/gifs/subfeature_1.gif";
const String subFeatureGIF2 = "assets/gifs/subfeature_2.gif";
const double heightOfGIF = 400;

// Footer Constants
const footerTitle = "\u00a9 2023 AAUNO Inc. All rights reserved.";
const List<String> footerItems = [
  "Terms of Service",
  "Privacy Policy",
  "Code of Conduct"
];
const List<String> footerlogos = [
  "assets/svg/reddit.svg",
  "assets/svg/linkedIn.svg",
  "assets/svg/facebook.svg",
  "assets/svg/youtube.svg",
  "assets/svg/twitter.svg",
  "assets/svg/instagram.svg",
  "assets/svg/tiktok.svg"
];

// Community Constants
final List<String> communityLogos = [
  'assets/images/cbs.png', // Replace with your png paths
  'assets/images/corridor.png',
  'assets/images/google.png',
  'assets/images/microsoft.png',
  'assets/images/nb.png',
  'assets/images/nick.png',
  'assets/images/ny.png',
  'assets/images/rga.png',
  'assets/images/vox.png'
];

const int noOfLogosDesktop = 8;
const int noOfLogosTablet = 6;
const int noOfLogosMobile = 4;

const double heightOfLogo = 80;

//About Us Constants
const aboutUsString =
    "AAUNO is an independent research lab focused in the field of Artificial Intelligence, Blockchain and Autonomous Systems, exploring efficient and cost effective ways in solving problems in these domain.\n\nWe believe everyone is unique and has a story. Our mission is to make technology accessible to all.\n\nWe are a small self-funded, fully-distributed passionate team who are domain experts in there field working with decades of experience and an incredible set of open minded advisors.";
