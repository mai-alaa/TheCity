import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlaceTap extends StatelessWidget {
  const PlaceTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 225, 225),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image(
                  image: NetworkImage(
                      'https://www.qna.org.qa/ar-QA/News-Area/News/2022-07/29/qnacdn.azureedge.net/-/media/Project/QNA/QNAImages/2022-05/19/qna_alaqssa_iftaa_22219052022.jpg?h=630&la=ar-QA&w=840&modified=00010101000000'),
                ),
                Positioned(
                  left: 20, // Adjust the left position as needed
                  bottom: 20, // Adjust the bottom position as needed
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Al-Aqsa Mosque',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Padding(
                    padding: EdgeInsets.all(20),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * .3,
                  child: Column(
                    children: [
                      Text(
                        'Al-Aqsa Mosque',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Al-Aqsa Mosque'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Al-Aqsa Mosque')
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.15,
                  child: Column(
                    children: [
                      Text(
                        'Al-Aqsa Mosque',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Al-Aqsa Mosque'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Al-Aqsa Mosque')
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.15,
                  child: Column(
                    children: [
                      Text(
                        'Al-Aqsa Mosque',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Al-Aqsa Mosque'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Al-Aqsa Mosque')
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
