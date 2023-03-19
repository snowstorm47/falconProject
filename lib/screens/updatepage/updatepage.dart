import 'package:client_app/screens/updatepage/updatedialog.dart';
import 'package:client_app/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:new_version/new_version.dart';

// class Updatepage extends StatelessWidget {
//   const Updatepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const Icon(Icons.arrow_back_ios),
//       ),
//       body:  const Center(
//         child: Text("hello"),
//       )
//     );
//   }
class Updatepage extends StatefulWidget {
  const Updatepage({super.key});

  @override
  State<Updatepage> createState() => _UpdatepageState();
}

class _UpdatepageState extends State<Updatepage> {
  @override
  void initstate() {
    final newVersion = NewVersion(
      androidId: "com.snapchat.android",
    );

    super.initState();
  }

  void checkNewVersion(NewVersion newVersion) async {
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      if (status.canUpdate) {
        // newVersion.showUpdateDialog(
        //     context: context,
        //     versionStatus: status,
        //     dialogText:
        //         'New Version is available (${status.storeVersion}), Update now ',
        //     dialogTitle: "update is available");
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // return UpdateDialog();
                      return AlertDialog(
                        actionsPadding: EdgeInsets.all(0),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0))),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 60,
                              width: 100,
                              child: Image.asset(
                                "assets/images/logo.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text("Falcon Delivery"),
                            const SizedBox(height: 20),
                            const Text("Version:  1.2.03(22.11.14)"),
                            const Text("Serial Number: a2b3156c"),
                            const Text("Model Name: alpha123"),
                            const Text("Model Number:  FC9A/X"),
                          ],
                        ),
                        actions: [
                          Container(
                            height: 56,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        foregroundColor: Colors.green),
                                    child: const Text("Check for updates"),
                                  ),
                                ),
                                Container(
                                  height: 56,
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  child: TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    style: TextButton.styleFrom(
                                        foregroundColor: Colors.black),
                                    child: const Text("Cancel"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Text(
                "Check for Updates",
                style: Theme.of(context).textTheme.bodyLarge,
              ))),
    );
  }
}
