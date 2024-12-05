import 'package:cook_book/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms & Condtion',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: const Color(primary),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Last updated: December 03, 2024 \nPlease read these terms and conditions carefully before using Our Service.',
                style: GoogleFonts.poppins(
                    color: const Color(primary), fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Interpretation and Definitions',
                style: GoogleFonts.poppins(
                    color: const Color(primary),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Interpretation',
                style: GoogleFonts.poppins(
                    color: const Color(primary),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.',
                style: GoogleFonts.poppins(
                    color: const Color(primary), fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Definintion',
                style: GoogleFonts.poppins(
                    color: const Color(primary),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              RichText(
                text: TextSpan(
                  text: 'For the purposes of these Terms and Conditions:',
                  style: GoogleFonts.poppins(
                      color: const Color(primary), fontSize: 15),
                  children: [
                    TextSpan(
                      text: '\nApplication',
                      style: GoogleFonts.poppins(
                          color: const Color(primary),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          ' means the software program provided by the Company downloaded by You on any electronic device, named CookBook\n',
                      style: GoogleFonts.poppins(
                          color: const Color(primary), fontSize: 15),
                    ),
                    TextSpan(
                      text: 'Application Store',
                      style: GoogleFonts.poppins(
                          color: const Color(primary),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          ' means the digital distribution service operated and developed by Apple Inc. (Apple App Store) or Google Inc. (Google Play Store) in which the Application has been downloaded.\n',
                      style: GoogleFonts.poppins(
                          color: const Color(primary), fontSize: 15),
                    ),
                    TextSpan(
                      text: 'Company ',
                      style: GoogleFonts.poppins(
                          color: const Color(primary),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          '(referred to as either "the Company", "We", "Us" or "Our" in this Agreement) refers to CookBook.\n',
                      style: GoogleFonts.poppins(
                          color: const Color(primary), fontSize: 15),
                    ),
                    TextSpan(
                      text: 'Terms and Conditions ',
                      style: GoogleFonts.poppins(
                          color: const Color(primary),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          ' (also referred as "Terms") mean these Terms and Conditions that form the entire agreement between You and the Company regarding the use of the Service. This Terms and Conditions agreement has been created with the help of the Terms and Conditions Generator.',
                      style: GoogleFonts.poppins(
                          color: const Color(primary), fontSize: 15),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Acknowledgment',
                style: GoogleFonts.poppins(
                    color: const Color(primary),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'These are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.\nYour access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service.\nBy accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.\nYou represent that you are over the age of 18. The Company does not permit those under 18 to use the Service.\nYour access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service',
                style: GoogleFonts.poppins(
                    color: const Color(primary), fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
