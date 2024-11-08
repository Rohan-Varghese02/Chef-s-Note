import 'package:cook_book/const/colors.dart';
import 'package:cook_book/main.dart';
import 'package:cook_book/screen/mainscreen/mainview.dart';
import 'package:cook_book/screen/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    checkUserLogin();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //     colors: [Colors.blue, Colors.pink],
            //     begin: Alignment.topRight,
            //     end: Alignment.bottomLeft)
            color: Color.fromARGB(255, 255, 255, 255)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.pan_tool,
                size: 100,
                color: Color(primary),
              ),
              Text(
                'CooKBooK',
                style: GoogleFonts.poppins(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: const Color(primary)),
              )
            ],
          ),
        ),
      ),
    );
  }
  // Delay of Splashscreen
    Future<void> goToProfilePage() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => const Homescreen()));
  }

  Future<void> checkUserLogin() async {
    final _sharedprefs = await SharedPreferences.getInstance();
    final _userloggin = _sharedprefs.getBool(save_State);
    if (_userloggin == null || _userloggin == false) {
      goToProfilePage();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => const Mainview()));
    }
  }
}
