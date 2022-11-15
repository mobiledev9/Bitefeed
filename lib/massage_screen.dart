import 'package:flutter/material.dart';

class MassageScreen extends StatefulWidget {
  const MassageScreen({super.key});

  @override
  State<MassageScreen> createState() => _MassageScreenState();
}

class Iteam {
  final int? id;
  final String? title;
  final String? subtitle;
  final String? count;
  final String? image;

  Iteam({
    this.id,
    this.title,
    this.subtitle,
    this.count,
    this.image,
  });
}

final products = [
  Iteam(
    id: 1,
    title: "User Name",
    subtitle: "Lorem ipsum dolor\n sit amet,",
    count: "1",
    image: "assets/person-1824144_960_720.webp",
  ),
  Iteam(
    id: 2,
    title: "User Name",
    subtitle: "Lorem ipsum dolor\n sit amet,",
    count: "",
    image: "assets/person-1824144_960_720.webp",
  ),
  Iteam(
    id: 3,
    title: "User Name",
    subtitle: "Lorem ipsum dolor\n sit amet,",
    count: "5",
    image: "assets/person-1824144_960_720.webp",
  ),
  Iteam(
    id: 3,
    title: "User Name",
    subtitle: "Lorem ipsum dolor\n sit amet,",
    count: "",
    image: "assets/person-1824144_960_720.webp",
  ),
  Iteam(
    id: 3,
    title: "User Name",
    subtitle: "Lorem ipsum dolor\n sit amet,",
    count: "3",
    image: "assets/person-1824144_960_720.webp",
  ),
];

class _MassageScreenState extends State<MassageScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  width:width*1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(products[index].image!),
                      ),
                      // SizedBox(
                      //   width: width * 0.03,
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products[index].title!,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Comfortaa',
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: height * 0.008,
                          ),
                          Text(

                            products[index].subtitle!,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontFamily: 'Comfortaa'),
                            overflow: TextOverflow.visible,
                          )
                        ],
                      ),
                      CircleAvatar(
                        radius: height * 0.015,
                        child: Text(products[index].count!),
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  height: 30,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
