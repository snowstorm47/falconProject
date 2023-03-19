import 'package:client_app/data/countries.dart';
import 'package:client_app/models/country/country.dart';
import 'package:client_app/screens/auth/otp.dart';
import 'package:flutter/material.dart';
import 'package:client_app/screens/home/homepage.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  Country _selectedCountry =
      COUNTRIES.where((e) => e.countryCode == "ET").toList()[0];

  void _changeCountry({required Country country}) {
    setState(() {
      _selectedCountry = country;
    });
  }

  List<Country>? _countries;

  @override
  void initState() {
    _countries = COUNTRIES;
    _countries!.sort(
      (a, b) => a.countryEn.compareTo(b.countryEn),
    );
    super.initState();
  }

  void _openCountriesModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(builder: (context, setModalState) {
          return DraggableScrollableSheet(
            minChildSize: .959,
            initialChildSize: .959,
            maxChildSize: .96,
            snap: true,
            builder: (context, controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 6,
                        width: MediaQuery.of(context).size.width * .5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).dividerColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text("Choose country code"),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          onChanged: (v) {
                            if (v.isEmpty) {
                              _countries = COUNTRIES;
                            } else {
                              _countries = COUNTRIES
                                  .where((e) => e.countryEn
                                      .toLowerCase()
                                      .contains(v.toLowerCase()))
                                  .toList();
                            }
                            // setState(() {});
                            setModalState(() {});
                          },
                          decoration: const InputDecoration(
                            hintText: "Search ...",
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                  if (_countries != null)
                    Expanded(
                      child: ListView.builder(
                        controller: controller,
                        itemCount: _countries!.length,
                        padding: const EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          print(_countries!.length);
                          print(_countries!.map((e) => e.countryEn));
                          return ListTile(
                            onTap: () {
                              _changeCountry(country: _countries![index]);
                              Navigator.of(context).pop();
                              _countries = COUNTRIES;
                            },
                            leading: SizedBox(
                              height: 40,
                              width: 60,
                              child: Image.network(
                                  "https://countryflagsapi.com/png/${_countries![index].countryCode}"),
                            ),
                            title: Text(_countries![index].countryEn),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          // resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight -
                      MediaQuery.of(context).viewInsets.bottom,
                  // minWidth: constraints.maxWidth,
                ),
                child: IntrinsicHeight(
                  child: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? Row(
                          children: [
                            // Logo,
                            _Logo(),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).padding.top + 20,
                                  ),
                                  _Title(),
                                  _Motto(),
                                  Expanded(
                                      child: _Input(
                                          selectedCountry: _selectedCountry)),
                                  _Button(),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).padding.top + 20,
                            ),
                            _Title(),
                            _Logo(),
                            _Motto(),
                            _Input(selectedCountry: _selectedCountry),
                            _Button(),
                          ],
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Input extends StatelessWidget {
  const _Input({
    Key? key,
    required Country selectedCountry,
  })  : _selectedCountry = selectedCountry,
        super(key: key);

  final Country _selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Country
        InkWell(
          onTap: () {
            // open country select modal
            // _openCountriesModal();
          },
          child: Container(
            height: 24,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 48,
                  child: Image.network(
                    "https://countryflagsapi.com/png/${_selectedCountry.countryCode}",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 8),
                Text(_selectedCountry.countryEn),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Text input
        TextField(
          autofocus: true,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            label: const Text("Phone Number"),
            hoverColor: Theme.of(context).primaryColor,
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 40,
                  width: 80,
                  decoration: const BoxDecoration(
                      // border: Border.all(color: Colors.red),
                      ),
                  child: Center(
                    child: Text("+${_selectedCountry.phoneCode}"),
                  ),
                ),
                const SizedBox(width: 16),
              ],
            ),
            contentPadding: const EdgeInsets.all(0),
          ),
        ),
        const SizedBox(height: 20),
      ],
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
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const OTP(),
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

class _Motto extends StatelessWidget {
  const _Motto({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * .6,
        child: Column(
          children: [
            Text(
              "Whether you've been riding with us or it's your first time, let's get your number.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 20),
            Text(
              " We'll send a text to verify your phone.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 20),
          ],
        ));
  }
}

class _Logo extends StatelessWidget {
  const _Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * .9),
        child: Image.asset(
          "assets/images/bike.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Welcome to Falcon Delivery",
        style: Theme.of(context).textTheme.bodyLarge);
  }
}
