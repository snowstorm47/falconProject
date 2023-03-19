import 'package:flutter/material.dart';

import 'package:client_app/screens/auth/auth.dart';

class IntroAlt extends StatefulWidget {
  const IntroAlt({super.key});

  @override
  State<IntroAlt> createState() => _IntroAltState();
}

class _IntroAltState extends State<IntroAlt> {
// States
  int _index = 0;
  final _controller = PageController();

  final _titles = [
    "Browse the menu \n and order directly from the \n application",
    "Browse the menu\nand order directly from\nthe application",
    "Browse the menu\nand order directly from\nthe application"
  ];
  final _images = [
    "assets/images/cycle.png",
    "assets/images/motor.png",
    "assets/images/truck.png",
  ];

  @override
  Widget build(BuildContext context) {
    // _controller.addListener((() {
    //   setState(() {
    //     _index = _controller.page!.round();
    //   });
    // }));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _index == 0
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Auth()),
                    );
                  },
                  child: Text("skip"),
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                )
              ],
            )
          : _index == 2
              ? AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: InkWell(
                    child:
                        const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onTap: (() {}),
                  ),
                )
              : AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: InkWell(
                    child:
                        const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onTap: (() {}),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: Text("skip"),
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.white),
                    )
                  ],
                ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              width: 180,
              height: 90,
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Opacity(
                      opacity: _index == 2 ? 0.0 : 1.0,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        width: 77,
                        height: 77,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.green,
                  _index == 1 ? Colors.white : Colors.green,
                  Colors.green,
                ])),
          ),
          AnimatedPositioned(
            top: (MediaQuery.of(context).size.height / 2) - 200,
            height: 300,
            left: _index == 0 ? 0 : -40,
            duration: const Duration(milliseconds: 400),
            width: MediaQuery.of(context).size.width + 40,
            child: Container(
              width: MediaQuery.of(context).size.width + 40,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/building.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          PageView(
            controller: _controller,
            onPageChanged: (v) {
              setState(() {
                _index = v;
              });
            },
            children: [
              _Body(
                image: _images[0],
                title: _titles[0],
                controller: _controller,
                index: _index,
              ),
              _Body(
                image: _images[1],
                title: _titles[1],
                controller: _controller,
                index: _index,
              ),
              _Body(
                image: _images[2],
                title: _titles[2],
                controller: _controller,
                index: _index,
              ),
            ],
          ),
          AnimatedPositioned(
            top: 0,
            right: _index == 0
                ? -70
                : _index == 1
                    ? 35
                    : 150,
            duration: const Duration(milliseconds: 400),
            child: SizedBox(
              height: 300,
              width: 300,
              child: Image.asset("assets/images/cloud.png"),
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required String image,
    required String title,
    required PageController controller,
    required int index,
  })  : _image = image,
        _title = title,
        _controller = controller,
        _index = index,
        super(key: key);

  final String _image;
  final String _title;
  final PageController _controller;
  final int _index;

  @override
  Widget build(BuildContext context) {
    _indicator({required int index, required int length}) {
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
                  opacity: index == (length - 1) ? 0.0 : 1.0,
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
                          Radius.circular(index == (length - 1) ? 24 : 100),
                        ),
                      ),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(
                          begin: (index + 1) / (length),
                          end: (index + 1) / (length),
                        ),
                        duration: const Duration(milliseconds: 800),
                        builder: (context, value, _) =>
                            CircularProgressIndicator(
                          color: Colors.green,
                          value: value,
                        ),
                      ),
                      // child: CircularProgressIndicator(
                      //   valueColor: ,
                      //   value: (index + 1) / (length),
                      // ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    index == (length - 1)
                        ? {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const Auth(),
                              ),
                            )
                          }
                        : {
                            _controller.animateToPage(index + 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn)
                          };
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    width: index == (length - 1) ? 180 : 65,
                    height: index == (length - 1) ? 64 : 65,
                    decoration: BoxDecoration(
                      color: Color(0xff1CEF31),
                      borderRadius: BorderRadius.all(
                        Radius.circular(index == (length - 1) ? 24 : 100),
                      ),
                    ),
                    child: index == (length - 1)
                        ? const Center(
                            child: Text(
                              "Let's get Started",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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

    return Column(
      children: [
        const Spacer(),
        SizedBox(
          width: 200,
          height: 240,
          child: Image(
            image: AssetImage(_image),
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 40),
        Container(
          alignment: Alignment.bottomCenter,
          child: Text(
            _title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const SizedBox(height: 40),
        _indicator(
          index: _index,
          length: 3,
        ),
      ],
    );
  }
}
