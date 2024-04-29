import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/components/input.dart';
import 'package:flutter_application_1/components/swith.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final monthNames = [
    'Januar',
    'Februar',
    'März',
    'April',
    'Mai',
    'Juni',
    'Juli',
    'August',
    'September',
    'Oktober',
    'November',
    'Dezember'
  ];

  final hour = DateTime.now().hour < 10
      ? '0${DateTime.now().hour}'
      : DateTime.now().hour.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar is the top bar of the app, led=ft side is the burger menu icon and right side is the logout red icon
        appBar: AppBar(
            // title is the text "Add Entry / Neuer Eintrag"
            title: const Text(
              'Add Entry / Neuer Eintrag',
              style: TextStyle(
                  color: Color(0xff336699),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),

            // left side is the burger menu icon
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Color(0xff336699),
                    size: 30,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff848484),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 8.0,
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      color: Color(0xff336699),
                      size: 30,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'User',
                      style: TextStyle(
                        color: Color(0xff336699),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // sized box with width 20.0
              const SizedBox(width: 40.0),
              // right side is the logout red icon
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.red,
                    size: 30.0,
                  ),
                ),
              ),
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
        // body: const Text('Hello World'));
        body: Container(
          color: Colors.white,
          child: Row(
            children: [
              Container(
                color: Colors.red,
                width: 120,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // today date: number month: text year: number and spacer: | time: number 24h format
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        DateTime.now().day.toString() +
                            ' ' +
                            monthNames[DateTime.now().month - 1] +
                            ' ' +
                            DateTime.now().year.toString() +
                            ' | ' +
                            hour +
                            ':' +
                            DateTime.now().minute.toString() +
                            ' | ' +
                            "Shift 2",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Color(0xff336699),
                          fontSize: 24,
                        ),
                      ),
                    ),
                    // spacer
                    const SizedBox(height: 20.0),
                    // input field: label: "Machine" and input field
                    Input(label: "", controller: TextEditingController()),
                    // spacer
                    const SizedBox(height: 20.0),
                    SwitchWithText(
                      // value: true,
                      onChanged: (value) {},
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ));
  }
  // }
}
