import 'package:client_app/screens/home/homepage.dart';
import 'package:client_app/screens/order/orderdetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TextEditingController _pickupLocation = new TextEditingController();
  TextEditingController _delivaryLocation = new TextEditingController();
  TextEditingController _weight = new TextEditingController();
  TextEditingController _width = new TextEditingController();
  TextEditingController _hight = new TextEditingController();

  DateTime? _chosenDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        centerTitle: true,
        title: Text(
          "Order details",
          style: TextStyle(fontSize: 24, color: Colors.grey[400]),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pickup location",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              TextField(
                controller: _pickupLocation,
                decoration: const InputDecoration(
                  hintText: "Set pickup Location",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Use my location")),
              const SizedBox(height: 12),
              const Text(
                "Delivary location",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              TextField(
                controller: _delivaryLocation,
                decoration: const InputDecoration(
                  hintText: "Set delivary Location",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Use my location")),
              const SizedBox(height: 20),
              const Text(
                "Details of the Product",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(height: 12),
              const Text(
                "Weight of product",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              TextField(
                controller: _weight,
                decoration: const InputDecoration(
                  hintText: "Set Estimated weigth of product in kg",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Width of product",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              TextField(
                controller: _hight,
                decoration: const InputDecoration(
                  hintText: "Set estimated Width of product in m",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 12),
              const Text(
                "Height of product",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              TextField(
                controller: _hight,
                decoration: const InputDecoration(
                  hintText: "Set estimated height of product in m",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Type of Item",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 0),
                          blurRadius: 5)
                    ]),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(5.0),
                        onTap: () {},
                        child: Card(
                            elevation: 10.0,
                            child: Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                children: const <Widget>[
                                  Icon(
                                    Icons.broken_image_outlined,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    'Fradgile',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ))),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 0),
                          blurRadius: 5)
                    ]),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(5.0),
                        onTap: () {},
                        child: Card(
                            elevation: 10.0,
                            child: Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                children: const <Widget>[
                                  Icon(
                                    Icons.broken_image,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    'Non Fragile',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ))),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Please Choose way of delivery",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 0),
                          blurRadius: 5)
                    ]),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(5.0),
                        onTap: () {},
                        child: Card(
                            elevation: 10.0,
                            child: Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                children: const <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 16, right: 16),
                                    child: Icon(
                                      Icons.directions_bike,
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    'Bicycle',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ))),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 0),
                          blurRadius: 5)
                    ]),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(5.0),
                        onTap: () {},
                        child: Card(
                            elevation: 10.0,
                            child: Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                children: const <Widget>[
                                  Icon(
                                    Icons.motorcycle,
                                    color: Colors.green,
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    'Motorcicyle',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ))),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 0),
                          blurRadius: 10)
                    ]),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(5.0),
                        onTap: () {},
                        child: Card(
                            elevation: 10.0,
                            child: Container(
                              padding: const EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                children: const <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 16, right: 16),
                                    child: Icon(
                                      Icons.fire_truck,
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    'Car',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ))),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 32,
                      width: 235,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OrderDetail(
                                      pickupLocation: _pickupLocation.text,
                                      delivaryLocation: _delivaryLocation.text,
                                      weight: _weight.text,
                                      height: _hight.text,
                                      width: _width.text,
                                      chosenDateTime:
                                          _chosenDateTime.toString(),
                                    )));
                          },
                          child: const Text("Checkout")),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 32,
                    width: 235,
                    child: OutlinedButton(
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) => Container(
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              height: 330,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 250,
                                    child: CupertinoDatePicker(
                                      backgroundColor: Colors.white,
                                      initialDateTime: DateTime.now(),
                                      onDateTimeChanged: (DateTime newTime) {
                                        setState(() {
                                          _chosenDateTime = newTime;
                                        });
                                      },
                                    ),
                                  ),
                                  CupertinoButton(
                                    child: const Text('OK'),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Schedule Time",
                          style: TextStyle(color: Colors.green),
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
