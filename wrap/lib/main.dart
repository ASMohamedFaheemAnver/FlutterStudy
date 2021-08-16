import 'package:flutter/material.dart';
import 'package:wrap/template/card_template.dart';
import 'package:wrap/widgets/standard_text.dart';

import 'constants/default_typography.dart';
import 'constants/strings.dart';

void main() {
  runApp(MainScreen());
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: StandardText(
            text: OTHER_RESOURCES_LABEL,
            fontSize: DefaultTypoGraphy.largeText,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(
                  vertical: DefaultTypoGraphy.verticalSpace,
                  horizontal: DefaultTypoGraphy.horizontalSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StandardText(
                    text: EDUCATIONAL_RESOURCE_DESCRIPTION,
                    fontSize: DefaultTypoGraphy.extraLargeText,
                  ),
                  SizedBox(
                    height: DefaultTypoGraphy.largeSeperator,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        CardTemplate(
                          text: WEBSITE_LABEL,
                          // iconPath: WEBSITE_ICON_PATH,
                          onPressed: () {},
                        ),
                        CardTemplate(
                          text: YOUTUBE_LABEL,
                          // iconPath: YOUTUBE_ICON_PATH,
                          onPressed: () {},
                        ),
                        CardTemplate(
                          text: FACEBOOK_LABEL,
                          // iconPath: FACEBOOK_ICON_PATH,
                          onPressed: () {},
                        ),
                        CardTemplate(
                          text: TELEGRAM_BOT_LABEL,
                          // iconPath: BOT_ICON_PATH,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: DefaultTypoGraphy.largeSeperator,
                  ),
                  StandardText(
                    text: GROUP_DESCRIPTION,
                    fontSize: DefaultTypoGraphy.extraLargeText,
                  ),
                  SizedBox(
                    height: DefaultTypoGraphy.largeSeperator,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        CardTemplate(
                          text: STUDENT_FORUM_LABEL,
                          // iconPath: LOGO_PATH,
                          onPressed: () {},
                        ),
                        CardTemplate(
                          text: PHYSICS_GROUP_LABEL,
                          // iconPath: PHYSICS_GROUP_ICON_PATH,
                          onPressed: () {},
                        ),
                        CardTemplate(
                          text: BIO_GROUP_LABEL,
                          // iconPath: BIO_GROUP_ICON_PATH,
                          onPressed: () {},
                        ),
                        CardTemplate(
                          text: MATH_GROUP_LABEL,
                          // iconPath: MATH_GROUP_ICON_PATH,
                          onPressed: () {},
                        ),
                        CardTemplate(
                          text: CHEMISTRY_GROUP_LABEL,
                          // iconPath: CHEMISTRY_GROUP_ICON_PATH,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: DefaultTypoGraphy.largeSeperator,
                  ),
                  StandardText(
                    text: COMMON_CHANNELS_DESCRIPTION,
                    fontSize: DefaultTypoGraphy.extraLargeText,
                  ),
                  SizedBox(
                    height: DefaultTypoGraphy.largeSeperator,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        CardTemplate(
                          text: TREASURE_CHEST_FILES_GROUP_LABEL,
                          // iconPath: FILES_GROUP_ICON_PATH,
                          onPressed: () {},
                        ),
                        Opacity(
                          opacity: 0,
                          child: CardTemplate(
                            text: TREASURE_CHEST_FILES_GROUP_LABEL,
                            // iconPath: FILES_GROUP_ICON_PATH,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
