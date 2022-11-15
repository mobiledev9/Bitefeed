import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyLocation extends StatefulWidget {
  const MyLocation({Key? key}) : super(key: key);

  @override
  _MyLocationState createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  String address = '';
  final Completer<GoogleMapController> _controller = Completer();

  Future<Position> _getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print(error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  final List<Marker> _markers = <Marker>[];

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.170092179791453, 72.83082906123961),
    zoom: 14,
  );

  List<Marker> list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(21.170092179791453, 72.83082906123961),
        infoWindow: InfoWindow(title: 'some Info ')),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.addAll(list);
    //loadData();
  }

  loadData() {
    _getUserCurrentLocation().then((value) async {
      _markers.add(Marker(
          markerId: const MarkerId('SomeId'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(title: address)));

      final GoogleMapController controller = await _controller.future;
      CameraPosition _kGooglePlex = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      );
      controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 33, 155, 226),
        title: Text('Location'),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GoogleMap(
              initialCameraPosition: _kGooglePlex,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              markers: Set<Marker>.of(_markers),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Container(
              height: MediaQuery.of(context).size.height * .2,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _getUserCurrentLocation().then((value) async {
                        _markers.add(Marker(
                            markerId: const MarkerId('SomeId'),
                            position: LatLng(value.latitude, value.longitude),
                            infoWindow: InfoWindow(title: address)));
                        final GoogleMapController controller =
                            await _controller.future;

                        CameraPosition _kGooglePlex = CameraPosition(
                          target: LatLng(value.latitude, value.longitude),
                          zoom: 14,
                        );
                        controller.animateCamera(
                            CameraUpdate.newCameraPosition(_kGooglePlex));

                        List<Placemark> placemarks =
                            await placemarkFromCoordinates(
                                value.latitude, value.longitude);

                        final add = placemarks.first;
                        address = add.locality.toString() +
                            " " +
                            add.administrativeArea.toString() +
                            " " +
                            add.subAdministrativeArea.toString() +
                            " " +
                            add.country.toString();

                        setState(() {});
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 33, 155, 226),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                            child: Text(
                          'Current Location',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(address),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
