import 'package:flutter/material.dart';
import 'package:onboarding/src/introduction_screen.dart';
import 'package:onboarding/src/model/page_decoration.dart';
import 'package:onboarding/src/model/page_view_model.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(
        builder: (context) => Padding(
          padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
          child: IntroductionScreen(
            pages: [
              PageViewModel(
                  title: 'A reader lives a thousand lives',
                  body: 'The man who never reads lives only one.',
                  decoration: PageDecoration(
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                    bodyTextStyle: TextStyle(color: Colors.white, fontSize: 20),
                    descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
                    imagePadding: EdgeInsets.all(24),
                    pageColor: Colors.black,
                  )),
              PageViewModel(
                  title: 'A reader lives a thousand lives',
                  body: 'The man who never reads lives only one.',
                  decoration: PageDecoration(
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                    bodyTextStyle: TextStyle(color: Colors.white, fontSize: 20),
                    descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
                    imagePadding: EdgeInsets.all(24),
                    pageColor: Colors.black,
                  )),
              PageViewModel(
                  title: 'A reader lives a thousand lives',
                  body: 'The man who never reads lives only one.',
                  decoration: PageDecoration(
                    titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                    bodyTextStyle: TextStyle(color: Colors.white, fontSize: 20),
                    descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
                    imagePadding: EdgeInsets.all(24),
                    pageColor: Colors.black,
                  )),
            ],
            showDoneButton: false,
            showNextButton: false,
            onChange: (index) {},
            globalFooter: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () => {},
              ),
            ),
          ),
        ),
      ),
    );
  }
}
