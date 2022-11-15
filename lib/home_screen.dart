import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'google_map.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class Iteam {
  final int? id;
  final String? title;
  final String? subtitle;
  final String? subimage;
  final String? name;
  final String? image2;
  final String? image;
  final String? image3;
  final String? map;

  Iteam(
      {this.id,
      this.title,
      this.subtitle,
      this.subimage,
      this.name,
      this.image2,
      this.image,
      this.image3,
      this.map});
}

final products = [
  Iteam(
    id: 1,
    image2: "assets/Facebook_Like_React.png",
    title: "User Name",
    subtitle: "Restaurant Name",
    subimage: "assets/image1-2-678x381.jpeg",
    name: "Add to Bites",
    image: "assets/person-1824144_960_720.png",
    image3: "assets/google-maps-highlight.jpeg",
    map: "Akshya Nagar,\n1st Block 1st Cross,\nBangalore-560016",
  ),
  Iteam(
    id: 1,
    image2: "assets/Facebook_Like_React.png",
    title: "User Name",
    subtitle: "Restaurant Name",
    subimage: "assets/image1-2-678x381.jpeg",
    name: "Add to Bites",
    image: "assets/person-1824144_960_720.png",
    image3: "assets/google-maps-highlight.jpeg",
    map: "Akshya Nagar,\n1st Block 1st Cross,\nBangalore-560016",
  ),
  Iteam(
    id: 1,
    image2: "assets/Facebook_Like_React.png",
    title: "User Name",
    subtitle: "Restaurant Name",
    subimage: "assets/image1-2-678x381.jpeg",
    name: "Add to Bites",
    image: "assets/person-1824144_960_720.png",
    image3: "assets/google-maps-highlight.jpeg",
    map: "Akshya Nagar,\n1st Block 1st Cross,\nBangalore-560016",
  ),
];

class _MyHomeScreenState extends State<MyHomeScreen> {
  String currentAddress = 'My Address';
  Position? currentposition;

  _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable Your Location Service');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      setState(() {
        currentposition = position;
        currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 33, 155, 226),
            Color.fromARGB(255, 33, 155, 226),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppbar(),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
          child: Container(
            // color: Colors.white,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
                color: Colors.white),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          hintText: 'Search here.....',
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 35,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide())),
                    ),
                    SizedBox(
                      // height: height * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: products.length,
                          itemBuilder: (context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: const Color.fromARGB(255, 235, 241, 247),
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.040,
                                              top: height * 0.015),
                                          child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  products[index].image!)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: width * 0.040,
                                              top: height * 0.015),
                                          child: Text(
                                            products[index].title!,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontFamily: 'Comfortaa',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        // child: Container(
                                        //   height: 90,
                                        //   width: 150,
                                        //   decoration: BoxDecoration(
                                        //       borderRadius: BorderRadius.circular(15),
                                        //       image: DecorationImage(
                                        //           image: AssetImage(
                                        //               products[index].subimage!))),
                                        child: Image(
                                          image: AssetImage(
                                              products[index].subimage!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            products[index].subtitle!,
                                            style: const TextStyle(
                                                fontSize: 23,
                                                fontFamily: "Comfortaa",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20, top: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 45,
                                            width: 130,
                                            decoration: BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                    blurRadius: 3,
                                                  ),
                                                ],
                                                border: Border.all(
                                                    color: Colors.grey,
                                                    width: 1,
                                                    style: BorderStyle.solid),
                                                borderRadius:
                                                    BorderRadius.circular(28),
                                                color: Colors.blue),
                                            child: Center(
                                                child: Text(
                                              products[index].name!,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 3,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(17),
                                            ),
                                            child: CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    products[index].image2!)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Card(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Container(
                                          height: 130,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    products[index].image3!),
                                                fit: BoxFit.cover),
                                          ),
                                          child: Stack(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const CurrentLocationScreen()));
                                                },
                                                child: Container(
                                                  height: 130,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    gradient:
                                                        const LinearGradient(
                                                      colors: [
                                                        Colors.white,
                                                        Colors.transparent
                                                      ],
                                                      stops: [0.6, 50.0],
                                                      // begin: Alignment.center,
                                                      // end: Alignment.topRight,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    // Text(currentAddress),
                                                    // currentposition != null
                                                    //     ? Text('Latitude = ' +
                                                    //         currentposition!
                                                    //             .latitude
                                                    //             .toString())
                                                    //     : Container(),
                                                    // currentposition != null
                                                    //     ? Text('Longitude = ' +
                                                    //         currentposition!
                                                    //             .longitude
                                                    //             .toString())
                                                    //     : Container(),
                                                    // TextButton(
                                                    //     onPressed: () {
                                                    //       _determinePosition();
                                                    //     },
                                                    //     child: const Text(
                                                    //         'Locate me'))
                                                    Text(
                                                      products[index].map!,
                                                      style: const TextStyle(
                                                          fontFamily:
                                                              'Comfortaa',
                                                          color: Colors.grey,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Icon(
          Icons.menu,
          size: 35,
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.add_circle_outline,
            size: 35,
          ),
        ),
      ],
      title: const Text(
        "Home",
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
