import 'package:flutter/material.dart';

class SavedPlaces extends StatefulWidget {
  const SavedPlaces({super.key});

  @override
  State<SavedPlaces> createState() => _SavedPlacesState();
}

class _SavedPlacesState extends State<SavedPlaces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                alignment: Alignment.center,
                height: 240,
                width: 240,
                child: Image(image: AssetImage("assets/images/addplaces.png")),
              ),
              const Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Sorry! no saved places here",
                    style: TextStyle(color: Colors.black)),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(40),
                child: SizedBox(
                  height: 36,
                  width: 303,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      savemodal(context);
                    },
                    child: const Text("Add a Place"),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Future<dynamic> savemodal(BuildContext context) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
          return Column(
            children: [
              const Text(
                "Save Place",
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
                child: const Image(image: AssetImage("assets/images/pin.png")),
              ),
              const SizedBox(
                height: 8,
              ),

              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 100, right: 100),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Location",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Or",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
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
                    child: const Text("Set Point on map")),
              )),
              // const SizedBox(height: 12),
              Center(
                  child: SizedBox(
                width: 235,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Cancle"),
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
