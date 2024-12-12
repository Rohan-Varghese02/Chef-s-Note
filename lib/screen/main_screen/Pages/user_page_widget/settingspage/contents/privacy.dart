import 'package:cook_book/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(primary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CookBook values your privacy. This Privacy Policy outlines how we collect, use, and protect your information when you use our app. By using the App, you agree to the terms of this Privacy Policy.',
              style: GoogleFonts.poppins(color: const Color(primary)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '1. Information We Collect',
              style: GoogleFonts.poppins(
                  color: const Color(primary),
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
            Text(
              'Information that identifies you as an individual, such as:\nName \nEmail address \nProfile picture (if applicable)',
              style: GoogleFonts.poppins(color: const Color(primary)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '2. Sharing Your Information',
              style: GoogleFonts.poppins(
                  color: const Color(primary),
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
            Text(
              'We do not sell or rent your personal information to third parties. However, we may share your information in the following situations: \nWith service providers: Third parties who help us deliver our services (e.g., hosting, analytics, payment processing). \nLegal compliance: When required by law or to protect our legal rights. \nBusiness transfers: In case of a merger, sale, or acquisition.',
              style: GoogleFonts.poppins(color: const Color(primary)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '3. Data Security',
              style: GoogleFonts.poppins(
                  color: const Color(primary),
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
            Text(
              'We take reasonable measures to protect your information from unauthorized access, alteration, or destruction. However, no method of transmission or storage is 100% secure, and we cannot guarantee absolute security',
              style: GoogleFonts.poppins(color: const Color(primary)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '4.Changes to This Policy',
              style: GoogleFonts.poppins(
                  color: const Color(primary),
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
            Text(
              'We may update this Privacy Policy from time to time. Any changes will be posted within the App or on our website with the updated effective date. Your continued use of the App constitutes acceptance of the updated policy.',
              style: GoogleFonts.poppins(color: const Color(primary)),
            )
          ],
        ),
      ),
    );
  }
}
