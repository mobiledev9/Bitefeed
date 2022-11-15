import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class Iteam {
  final int? id;
  final IconData? icon1;

  final String? name;

  final IconData? icon;

  Iteam({this.id, this.icon1, this.name, this.icon});
}

final products = [
  Iteam(
      id: 1,
      icon1: Icons.arrow_forward_ios_outlined,
      name: "Privacy",
      icon: Icons.privacy_tip_outlined),
  Iteam(
      id: 1,
      icon1: Icons.arrow_forward_ios_outlined,
      name: "Security",
      icon: Icons.lock_clock_outlined),
  Iteam(
      id: 1,
      icon1: Icons.arrow_forward_ios_outlined,
      name: "Logout",
      icon: Icons.power_settings_new_outlined),
  Iteam(
      id: 1,
      icon1: Icons.arrow_forward_ios_outlined,
      name: "Help",
      icon: Icons.live_help_outlined),
  Iteam(
      id: 1,
      icon1: Icons.arrow_forward_ios_outlined,
      name: "About",
      icon: Icons.error_outline_rounded),
];

class _SettingScreenState extends State<SettingScreen> {
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: height * 0.05, left: width * 0.08),
                  child: Row(
                    children: [
                      Container(
                        width: width*0.3,
                        height: 100,
                        decoration: const BoxDecoration(
                            // color: Colors.red,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/person-1824144_960_720.webp"))),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Container(
                        height: 45,
                        width: width*0.45,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Edit profile",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit_outlined,
                                    color: Colors.grey))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.08, top: height * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "User Name",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Comfortaa'),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      const Text(
                        "Loremipsum@gmail.com",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Comfortaa',
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.04),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: height * 0.09,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            // borderRadius: BorderRadius.circular(28),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text(
                                    "800 k",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Comfortaa',
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.008,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text(
                                    "Following",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontFamily: 'Comfortaa',
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: height * 0.09,
                          // color: Colors.yellow,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            // borderRadius: BorderRadius.circular(28),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text(
                                    "500",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Comfortaa',
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text(
                                    "Invite",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontFamily: 'Comfortaa',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 330,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.08, top: height * 0.04),
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(products[index].icon),
                                    SizedBox(
                                      width: width * 0.03,
                                    ),
                                    Text(
                                      products[index].name!,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Comfortaa'),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        products[index].icon1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
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
        "Settings",
        style: TextStyle(
            fontSize: 35, fontWeight: FontWeight.bold, fontFamily: 'Comfortaa'),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
