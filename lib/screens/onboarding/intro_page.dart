import 'package:client_app/models/step_model.dart';
import 'package:client_app/screens/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<StepModel> list = StepModel.list;
  final _controller = PageController();
  var initialPage = 0;

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      setState(() {
        initialPage = _controller.page!.round();
      });
    });

    return Scaffold(
      body: Container(
          child: initialPage == list.indexOf(list.first)
              ? Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    stops: [0.1, 0.9],
                    colors: [Color(0xff3ED576), Color(0xff0A1F11)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  child: Column(
                    children: [
                      //_appBar(),
                      _body(_controller),
                      _indicator(),
                    ],
                  ),
                )
              : initialPage == list.indexOf(list.last)
                  ? Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        stops: [0.1, 0.9],
                        colors: [Color(0xff3ED576), Color(0xff0A1F11)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                      child: Column(
                        children: [
                          //_appBar(),
                          _body(_controller),
                          _indicator(),
                        ],
                      ),
                    )
                  : Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        stops: [0.4, 0.5, 0.7],
                        colors: [
                          Color(0xff3ED576),
                          Color(0xcccccccc),
                          Color(0xff0A1F11)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                      child: Column(
                        children: [
                          // _appBar(),
                          _body(_controller),
                          _indicator(),
                        ],
                      ),
                    )),
    );
  }

  _body(PageController controller) {
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: <Widget>[
                Stack(children: <Widget>[
                  initialPage == list.indexOf(list.first)
                      ? Container(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            height: 140,
                            child: Image.asset(
                              "assets/lotties/cloud.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      : initialPage == list.indexOf(list.last)
                          ? Container(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                height: 140,
                                child: Image.asset("assets/lotties/cloud.png"),
                              ),
                            )
                          : SizedBox(
                              height: 140,
                              child: Image.asset("assets/lotties/cloud.png"),
                            )
                ]),
                index == 3
                    ? _displayText(list[index].text)
                    : _displayImage(list[index].id),
                const SizedBox(
                  height: 60,
                ),
                index == 3
                    ? _displayImage(list[index].id)
                    : _displayText(list[index].text),
              ],
            ),
          );
        },
      ),
    );
  }

  _indicator() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        width: 180,
        height: 90,
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Opacity(
                opacity: initialPage == list.indexOf(list.last) ? 0.0 : 1.0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  width: 77,
                  height: 77,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                              0.0, 0.0), // shadow direction: bottom right
                        )
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                            initialPage == list.indexOf(list.last) ? 24 : 100),
                      ),
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Color(0xff1CEF31)),
                      value: (initialPage + 1) / (list.length),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  initialPage == list.indexOf(list.last)
                      ? {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const Auth()),
                          )
                        }
                      : {
                          _controller.animateToPage(initialPage + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn)
                        };
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  width: initialPage == list.indexOf(list.last) ? 180 : 65,
                  height: initialPage == list.indexOf(list.last) ? 64 : 65,
                  decoration: BoxDecoration(
                    color: Color(0xff1CEF31),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                          initialPage == list.indexOf(list.last) ? 24 : 100),
                    ),
                  ),
                  child: initialPage == list.indexOf(list.last)
                      ? const Center(
                          child: Text(
                            "Let's get Started",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        )
                      : const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _displayText(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      textAlign: TextAlign.center,
    );
  }

  _displayImage(int path) {
    return SizedBox(
      height: 320,
      width: 320,
      child: Image.asset(
        "assets/lotties/$path.png",
      ),
    );
  }

  _displayTopImage(int path) {
    return SizedBox(
      height: 180,
      width: 180,
      child: Image.asset(
        "assets/lotties/$path.png",
      ),
    );
  }
}
