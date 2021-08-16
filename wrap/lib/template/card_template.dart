import 'package:flutter/material.dart';
import 'package:wrap/constants/default_typography.dart';
import 'package:wrap/widgets/standard_text.dart';

class CardTemplate extends StatefulWidget {
  final String text;
  final Function()? onPressed;
  final String? iconPath;
  final bool? isNetworkImage;
  CardTemplate(
      {required this.text, this.onPressed, this.iconPath, this.isNetworkImage});

  @override
  _CardTemplateState createState() => _CardTemplateState();
}

class _CardTemplateState extends State<CardTemplate> {
  double? cardWidth;
  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    if (screenSize < DefaultTypoGraphy.cardScreenBreakPoint ||
        widget.iconPath == null &&
            screenSize <= DefaultTypoGraphy.bitCardScreenBreakPoint) {
      setState(() {
        cardWidth = screenSize - 2 * DefaultTypoGraphy.horizontalSpace;
      });
    } else if (widget.iconPath == null &&
        screenSize > DefaultTypoGraphy.bitCardScreenBreakPoint) {
      setState(() {
        cardWidth = DefaultTypoGraphy.largeCardWidth;
      });
    } else {
      setState(() {
        cardWidth = null;
      });
    }
    return Container(
      margin: EdgeInsets.all(DefaultTypoGraphy.smallSeperator),
      height: DefaultTypoGraphy.cardHeight,
      width: cardWidth,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(DefaultTypoGraphy.cardBorderRadius))),
        child: Container(
          padding: widget.iconPath != null
              ? EdgeInsets.all(DefaultTypoGraphy.cardPadding)
              : EdgeInsets.zero,
          alignment: widget.iconPath == null &&
                  screenSize < DefaultTypoGraphy.bitCardScreenBreakPoint
              ? Alignment.centerLeft
              : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.iconPath != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      DefaultTypoGraphy.cardImageSize / 2),
                  child: widget.isNetworkImage != null &&
                              widget.isNetworkImage == false ||
                          widget.isNetworkImage == null
                      ? Image.asset(
                          widget.iconPath as String,
                          height: DefaultTypoGraphy.cardImageSize,
                        )
                      : Image.network(
                          widget.iconPath as String,
                          height: DefaultTypoGraphy.cardImageSize,
                        ),
                ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: cardWidth != null
                        ? widget.iconPath != null
                            ? (cardWidth as double) / 2
                            : (cardWidth as double) -
                                2 * DefaultTypoGraphy.averageSeperator
                        : DefaultTypoGraphy.cardTextWidth,
                    margin:
                        EdgeInsets.only(left: DefaultTypoGraphy.cardSeperator),
                    child: Padding(
                      padding: widget.iconPath == null
                          ? EdgeInsets.all(DefaultTypoGraphy.averageSeperator)
                          : EdgeInsets.zero,
                      child: StandardText(
                        text: widget.text,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
