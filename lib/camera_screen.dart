import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'bottambar.dart';
import 'google_map.dart';
import 'my_location.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? _image;
  File? _image2;
  final picker = ImagePicker();

  Future getCameraImage() async {
    var pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
    // setState(() {
    //   _image = File(pickedFile!.path);
    // });

    Navigator.pop(context);
  }

  Future getCameraFromGallery() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
    // else if (pickedFile != null) {
    //   setState(() {
    //      _image2 = File(pickedFile.path);
    //   });
    // }
    setState(() {
      _image2 = File(pickedFile!.path);
    });

    Navigator.pop(context);
  }

  Future<void> _showChoiceDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Choose option",
            style: TextStyle(color: Colors.blue),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                const Divider(
                  height: 1,
                  color: Colors.blue,
                ),
                ListTile(
                  onTap: () {
                    getCameraFromGallery();
                  },
                  title: const Text("Gallery"),
                  leading: const Icon(
                    Icons.account_box,
                    color: Colors.blue,
                  ),
                ),
                const Divider(
                  height: 1,
                  color: Colors.blue,
                ),
                ListTile(
                  onTap: () {
                    getCameraImage();
                  },
                  title: const Text("Camera"),
                  leading: const Icon(
                    Icons.camera,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 0,
                        color: const Color.fromARGB(255, 228, 226, 226),
                        child: _image == null
                            ? Container(
                                height: height * 0.23,
                                width: double.infinity,
                                // color: Colors.red,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _showChoiceDialog();
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.add_a_photo_outlined,
                                    size: 40,
                                    color: Color.fromARGB(255, 124, 122, 122),
                                  ),
                                ),
                              )
                            : Container(
                                height: height * 0.23,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: FileImage(_image!),
                                        fit: BoxFit.cover)),
                              )),
                    SizedBox(height: height * 0.006),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 0,
                          color: const Color.fromARGB(255, 228, 226, 226),
                          child: _image2 == null
                              ? Container(
                                  height: height * 0.12,
                                  width: width * 0.23,
                                  // color: Colors.red,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _showChoiceDialog();
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.add_a_photo_outlined,
                                        size: 30,
                                        color:
                                            Color.fromARGB(255, 124, 122, 122),
                                      )),
                                )
                              : Container(
                                  height: height * 0.12,
                                  width: width * 0.23,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: FileImage(_image!),
                                          fit: BoxFit.cover)),
                                  // child: Image.file(
                                  //   _image2!,
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 0,
                          color: const Color.fromARGB(255, 228, 226, 226),
                          child: _image == null
                              ? Container(
                                  height: height * 0.12,
                                  width: width * 0.23,
                                  // color: Colors.red,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _showChoiceDialog();
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.add_a_photo_outlined,
                                        size: 30,
                                        color:
                                            Color.fromARGB(255, 124, 122, 122),
                                      )),
                                )
                              : Container(
                                  height: height * 0.12,
                                  width: width * 0.23,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: FileImage(_image!),
                                          fit: BoxFit.cover)),
                                  // child: Image.file(
                                  //   _image!,
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 0,
                          color: const Color.fromARGB(255, 228, 226, 226),
                          child: _image == null
                              ? Container(
                                  height: height * 0.12,
                                  width: width * 0.23,
                                  // color: Colors.red,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _showChoiceDialog();
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.add_a_photo_outlined,
                                        size: 30,
                                        color:
                                            Color.fromARGB(255, 124, 122, 122),
                                      )),
                                )
                              : Container(
                                  height: height * 0.12,
                                  width: width * 0.23,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: FileImage(_image!),
                                          fit: BoxFit.cover)),
                                  // child: Image.file(
                                  //   _image!,
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.020,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Restarurant Name :",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Comfortaa"),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Lorem ipsum dolor sit amet',
                              hintStyle: TextStyle(
                                fontFamily: "Comfortaa",
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        const Text(
                          "Description :",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Comfortaa"),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Lorem ipsum dolor sit amet',
                              hintStyle: TextStyle(
                                fontFamily: "Comfortaa",
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        const Text(
                          "Price :",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Comfortaa"),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        const TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '\$ 500.69 only',
                              hintStyle: TextStyle(
                                fontFamily: "Comfortaa",
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.030,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Location :",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Comfortaa"),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        Container(
                          height: height * 0.06,
                          width: width * 0.4,
                          // color: Colors.red,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey),
                          ),

                          child: Row(
                            children: [
                              SizedBox(
                                width: width * 0.02,
                              ),
                              CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyLocation()));
                                    },
                                    icon: const Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      // size: 35,
                                    ),
                                  )),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              const Text(
                                "Your Place",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                      colors: <Color>[
                                        Color.fromARGB(255, 33, 155, 226),
                                        Color.fromARGB(255, 33, 155, 226),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.all(16.0),
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  'Post Now',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Comfortaa'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
            CupertinoIcons.arrow_left_circle,
            size: 35,
          )),
      title: const Text(
        "Camera",
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
