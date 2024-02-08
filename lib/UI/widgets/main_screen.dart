import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kotlin/UI/auth/login_screen.dart';
import 'package:kotlin/UI/inventory_management/select_machine_for_item.dart';
import 'package:kotlin/UI/machine_management/firestore_list_screen.dart';
import 'package:kotlin/utils/utils.dart';

class ManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Management'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            },
            icon: const Icon(Icons.logout_outlined),
          ),
          const SizedBox(width: 10,),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => fireStoreScreen()),
                );
              },
              child: Text(
                'Machine Management',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => selectMachineForItems()),
                );
              },
              child: Text(
                'Inventory Management',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
