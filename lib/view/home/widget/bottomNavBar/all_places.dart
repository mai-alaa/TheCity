import 'package:city_app/utils/constants.dart';
import 'package:city_app/view/home/widget/home_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllPlacesScreen extends StatelessWidget {
  const AllPlacesScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 220, 220, 220)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: const Color.fromARGB(255, 209, 211, 209),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 197, 197, 197),
                        width: 0,
                        style: BorderStyle.none,
                      )),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 40,
              itemBuilder: (context, int index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => PlaceTap());
                  },
                  child: Card(
                    elevation: 5,
                    shadowColor: const Color.fromARGB(255, 191, 187, 187),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            'https://images.pexels.com/photos/208745/pexels-photo-208745.jpeg?cs=srgb&dl=pexels-pixabay-208745.jpg&fm=jpg',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Wonderful Place",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: KmainColor,
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
