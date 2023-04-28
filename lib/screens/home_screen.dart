import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cookbook/screens/welcome_screen.dart';
import 'package:cookbook/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "The Cook Book",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ap.userSignOut().then(
                    (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                    ),
                  );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: StreamBuilder<Object>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            print('connection: ${snapshot.data}');
            return (snapshot.data == null ||
                    snapshot.data == ConnectivityResult.none)
                ? const Center(
                    child: Text(
                      "You're Offline",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor: kPrimaryColor,
                          radius: 50,
                          child: Icon(
                            Icons.account_circle,
                            size: 50,
                            color: kAccentColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(ap.userModel.name),
                        Text(ap.userModel.phoneNumber),
                        Text(ap.userModel.email),
                        Text(ap.userModel.bio),
                      ],
                    ),
                  );
          }),
    );
  }
}
