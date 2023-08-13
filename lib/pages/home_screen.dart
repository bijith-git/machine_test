import 'package:flutter/material.dart';
import 'package:lilac_machine_test/pages/profile/profile.dart';
import 'package:provider/provider.dart';

import '../auth/auth.dart';
import 'pages.dart';
import 'settings/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AuthProvider provider;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = Provider.of<AuthProvider>(context, listen: false);
  }

  static const drawerStyle =
      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, letterSpacing: .5);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(provider.userModel.profilePic),
              ),
              accountEmail: Text(provider.userModel.email),
              accountName: Text(provider.userModel.name, style: drawerStyle),
              decoration: const BoxDecoration(
                color: Colors.black87,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                'Profile',
                style: drawerStyle,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings', style: drawerStyle),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => SettingsPage()),
                );
              },
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout', style: drawerStyle),
                onTap: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute<void>(
                  //     builder: (BuildContext context) => const MyHomePage(
                  //       title: 'Apartments',
                  //     ),
                  //   ),
                  // );
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Video Player"),
        actions: [
          IconButton(
            onPressed: () {
              provider.userSignOut().then(
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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.purple,
            backgroundImage: NetworkImage(provider.userModel.profilePic),
            radius: 50,
          ),
          const SizedBox(height: 20),
          Text(provider.userModel.name),
          Text(provider.userModel.dob),
          Text(provider.userModel.email),
        ],
      )),
    );
  }
}
