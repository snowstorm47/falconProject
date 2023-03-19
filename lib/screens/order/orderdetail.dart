import 'package:client_app/screens/map/map.dart';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';

class OrderDetail extends StatelessWidget {
  late String pickupLocation,
      delivaryLocation,
      weight,
      height,
      width,
      chosenDateTime;

  //const OrderDetail({super.key});
  OrderDetail({
    super.key,
    required this.pickupLocation,
    required this.delivaryLocation,
    required this.weight,
    required this.height,
    required this.width,
    required this.chosenDateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const MapScreen(),
        _modal(),
      ],
    ));
  }

  DraggableScrollableSheet _modal() {
    return DraggableScrollableSheet(

        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.6,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Summery",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Pickup Location: ",
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          pickupLocation,
                          style: const TextStyle(color: Colors.black),
                        ),
                        const Divider(
                          thickness: 2,
                          color: Colors.black54,
                          height: 12,
                          indent: 1,
                          endIndent: 12,
                        ),
                        const Text(
                          "Delivary Location: ",
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          delivaryLocation,
                          style: const TextStyle(color: Colors.black),
                        ),
                        const Divider(
                          thickness: 2,
                          color: Colors.black54,
                          height: 12,
                          indent: 1,
                          endIndent: 12,
                        ),
                        const Text(
                          "Weight of the object in kg: ",
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          weight,
                          style: const TextStyle(color: Colors.black),
                        ),
                        const Divider(
                          thickness: 2,
                          color: Colors.black54,
                          height: 12,
                          indent: 1,
                          endIndent: 12,
                        ),
                        const Text(
                          "Height of the object in m: ",
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          height,
                          style: const TextStyle(color: Colors.black),
                        ),
                        const Divider(
                          thickness: 2,
                          color: Colors.black54,
                          height: 12,
                          indent: 1,
                          endIndent: 12,
                        ),
                        const Text(
                          "width of the object in m: ",
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          width,
                          style: const TextStyle(color: Colors.black),
                        ),
                        const Divider(
                          thickness: 2,
                          color: Colors.black54,
                          height: 12,
                          indent: 1,
                          endIndent: 12,
                        ),
                        const Text(
                          "Scheduled for: ",
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          chosenDateTime,
                          style: const TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 30),
                        Center(
                            child: SizedBox(
                          width: 235,
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text("Continue")),
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
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
