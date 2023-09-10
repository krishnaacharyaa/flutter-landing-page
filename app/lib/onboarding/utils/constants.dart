import 'package:app/onboarding/domain/model.dart';
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
// Nav elements
const List<String> navItems = ["Product", "Subscribe", "About"];

// NavBar Constants
const double logoSizeDesktop = 50;
const double logoSizeTablet = 40;
const double logoSizeMobile = 30;

// Hero Constants
const String heading = "Imagination Meets Intelligence";
const String subHeading =
    "As AI as your collaborator to create anything you can imagine";
const String heroImage = "images/hero_image.png";

const double heroImageHeightDesktop = 500;
const double heroImageHeightTablet = 450;
const double heroImageHeightMobile = 400;

// Feature Constants
final List<FeatureModel> features = [
  FeatureModel(
      gif: "gifs/custom_ai_training.gif",
      heading: "Custom AI Training",
      subHeading: "Create your own custom portrait generator for text to image",
      details: [
        "Upload your desired photos",
        "Give a unique name",
        "Click Create Portrait"
      ]),
  FeatureModel(
      gif: "gifs/background_removal.gif",
      heading: "Background Removal",
      subHeading: "Remove background from any video",
      details: [
        "Import your clip",
        "Create a Mask for object of interest",
        "Click Export "
      ]),
  FeatureModel(
      gif: "gifs/text_to_image.gif",
      heading: "Text to Image",
      subHeading: "Create an image by entering descriptive text.",
      details: ["Write your prompt", "Adjust Settings ", "Click Generate"]),
  FeatureModel(
      gif: "gifs/inpainting.gif",
      heading: "Inpainting",
      subHeading: "Automatically remove unwanted objects throughout your clip",
      details: ["Import your clips", "Inpaint", "Click Export"]),
];
