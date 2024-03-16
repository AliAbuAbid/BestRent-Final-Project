// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BestOffers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BestOffers();
  }
}

class _BestOffers extends State<BestOffers> {
  Future<List<String>> _getImages(String documentId) async {
    List<String> imageUrls = [];
    Reference imagesRef =
        FirebaseStorage.instance.ref().child('images/$documentId');
    try {
      ListResult result = await imagesRef.listAll();
      for (Reference ref in result.items) {
        String downloadUrl = await ref.getDownloadURL();
        imageUrls.add(downloadUrl);
      }
    } catch (e) {
      print('Error loading images: $e');
    }
    return imageUrls;
  }

  bool love = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 2, right: 2),
      child: Stack(
        children: [
          // SizedBox(
          //   height: 5,
          // ),
          Container(
            //alignment: Alignment.center,
            padding: EdgeInsets.only(left: 18, right: 18, bottom: 18),
            child: Text(
              '111'.tr+':',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('apartments').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                //return Center(child: CircularProgressIndicator());
              }

              List<Widget> cards = [];

              snapshot.data!.docs.forEach((document) {
                String address = document['email'];
                String city = document['city'];
                bool pets = document['Pets'];
                bool renovated = document['Renovated'];
                bool shelter = document['Shelter'];
                String building = document['building'];
                String district = document['district'];
                String explain = document['explain'];
                bool storage = document['Storage'];
                bool accessForDisabled = document['AccessForDisabled'];
                bool airCondition = document['AirCondition'];
                bool bars = document['Bars'];
                bool exclusiveProperty = document['LongTerm'];
                bool furniture = document['Furniture'];
                bool heater = document['Heater'];
                bool longTerm = document['LongTerm'];
                String house = document['house'];
                String phone = document['phone'];
                String price = document['price'];
                String street = document['street'];
                String floar = document['floar'];
                String streetNumber = document['streetNumber'];
                String username = document['username'];
                bool flexible = document['flexible'];
                String postedDate = document['postedDate'];

                String documentId = document.id;
                cards.add(
                  Card(
                    color: Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          35), // Adjust the radius as needed
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FutureBuilder<List<String>>(
                              future: _getImages(documentId),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else if (!snapshot.hasData ||
                                    snapshot.data!.isEmpty) {
                                  return Text('No images found');
                                } else {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25),
                                    ),
                                    child: Image.network(
                                      snapshot.data![
                                          0], // Display only the first image URL
                                      height: 200,
                                      width: 340,
                                      fit: BoxFit.fill,
                                    ),
                                  );
                                }
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('34'.tr + ' ' + document['city']),
                                SizedBox(width: 10),
                                Text('41'.tr + ' ' + document['district']),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('30'.tr + ': ' + document['price']),
                                SizedBox(width: 10),
                                Text('42'.tr +
                                    ': ' +
                                    document['street'] +
                                    ' ' +
                                    document['streetNumber']),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(''.tr +
                                    ' ' +
                                    document['postedDate']),
                                love
                                    ? IconButton(
                                        onPressed: () {
                                          setState(() {
                                            love = false;
                                          });
                                        },
                                        icon: Icon(Icons.favorite,
                                            color: Colors.red),
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          setState(() {
                                            love = true;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.favorite_border,
                                        ),
                                      )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });

              return ListView(
                children: cards,
              );
            },
          ),
        ],
      ),
    );
  }
}
