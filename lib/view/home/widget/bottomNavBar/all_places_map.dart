import 'package:cached_network_image/cached_network_image.dart';
import 'package:city_app/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';
import 'package:carousel_slider/carousel_slider.dart';

// Import carousel_slider package

class MapScreen8 extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen8> {
  MapController mapController = MapController();
  Location location = Location();
  LatLng userLocation = LatLng(0.0, 0.0);
  List<Marker> markers = [];
  List<LatLng> polygonCoordinates = [];
  double zoomLevel = 15.0;
  double rotationAngle = 0.0;

  @override
  void initState() {
    super.initState();
    _setupLocationListener();
  }

  void _setupLocationListener() {
    location.onLocationChanged.listen((LocationData locationData) {
      setState(() {
        userLocation = LatLng(locationData.latitude!, locationData.longitude!);
        markers = [
          Marker(
            width: 80.0,
            height: 80.0,
            point: userLocation,
            child: Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.circle_outlined,
                    size: 40,
                    color: Colors.blue.withOpacity(0.5),
                  ),
                  Icon(
                    Icons.circle,
                    size: 20,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.circle,
                    size: 10,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ];

        polygonCoordinates = [
          LatLng(userLocation.latitude + 0.001, userLocation.longitude + 0.001),
          LatLng(userLocation.latitude - 0.001, userLocation.longitude + 0.001),
          LatLng(userLocation.latitude - 0.001, userLocation.longitude - 0.001),
          LatLng(userLocation.latitude + 0.001, userLocation.longitude - 0.001),
        ];
      });

      mapController.moveAndRotate(userLocation, zoomLevel, rotationAngle);
    });
  }

  void _toggleRotation() {
    setState(() {
      rotationAngle = rotationAngle == 0.0 ? 45.0 : 0.0;
      mapController.moveAndRotate(userLocation, zoomLevel, rotationAngle);
    });
  }

  void _onMarkerTapped(LatLng tappedPoint, MapPosition tapPosition) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Marker Tapped'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'You tapped on a point at ${tappedPoint.latitude}, ${tappedPoint.longitude}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: _toggleRotation, child: Icon(Icons.rotate_right_outlined)),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: FlutterMap(
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: markers,
                  rotate: true,
                ),
                PolygonLayer(
                  polygons: [
                    Polygon(
                      points: polygonCoordinates,
                      borderStrokeWidth: 2,
                      borderColor: Colors.blue,
                    ),
                  ],
                ),
              ],
              options: MapOptions(
                onTap: (p, pl) {
                  _onMarkerTapped(pl as LatLng, MapPosition());
                },
                initialCenter: userLocation,
                initialZoom: zoomLevel,
                initialRotation: rotationAngle,
              ),
              mapController: mapController,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: CarouselSlider(
                //implement number of places
                items: [1, 2, 3, 4, 5].map((i) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                width: 150,
                                height: 150,
                                child: Padding(
                                  padding: EdgeInsets.all(3),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image(
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIhD3APKrppJ5DzTdlKnMeGtmwJo8eU2qJfg&usqp=CAU'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'description',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                        //name of places created on model
                        //
                      ],
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 160,
                  aspectRatio: 70 / 7,
                  viewportFraction: .89,
                  enableInfiniteScroll: false,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<Marker> getMarker() {
  return List<Marker>.from(FackeData().fackedata.map((e) => Marker(
      point: LatLng(e.latitude!, e.longitude!),
      child: Icon(Icons.location_on_outlined))));
}
