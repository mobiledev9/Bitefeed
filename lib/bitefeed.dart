import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BiteFeed extends StatefulWidget {
  const BiteFeed({super.key});

  @override
  State<BiteFeed> createState() => _BiteFeedState();
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
    title: "Restaurant Name :",
    subtitle: "Restaurant Name",
    subimage: "assets/image1-2-678x381.jpeg",
    name: "\$3.59",
    image: "assets/kadhai-paneer_result_grande.webp",
    image3: "assets/google-maps-highlight.jpeg",
    map: "Akshya Nagar,\n1st Block 1st Cross,\nBangalore-560016",
  ),
  Iteam(
    id: 1,
    image2: "assets/Facebook_Like_React.png",
    title: "Restaurant Name :",
    subtitle: "Restaurant Name",
    subimage: "assets/image1-2-678x381.jpeg",
    name: "\$2.99",
    image:
        "assets/homemade-hamburger-burger-with-fresh-vegetables-cheese-lettuce-mayonnaise-served-french-fries-pieces-brown-paper-black-stone-table-concept-fast-food-junk-food_1150-41842.webp",
    image3: "assets/google-maps-highlight.jpeg",
    map: "Akshya Nagar,\n1st Block 1st Cross,\nBangalore-560016",
  ),
  Iteam(
    id: 1,
    image2: "assets/Facebook_Like_React.png",
    title: "Restaurant Name :",
    subtitle: "Restaurant Name",
    subimage: "assets/image1-2-678x381.jpeg",
    name: "\$3.00",
    image:
        "assets/homemade-hamburger-burger-with-fresh-vegetables-cheese-lettuce-mayonnaise-served-french-fries-pieces-brown-paper-black-stone-table-concept-fast-food-junk-food_1150-41842.webp",
    image3: "assets/google-maps-highlight.jpeg",
    map: "Akshya Nagar,\n1st Block 1st Cross,\nBangalore-560016",
  ),
  Iteam(
    id: 3,
    image2: "assets/Facebook_Like_React.png",
    title: "Restaurant Name :",
    subtitle: "Restaurant Name",
    subimage: "assets/image1-2-678x381.jpeg",
    name: "\$3.00",
    image: "assets/chocolate-syrup-2.webp",
    image3: "assets/google-maps-highlight.jpeg",
    map: "Akshya Nagar,\n1st Block 1st Cross,\nBangalore-560016",
  ),
  Iteam(
    id: 3,
    image2: "assets/Facebook_Like_React.png",
    title: "Restaurant Name :",
    subtitle: "Restaurant Name :",
    subimage: "assets/image1-2-678x381.jpeg",
    name: "\$3.00",
    image: "assets/chocolate-syrup-2.webp",
    image3: "assets/google-maps-highlight.jpeg",
    map: "Akshya Nagar,\n1st Block 1st Cross,\nBangalore-560016",
  ),
  Iteam(
    id: 3,
    image2: "assets/Facebook_Like_React.png",
    title: "Restaurant Name :",
    subtitle: "Restaurant Name",
    subimage: "assets/image1-2-678x381.jpeg",
    name: "\$3.00",
    image: "assets/chocolate-syrup-2.webp",
    image3: "assets/google-maps-highlight.jpeg",
    map: "Akshya Nagar,\n1st Block 1st Cross,\nBangalore-560016",
  ),
];
final List<String> imagedata = [
  "https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dW5zcGxhc2h8ZW58MHx8MHx8&w=1000&q=80"
      "https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dW5zcGxhc2h8ZW58MHx8MHx8&w=1000&q=80"
      "https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dW5zcGxhc2h8ZW58MHx8MHx8&w=1000&q=80"
];

class _BiteFeedState extends State<BiteFeed> {
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
            // child: Padding(
            //   padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
            //   child: Column(
            //     children: [
            //       CarouselSlider.builder(
            //         itemCount: imagedata.length,
            //         options: CarouselOptions(
            //           aspectRatio: 10 / 7,
            //           // height: 250,
            //           // aspectRatio: 16 / 9,
            //           // viewportFraction: 0.8,
            //           // initialPage: 0,
            //           // enableInfiniteScroll: true,
            //           // reverse: false,
            //           // autoPlay: true,
            //           autoPlayInterval: Duration(seconds: 3),
            //           autoPlayAnimationDuration: Duration(milliseconds: 800),
            //           autoPlayCurve: Curves.fastOutSlowIn,
            //           // enlargeCenterPage: true,
            //           // onPageChanged: callbackFunction,
            //           scrollDirection: Axis.horizontal,
            //         ),
            //         itemBuilder:
            //             (BuildContext context, int index, int realIndex) {
            //           return Column(
            //             children: [
            //               Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: Card(
            //                   elevation: 0,
            //                   child: Container(
            //                     height: height * 0.2,
            //                     // width: 400,
            //                     decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(15),
            //                       image: DecorationImage(
            //                           image: NetworkImage(imagedata[index]),
            //                           fit: BoxFit.cover),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           );
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.38,
                  // width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (context, int index) {
                        return Column(
                          children: [
                            Card(
                              elevation: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: height * 0.2,
                                    width: width * 0.78,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/ae77f66b-01d9-4cd2-baa4-cbca803c7a0d@800.webp"),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        products[index].title!,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Comfortaa"),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        products[index].title!,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Comfortaa",
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        products[index].name!,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Comfortaa",
                                            color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: height * 0.02, right: height * 0.02),
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 12,
                      itemCount: products.length,
                      itemBuilder: (context, int index) {
                        return Container(
                          // height: height * 2.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            // image: DecorationImage(
                            //     image: AssetImage(products[index].image!),
                            //     fit: BoxFit.cover),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 6,
                                child: Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                products[index].image!),
                                            fit: BoxFit.cover)),
                                    // child: Image.asset(products[index].image!,
                                    //     fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      products[index].title!,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Comfortaa",
                                          color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      products[index].title!,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Comfortaa",
                                          color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      products[index].name!,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Comfortaa",
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      staggeredTileBuilder: (int index) =>
                          StaggeredTile.count(1, index.isEven ? 1.7 : 1.4),
                    ),
                  ),
                )
              ],
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
          )),
      title: const Text(
        "BiteFeed",
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
