import 'dart:ui';

import 'package:client_app/screens/auth/auth.dart';
import 'package:client_app/screens/auth/profile.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OTP extends StatelessWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Auth()),
                  );
                },
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight -
                        56 -
                        MediaQuery.of(context).padding.top,
                  ),
                  child: IntrinsicHeight(
                    child: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? Row(
                            children: [
                              const _Image(),
                              Expanded(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).padding.top + 20,
                                  ),
                                  const _Title(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const _Discription(),
                                  Center(
                                    child: Row(
                                      children: const [
                                        _OtpInput(),
                                        _OtpInput(),
                                        _OtpInput(),
                                        _OtpInput(),
                                        _OtpInput(),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  _Counter()
                                ],
                              ))
                            ],
                          )
                        : Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).padding.bottom + 20,
                              ),
                              const _Image(),
                              const _Title(),
                              const _Discription(),
                              Row(
                                children: const [
                                  _OtpInput(),
                                  _OtpInput(),
                                  _OtpInput(),
                                  _OtpInput(),
                                  _OtpInput(),
                                ],
                              ),
                              _Counter()
                            ],
                          ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}

class _OtpInput extends StatelessWidget {
  const _OtpInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                blurRadius: 4,
              ),
            ],
          ),
          child: Center(
            child: TextField(
              keyboardType: TextInputType.number,
              showCursor: false,
              maxLines: 1,
              textAlign: TextAlign.center,
              // textInputAction: TextInputAction.next,
              onChanged: (v) {
                if (v.isNotEmpty) {
                  FocusScope.of(context).nextFocus();
                }
              },
              style: const TextStyle(
                fontSize: 24,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(0),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Verification Code",
        style: Theme.of(context).textTheme.bodyLarge);
  }
}

class _Discription extends StatelessWidget {
  const _Discription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .6,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            " We have sent a verification to the number +251975****12",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class _Counter extends StatelessWidget {
  const _Counter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
         const SizedBox(
              width: double.infinity,
              height: 24,
              child: Text(
                "00:50",
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontWeight: FontWeight.w200, color: Colors.black),
              )),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            // width: double.infinity,
            height: 80,
            child: RichText(
              text: TextSpan(children: [
                const TextSpan(
                    text: "Didnt Recieve SMS code ",
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w200)),
                TextSpan(
                    text: 'Request again?',
                    style: const TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w200),
                    recognizer: TapGestureRecognizer()..onTap = () {})
              ]),
            ),
          )
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .7),
        child: Image.asset(
          "assets/images/verify.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
