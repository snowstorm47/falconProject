import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateDialog extends StatefulWidget {
  const UpdateDialog({super.key});

  @override
  State<UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  // double screenHeight = 0;
  // double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    // screenHeight = MediaQuery.of(context).size.height;
    // screenWidth = MediaQuery.of(context).size.width;

    return AnimatedContainer(
      duration: Duration(milliseconds: 50),
      curve: Curves.fastLinearToSlowEaseIn,
      child: Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: _content(context),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: screenHeight / 6,
          // width: screenWidth,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: Color.fromRGBO(255, 255, 255, 1)),
          child: Center(
            child: Column(
              children: const [
                Image(
                  image: AssetImage("assets/images/logo.png"),
                  height: 100,
                  width: 100,
                ),
                Text(
                  "Falcon Delivary",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        Container(
            // height: screenHeight / 3,
            // width: screenWidth,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          const Text(
                            "ABOUT UPDATE",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                              "We added lots of new features and fix some \nbugs. Some of the features include:"),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                              "We added lots of new features \nand fix some bugs.\nSome of the features "),
                          RichText(
                            text: TextSpan(children: [
                              const TextSpan(
                                  text: "\nFor More Information visit\n",
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: 'www.falcondelivery/update/newfeatures',
                                  style: const TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {})
                            ]),
                          ),
                          //SizedBox(height:20)
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text("Update"),
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.green,
                                  textStyle: const TextStyle(fontSize: 24),
                                  padding: EdgeInsets.fromLTRB(22, 0, 25, 0),
                                ),
                              ),
                              const Spacer(),
                              const VerticalDivider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancle"),
                                style: TextButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 24),
                                    foregroundColor: Colors.black,
                                    padding: EdgeInsets.fromLTRB(22, 0, 33, 0)),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            )),
      ],
    );
  }
}
