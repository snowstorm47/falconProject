import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.keyboard_arrow_left),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(
                        maxHeight: 70,
                        maxWidth: 70,
                      ),
                      color: Colors.red,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  )),
              const Divider(
                thickness: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 12, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Name",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Name",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Phone",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "+251",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Pronouns",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Mr, Mrs, Miss, Doctor",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Email",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "example@mail.com",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 4,
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Delete my Account",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Icon(Icons.logout, color: Colors.black),
                            SizedBox(width: 4),
                            Text(
                              "LogOut",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
