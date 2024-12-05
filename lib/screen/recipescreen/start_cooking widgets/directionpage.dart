import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/model/data_model/meal.dart';
import 'package:cook_book/screen/recipescreen/recipeStatic.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class Directionpage extends StatefulWidget {
  Meal mealinfo;

  Directionpage({super.key, required this.mealinfo});

  @override
  State<Directionpage> createState() => _DirectionpageState();
}

class _DirectionpageState extends State<Directionpage> {
  int _currentStep = 0;
  int _remainingTime = 0;
  Timer? _timer;
  bool _isTimerActive = false; // Flag to track the timer state

  @override
  void initState() {
    super.initState();
    _initializeTimerForStep();
  }

  void _initializeTimerForStep() {
    // Set timer for the current step or default to 0 if no timer is needed
    _remainingTime = (widget.mealinfo.timer != 0 &&
            _currentStep < widget.mealinfo.timer!.length)
        ? widget.mealinfo.timer![_currentStep]
        : 0;
  }

  void _startTimer() {
    if (_timer != null && _timer!.isActive) return;
    if (_remainingTime > 0) {
      setState(() {
        _isTimerActive = true; // Mark timer as active
      });
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (_remainingTime > 0) {
          setState(() {
            _remainingTime--;
          });
        } else {
          timer.cancel();
          setState(() {
            _isTimerActive = false; // Timer finished, mark as inactive
          });
        }
      });
    }
  }

  void _resetTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    setState(() {
      _remainingTime = (widget.mealinfo.timer != 0 &&
              _currentStep < widget.mealinfo.timer!.length)
          ? widget.mealinfo.timer![_currentStep]
          : 0;
      _isTimerActive = false; // Timer is reset, mark as inactive
    });
  }

  void _nextStep() {
    if (_currentStep < widget.mealinfo.steps.length - 1) {
      setState(() {
        _currentStep++;
        _initializeTimerForStep();
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
        _initializeTimerForStep();
      });
    }
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.mealinfo.title,
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: const Color(primary),
        centerTitle: true,
        leading: const SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_remainingTime > 0)
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color of the container
                      borderRadius: BorderRadius.circular(
                          10), // Optional: Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 77, 172, 167)
                              .withOpacity(0.5), // Shadow color and opacity
                          spreadRadius: 2, // How much the shadow spreads
                          blurRadius: 5, // How soft the shadow is
                          offset: const Offset(
                              2, 3), // Horizontal and vertical shadow offsets
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Timer: ${_formatTime(_remainingTime)}',
                          style: GoogleFonts.poppins(
                              fontSize: 25, color: const Color(primary)),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: _startTimer,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(primary),
                              ),
                              child: Text(
                                'Start Timer',
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: _resetTimer,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(primary),
                              ),
                              child: Text(
                                'Reset Timer',
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                widget.mealinfo.steps[_currentStep],
                style: GoogleFonts.poppins(
                    fontSize: 23, color: const Color(primary)),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentStep != 0)
                  ElevatedButton(
                    onPressed: _currentStep > 0 ? _previousStep : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(primary),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 55, vertical: 13),
                    ),
                    child: Text(
                      'Previous',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                if (_currentStep == 0)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(primary),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70, vertical: 13),
                    ),
                    child: Text(
                      'Exit',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                if (_currentStep == widget.mealinfo.steps.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(primary),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70, vertical: 13),
                    ),
                    child: Text(
                      'Finish',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                if (_currentStep != widget.mealinfo.steps.length - 1)
                  ElevatedButton(
                    onPressed: _isTimerActive
                        ? null
                        : _nextStep, // Disable Next until timer is done
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _isTimerActive ? Colors.grey : const Color(primary),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70,
                          vertical: 13), // Disable if timer is active
                    ),
                    child: Text(
                      'Next',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }
}
