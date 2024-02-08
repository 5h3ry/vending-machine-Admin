/*
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kotlin/UI/auth/login_screen.dart';
import 'package:kotlin/UI/inventory_management/item_list_screen.dart';
import 'package:kotlin/utils/utils.dart';

class selectMachineForItems extends StatefulWidget {
  const selectMachineForItems({super.key});

  @override
  State<selectMachineForItems> createState() => _selectMachineForItemsState();
}

class _selectMachineForItemsState extends State<selectMachineForItems> {

  final auth=FirebaseAuth.instance;

  final editController=TextEditingController();
  final locationController=TextEditingController();
  final fireStore =FirebaseFirestore.instance.collection('Machines').snapshots();
  CollectionReference ref =FirebaseFirestore.instance.collection('Machines');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('INVENTORY MANAGEMENT'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){

            auth.signOut().then((value) {Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>const LoginScreen()));}
            ).onError((error, stackTrace){Utils().toastMessage(error.toString());});},

            icon: const Icon(Icons.logout_outlined), ),
          const SizedBox(width: 10,),


        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10,),

          StreamBuilder<QuerySnapshot>(
              stream: fireStore,
              builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                if(snapshot.connectionState==ConnectionState.waiting)
                  return CircularProgressIndicator();
                if(snapshot.hasError)
                  return Text('Error');
                return  Expanded(


                child:ListView.builder(
                        itemCount:snapshot.data!.docs.length,
                        itemBuilder: (context,index){

                          String machineName =snapshot.data!.docs[index]['machineName'].toString();
                          String location=snapshot.data!.docs[index]['location'].toString();
                          String id =snapshot.data!.docs[index]['id'].toString();
                          return ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> itemListScreen()));
                              },
                            title: Text(snapshot.data!.docs[index]['machineName'].toString()),//Text(machineName),
                            subtitle: Text('location:${snapshot.data!.docs[index]['location'].toString()}'),
                          );
                        })
                );
              }),
        ],
      ),
    );
  }

}

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kotlin/UI/auth/login_screen.dart';
import 'package:kotlin/UI/inventory_management/item_list_screen.dart';
import 'package:kotlin/utils/utils.dart';

class selectMachineForItems extends StatefulWidget {
  const selectMachineForItems({super.key});

  @override
  State<selectMachineForItems> createState() => _selectMachineForItemsState();
}

class _selectMachineForItemsState extends State<selectMachineForItems> {

  final auth=FirebaseAuth.instance;

  final editController=TextEditingController();
  final locationController=TextEditingController();
  final fireStore =FirebaseFirestore.instance.collection('Machines').snapshots();
  CollectionReference ref =FirebaseFirestore.instance.collection('Machines');

  String getMachineId(DocumentSnapshot doc) {
    return doc['id'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text('Select Machine'),
        //centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
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
      body: Column(
        children: [
          const SizedBox(height: 10,),
          StreamBuilder<QuerySnapshot>(
            stream: fireStore,
            builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.connectionState == ConnectionState.waiting)
                return CircularProgressIndicator();
              if(snapshot.hasError)
                return Text('Error');
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text('No data found'));
              }
              return  Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,index) {
                    return ListTile(
                      onTap: () {
                        String machineId = getMachineId(snapshot.data!.docs[index]);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => itemListScreen(machineId: machineId)),
                        );
                      },
                      title: Text(snapshot.data!.docs[index]['machineName'].toString()),
                      subtitle: Text('location: ${snapshot.data!.docs[index]['location'].toString()}'),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
