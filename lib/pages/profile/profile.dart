import 'package:flutter/material.dart';
import 'package:lilac_machine_test/model/model.dart';

import '../../utils/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = false;
  late Map<String, dynamic> user;
  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    getUserData();
    super.initState();
  }

  getUserData() async {
    try {
      user = await getSavedObject('user_model');
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Profile"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            child: Image.network(user['profilePic']),
          ),
          Text(
            "Name : ${user['name']}",
            textAlign: TextAlign.center,
          ),
          Text("DOB : ${user['name']}"),
          Text("EMAIL  :${user['name']}"),
        ],
      ),
    );
  }
}
