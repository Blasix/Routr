import 'package:flutter/material.dart';
import 'package:routr/screens/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()));
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  height: 100,
                  child: Image.asset(
                    "assets/LogoA2.png",
                    fit: BoxFit.contain,
                  )),
              const Text(
                'Home',
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text("Name",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500)),
              const Text("Email",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
