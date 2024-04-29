import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/index.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfc_manager/nfc_manager.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Create a TextEditingController for the TokenID input field
  final TextEditingController _tokenIdController = TextEditingController();
  // Create a boolean variable to store the login state
  bool login = false;
  // Create a boolean variable to store the loading state
  bool loading = false;
  // Create a string variable to store the NFC tag data
  String _readFromNfcTag = "";

  @override
  // void initState() {
  //   // TODO: implement initState
  //   onNfc();
  //   super.initState();
  // }

  // Future onNfc() async {
  //   final tag = FlutterNfcKit();
  //   print(tag);

  //   await FlutterNfcKit.finish();
  // }

  @override
  Widget build(BuildContext context) {
    void onLogin() async {
      setState(() {
        loading = true;
      });
      await Future.delayed(const Duration(seconds: 2));
      if (_tokenIdController.text == "0004650166692") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false);
      }

      setState(() {
        loading = false;
      });
    }

    // Flutter nfc kit start session

    NfcManager.instance.startSession(onDiscovered: (NfcTag badge) async {
      print(badge);
      // var mytag = badge.data["mifareultralight"]["identifier"]
      //     .map((e) => e.toRadixString(16).padLeft(2, '0'))
      //     .join('');
      // ;

      // print(mytag);
      NfcManager.instance.stopSession();
    });

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: const Text(
              'Schichtprotokoll',
              style: TextStyle(
                  color: Color(0Xff336699), fontFamily: 'Lexend', fontSize: 25),
              textAlign: TextAlign.center,
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text('Version: V1.0.0',
                    style: TextStyle(
                        color: Color(0Xff848484),
                        fontFamily: 'Lexend',
                        fontSize: 15)),
              )
            ],
            centerTitle: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(30, 5, 119, 190),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            )),
        body: SingleChildScrollView(
          // reverse: true,
          child: Container(
              height: MediaQuery.of(context).size.height - 80,
              decoration: const BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  // Column(children: [
                  Container(
                    // padding: EdgeInsets.only(
                    //     top: MediaQuery.of(context).size.height / 2.2),
                    width: MediaQuery.of(context).size.width / 3,
                    child: const Image(
                      width: 160,
                      height: 160,
                      image: AssetImage('assets/images/Terminal.png'),
                    ),
                  ),
                  // ]),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 450,
                        height: 400,
                        child: Container(
                          decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(30, 5, 119, 190),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(0, 0),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 34, 24, 34),
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Text(
                                        "Log In",
                                        style: GoogleFonts.lexend(
                                            textStyle: const TextStyle(
                                                color: Color(0xff336699),
                                                fontSize: 32,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      const Positioned(
                                          right: 0,
                                          child: Image(
                                            width: 40,
                                            height: 40,
                                            image: AssetImage(
                                                'assets/images/nfc.png'),
                                          ))
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 60,
                                ),
                                TextField(
                                  controller: _tokenIdController,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(14),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          borderSide: const BorderSide(
                                              color: Color(0xff848484),
                                              width: .5)),
                                      labelText: 'TokenID',
                                      labelStyle: GoogleFonts.lexend(
                                          textStyle: const TextStyle(
                                              color: Color(0xff848484),
                                              fontSize: 14)),
                                      prefixIcon: const Align(
                                        widthFactor: 1.0,
                                        heightFactor: 1.0,
                                        child: Image(
                                            image: AssetImage(
                                                'assets/images/idCard.png')),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          borderSide: const BorderSide(
                                              color: Color(0xff848484),
                                              width: .5))),
                                ),
                                const SizedBox(
                                  height: 23,
                                ),
                                SizedBox(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    child: TextButton(
                                      onPressed: onLogin,
                                      style: TextButton.styleFrom(
                                        side: const BorderSide(
                                            color: Color(0xff848484),
                                            width: .5),
                                        backgroundColor:
                                            const Color(0xffffffff),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ),
                                      child: loading
                                          ? const CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.white),
                                            )
                                          : Text(
                                              "Cancel",
                                              style: GoogleFonts.lexend(
                                                  textStyle: const TextStyle(
                                                      color: Color(0xff848484),
                                                      fontSize: 14)),
                                            ),
                                    )),
                                const SizedBox(
                                  height: 23,
                                ),
                                SizedBox(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    child: TextButton(
                                      onPressed: loading ? null : onLogin,
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff336699),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                      ),
                                      child: loading
                                          ? const CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Colors.white),
                                            )
                                          : Text(
                                              "Log In",
                                              style: GoogleFonts.lexend(
                                                  textStyle: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14)),
                                            ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
