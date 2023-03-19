import 'package:client_app/screens/history/history.dart';
import 'package:client_app/screens/map/map.dart';
import 'package:client_app/screens/order/orederpage.dart';
import 'package:client_app/screens/places/savedplaces.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Builder(
                  builder: (context) => Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 15.0, // soften the shadow
                              spreadRadius: 5.0, //extend the shadow
                              offset: Offset(
                                5.0, // Move to right 5  horizontally
                                5.0, // Move to bottom 5 Vertically
                              )),
                        ]),
                    child: IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  ),
                )),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 5  horizontally
                          5.0, // Move to bottom 5 Vertically
                        )),
                  ]),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.account_circle),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            DrawerHeader(
                child: Container(
              height: 80,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset('assets/images/bike.png'),
              ),
            )),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {},
                child: Text("Wallet", style: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            const Text(
                              "promo",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 160,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: const Image(
                                  image: AssetImage("assets/images/promo.png")),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                "Invite your friends to use the app or enter received code!",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Center(
                                child: SizedBox(
                              width: 235,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1CEF31),
                                    foregroundColor: const Color(0xFFFFFFFF),
                                  ),
                                  onPressed: () {
                                    innerModal(context);
                                  },
                                  child: const Text("Add Code")),
                            )),
                            const SizedBox(height: 12),
                            Center(
                                child: SizedBox(
                              width: 235,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text("Cancle"),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFFFFFF),
                                    foregroundColor: const Color(0xFF111111),
                                    side: const BorderSide(
                                        width: 1, style: BorderStyle.solid)),
                              ),
                            )),
                          ],
                        );
                      });
                },
                child: Text("Promo", style: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SavedPlaces()),
                  );
                },
                child:
                    Text("Saved Places", style: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const History()),
                    );
                },
                child: Text("History", style: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {},
                child:
                    Text("Get in Touch", style: TextStyle(color: Colors.black)),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    'V1.0.1',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
      body: Stack(children: [
        const MapScreen(),
        Column(
          children: [
            const SizedBox(height: 20),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(40),
              child: SizedBox(
                height: 36,
                width: 303,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderPage()),
                    );
                  },
                  child: const Text("Checkout"),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }

  Future<dynamic> innerModal(BuildContext context) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Column(
            children: [
              const Text(
                "promo",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 140,
                width: MediaQuery.of(context).size.width * 0.8,
                child:
                    const Image(image: AssetImage("assets/images/promo.png")),
              ),
              const SizedBox(
                height: 8,
              ),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Enter code sent from your friends!",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 100, right: 100),
                child: TextField(
                  // controller: _pickupLocation,
                  decoration: InputDecoration(
                    hintText: "Enter Code",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 5),
              Center(
                  child: SizedBox(
                width: 235,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1CEF31),
                      foregroundColor: const Color(0xFFFFFFFF),
                    ),
                    onPressed: () {
                      //TODO : Impliment Backend
                    },
                    child: const Text("Activate")),
              )),
              // const SizedBox(height: 12),
              Center(
                  child: SizedBox(
                width: 235,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Cancle"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFFFFF),
                      foregroundColor: const Color(0xFF111111),
                      side:
                          const BorderSide(width: 1, style: BorderStyle.solid)),
                ),
              )),
            ],
          );
        });
  }
}
