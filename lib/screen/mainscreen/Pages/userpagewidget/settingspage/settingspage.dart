import 'package:cook_book/const/colors.dart';
import 'package:cook_book/screen/mainscreen/Pages/userpagewidget/settingspage/contents/contactus.dart';
import 'package:cook_book/screen/mainscreen/Pages/userpagewidget/settingspage/contents/privacy.dart';
import 'package:cook_book/screen/mainscreen/Pages/userpagewidget/settingspage/contents/terms.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settingspage extends StatelessWidget {
  const Settingspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(color: const Color(primary)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => const Privacy()));
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(primary))),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            'Privacy',
                            style: GoogleFonts.poppins(
                                color: const Color(primary), fontSize: 20),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => const Terms()));
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(primary))),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            'Terms & Condition',
                            style: GoogleFonts.poppins(
                                color: const Color(primary), fontSize: 20),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const Contactus()));
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(primary))),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            'Contact Us',
                            style: GoogleFonts.poppins(
                                color: const Color(primary), fontSize: 20),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 550,
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "Version 3.0.1",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
