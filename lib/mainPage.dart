import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';

class MainPage extends StatefulWidget{
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
 
  IconData icon = Icons.arrow_downward_rounded;
  bool isDownloaded = false;

  void downloadContact() {
    /* AnchorElement anchorElement = new AnchorElement(href: 'assets/DavideStefanini.vcf');
    anchorElement.download = "Davide";
    anchorElement.click(); */
    setState(() {
      isDownloaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    var submitTextStyle = TextStyle(
        fontSize: 10,
        letterSpacing: 2,
        color: Colors.white,
        fontWeight: FontWeight.w300);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [  
          Container(
            height: height,
            width: width,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Image(image: AssetImage('assets/bg.png'))
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: height * 0.5,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Color.fromARGB(202, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0),
                  ],
                )
              ),
            )
          ),
          Positioned(
            bottom: height * 0.2,
            child: /* isDownloaded ? Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 193, 190, 190),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.download_done_outlined)
                    ],
                  ),
                ),
              ) : */ AnimatedButton(
                animatedOn: AnimatedOn.onTap,
                onPress: downloadContact,
                onChanges: (change) {},
                height: 70,
                width: 200,
                text: !isDownloaded ? 'Download Contact' : 'Downloaded',
                isReverse: true,
                selectedTextColor: Colors.white,
                transitionType: TransitionType.TOP_CENTER_ROUNDER,
                textStyle: submitTextStyle,
                backgroundColor: Colors.black.withAlpha(0),
                selectedBackgroundColor: Colors.white.withAlpha(80),
                borderColor: Colors.white,
                borderWidth: 1,
                borderRadius: 20,
              ),   
          )
        ] 
      ),
    );
  }
}