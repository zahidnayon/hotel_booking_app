import 'package:flutter/material.dart';
import 'package:hotel_booking_app/language/appLocalizations.dart';
import 'package:hotel_booking_app/utils/text_styles.dart';

class PagePopUp extends StatelessWidget {
  final PageViewData imageData;
  const PagePopUp({Key? key, required this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 120,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(imageData.assetsImage,
                fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Text(
              AppLocalizations(context).of(imageData.titleText),
              textAlign: TextAlign.center,
              style: TextStyles(context).getTitleStyle().copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Text(
              AppLocalizations(context).of(imageData.subText),
              textAlign: TextAlign.center,
              style: TextStyles(context).getDescriptionStyle().copyWith(
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ],
    );
  }
}

class PageViewData{
  final String titleText;
  final String subText;
  final String assetsImage;

  PageViewData(
      {required this.titleText,
      required this.subText,
      required this.assetsImage});
}