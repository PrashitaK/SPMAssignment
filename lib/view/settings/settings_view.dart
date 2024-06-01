import 'package:assignment/common_widget/primary_button.dart';
import 'package:assignment/utils/global_data.dart';
import 'package:assignment/view/login/welcome_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../common/color_extension.dart';
import '../../common_widget/icon_item_row.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset("assets/img/back.png",
                            width: 25, height: 25, color: TColor.gray30))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Settings",
                      style: TextStyle(color: TColor.gray30, fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/img/u1.png",
                  width: 70,
                  height: 70,
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  GlobalData.fullName ?? "John Doe",
                  style: TextStyle(
                      color: TColor.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  GlobalData.email ?? "johnDoe@gmail.com",
                  style: TextStyle(
                      color: TColor.gray30,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            // const SizedBox(
            //   height: 8,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 8),
                    child: Text(
                      "General",
                      style: TextStyle(
                          color: TColor.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: TColor.border.withOpacity(0.1),
                      ),
                      color: TColor.gray60.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        const IconItemRow(
                          title: "Security",
                          icon: "assets/img/face_id.png",
                          value: "FaceID",
                        ),
                        IconItemSwitchRow(
                          title: "iCloud Sync",
                          icon: "assets/img/icloud.png",
                          value: isActive,
                          didChange: (newVal) {
                            setState(() {
                              isActive = newVal;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 8),
                    child: Text(
                      "My subscription",
                      style: TextStyle(
                          color: TColor.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: TColor.border.withOpacity(0.1),
                      ),
                      color: TColor.gray60.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      children: [
                        IconItemRow(
                          title: "Sorting",
                          icon: "assets/img/sorting.png",
                          value: "Date",
                        ),
                        IconItemRow(
                          title: "Summary",
                          icon: "assets/img/chart.png",
                          value: "Average",
                        ),
                        IconItemRow(
                          title: "Default currency",
                          icon: "assets/img/money.png",
                          value: "Indian Rupee (\u{20B9})",
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 8),
                    child: Text(
                      "Appearance",
                      style: TextStyle(
                          color: TColor.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: TColor.border.withOpacity(0.1),
                      ),
                      color: TColor.gray60.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Column(
                      children: [
                        IconItemRow(
                          title: "App icon",
                          icon: "assets/img/app_icon.png",
                          value: "Default",
                        ),
                        IconItemRow(
                          title: "Theme",
                          icon: "assets/img/light_theme.png",
                          value: "Dark",
                        ),
                        IconItemRow(
                          title: "Font",
                          icon: "assets/img/font.png",
                          value: "Inter",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  PrimaryButton(
                    title: "Sign Out",
                    onPressed: () async {
                      FirebaseAuth.instance.signOut().then((value) {
                        const SnackBar(
                          content: Text("User signed out successfully"),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeView(),
                          ),
                        );
                      }).onError((error, stackTrace) {
                        SnackBar(
                          content: Text("$error Please try again."),
                        );
                      }) as UserCredential;
                    },
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
