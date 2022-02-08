import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:routr/models/user_model.dart';
import 'package:routr/screens/settings/settings.dart';

import '../ad_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // // banner add

  // late BannerAd banner;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final adState = Provider.of<AdState>(context);
  //   adState.initialization.then((status) {
  //     setState(() {
  //       banner = BannerAd(
  //         size: AdSize.banner,
  //         adUnitId: adState.bannerAdUnitID,
  //         listener: const BannerAdListener(),
  //         request: const AdRequest(),
  //       )..load();
  //     });
  //   });
  // }

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Routr"),
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
            children: [
              Expanded(
                //hier kan SHIT
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 120,
                        child: Image.asset(
                          "assets/Earth_alternitive.png",
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(height: 20),
                    const Text(
                      'Home',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text("${loggedInUser.firstName} ${loggedInUser.secondName}",
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500)),
                    Text("${loggedInUser.email}",
                        style: const TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              // Container(
              //   height: 50,
              //   child: AdWidget(ad: banner),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
