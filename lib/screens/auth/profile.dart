import 'package:client_app/screens/home/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight -
                      MediaQuery.of(context).viewInsets.bottom,
                ),
                child: IntrinsicHeight(
                    child: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? Row(
                            children: [
                              _Image(),
                              Expanded(
                                  child: Column(
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).padding.top + 20,
                                  ),
                                  _Title(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _Name(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _Email(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  _Button()
                                ],
                              ))
                            ],
                          )
                        : Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).padding.top + 20,
                              ),
                              _Image(),
                              _Title(),
                              const SizedBox(
                                height: 40,
                              ),
                              _Name(),
                              const SizedBox(
                                height: 20,
                              ),
                              _Email(),
                              _Button()
                            ],
                          )),
              ),
            )),
      );
    });
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Lets set up your profile",
        style: Theme.of(context).textTheme.bodyLarge);
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
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .9),
        child: Image.asset(
          "assets/images/register.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _Email extends StatelessWidget {
  const _Email({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        label: const Text("Email"),
        hoverColor: Theme.of(context).primaryColor,
        contentPadding: const EdgeInsets.all(0),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        label: const Text("Full Name"),
        hoverColor: Theme.of(context).primaryColor,
        contentPadding: const EdgeInsets.all(0),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            child: const Text("Continue"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
