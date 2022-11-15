import 'package:flutter/material.dart';

import 'massage_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
                      height: height * 0.03,
                    ),
                    DefaultTabController(
                        length: 4,
                        child: Column(
                          children: <Widget>[
                            TabBar(
                              // isScrollable: true,
                              // indicatorSize: TabBarIndicatorSize.label,
                              labelColor: Colors.black,
                              indicatorColor: Colors.white,

                              // unselectedLabelColor: Colors.black,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                               
                              ),

                              tabs: [
                                Column(
                                  children: const [
                                    Icon(
                                      Icons.history_outlined,
                                      size: 40,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Icon(
                                      Icons.person_outline,
                                      size: 40,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Icon(
                                      Icons.contact_phone_outlined,
                                      size: 40,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Icon(
                                      Icons.mode_comment_outlined,
                                      size: 40,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 600,
                              // color: Colors.red,
                              child: TabBarView(
                                children: <Widget>[
                                  MassageScreen(),
                                  MassageScreen(),
                                  MassageScreen(),
                                  MassageScreen(),
                                ],
                              ),
                            ),
                          ],
                        )),
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
          )),
      title: const Text(
        "Chats",
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.add_circle_outline,
            size: 35,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
