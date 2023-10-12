import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wah_admin/infrastructure/dal/model/MainSide.dart';
import 'package:wah_admin/infrastructure/dal/model/mainSideSetting.dart';
import 'package:wah_admin/infrastructure/theme/app_colors.dart';
import 'package:wah_admin/presentation/dashboard/controllers/dashboard.controller.dart';

class Sidebar extends StatelessWidget {
  Sidebar({super.key, this.controller});
  DashboardController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      decoration: const BoxDecoration(
        color: primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black87,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: defaultPadding * 2,
            ),
            Container(
              child: Text(
                "Menu",
                style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(
              height: defaultPadding * 2,
            ),
            ListView.builder(
              shrinkWrap:
                  true, // Allow the list to take up only the necessary space
              itemCount: demoMainSide.length,
              itemBuilder: (context, index) {
                return ListTile1(demoMainSide[index]);
              },
            ),
            const SizedBox(
              height: defaultPadding * 2,
            ),
            Divider(
              height: 1,
            ),
            ListView.builder(
              shrinkWrap:
                  true, // Allow the list to take up only the necessary space
              itemCount: demoMainSideSetting.length,
              itemBuilder: (context, index) {
                return ListTile2(index, demoMainSideSetting[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Container ListTile1(MainSide mainSide) {
    return Container(
      child: mainSide.submenu!.isEmpty
          ? Obx(() => Container(
                decoration: BoxDecoration(
                    color: controller!.selectedMenu.value == mainSide.id
                        ? Color(0xFFCCEDDD)
                        : Colors.transparent,
                    gradient: const LinearGradient(
                        colors: [Color(0xFF58D9D9), Color(0xFF5747EF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
                child: ListTile(
                  hoverColor: Color(0xFFCCEDDD),
                  onTap: () {
                    controller!.selectedMenu.value = mainSide;
                  },
                  leading: Padding(
                    padding: const EdgeInsets.only(left: defaultPadding * 1.5),
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: Icon(
                        mainSide.icon,
                        color: controller!.selectedMenu.value.id == mainSide.id
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                  title: Text(
                    mainSide.title!,
                    style: GoogleFonts.ubuntu(
                        color: controller!.selectedMenu.value.id == mainSide.id
                            ? Colors.black
                            : Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ))
          : ExpansionTile(
              leading: Icon(mainSide.icon),
              title: Text(mainSide.title!),
              children: mainSide.submenu!.map((submenu) {
                return ListTile1(submenu);
              }).toList(),
            ),
    );
  }

  Container ListTile2(int index, MainSideSetting mainSide) {
    return Container(
      child: Obx(() => Container(
            decoration: BoxDecoration(
                color: controller!.selectedMenu.value.id == index + 5
                    ? Color(0xFFCCEDDD)
                    : Colors.transparent,
                gradient: const LinearGradient(
                    colors: [Color(0xFF58D9D9), Color(0xFF5747EF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: ListTile(
              hoverColor: Color(0xFFCCEDDD),
              onTap: () {
                controller!.selectedMenu.value.id = index + 5;
              },
              leading: Padding(
                padding: const EdgeInsets.only(left: defaultPadding * 1.5),
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Icon(
                    mainSide.icon,
                    color: controller!.selectedMenu.value.id == index + 5
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
              title: Text(
                mainSide.title,
                style: GoogleFonts.ubuntu(
                    color: controller!.selectedMenu.value.id == index + 5
                        ? Colors.black
                        : Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )),
    );
  }
}
