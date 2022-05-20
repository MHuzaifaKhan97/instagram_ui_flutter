import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_selectedIndex == 0)
          ? SafeArea(
              child: Column(
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("./assets/images/logo.png",
                          width: 200, height: 60),
                      Image.asset("./assets/images/messenger.png",
                          color: Colors.black, width: 70, height: 35),
                    ],
                  ),
                  // Header End

                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Stories List
                        Container(
                          height: 130,
                          // color: Colors.red,
                          padding: EdgeInsets.all(12),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: add_story_widget(),
                                ),
                                StoriesListWidget(
                                    imagePath:
                                        "./assets/images/avatar/people1.jpeg",
                                    name: "John Doe"),
                                SizedBox(width: 16),
                                StoriesListWidget(
                                    imagePath:
                                        "./assets/images/avatar/people2.png",
                                    name: "Simon Jones"),
                                SizedBox(width: 16),
                                StoriesListWidget(
                                    imagePath:
                                        "./assets/images/avatar/people3.png",
                                    name: "Alyssa"),
                                SizedBox(width: 16),
                                StoriesListWidget(
                                    imagePath:
                                        "./assets/images/avatar/people4.jpeg",
                                    name: "Elie Goulding"),
                                SizedBox(width: 16),
                                StoriesListWidget(
                                    imagePath:
                                        "./assets/images/avatar/people5.png",
                                    name: "Mark Wood"),
                                SizedBox(width: 16),
                                StoriesListWidget(
                                    imagePath:
                                        "./assets/images/avatar/people6.jpeg",
                                    name: "Elon Parker"),
                                SizedBox(width: 16),
                              ],
                            ),
                          ),
                        ), // Stories List End
                        // Posts List
                        SinglePost(
                          avatar: "./assets/images/avatar/avatar0.png",
                          postUrl: "./assets/images/posts/post4.jpeg",
                          caption: "Weekend Start Now!!!",
                          name: "Huzaifa Khan",
                        ),
                        const SizedBox(height: 22),
                        SinglePost(
                          avatar: "./assets/images/avatar/people3.png",
                          postUrl: "./assets/images/posts/post3.jpeg",
                          caption: "beautiful Quote, Right?",
                          name: "Alyssa Lynch",
                        ),
                        const SizedBox(height: 22),
                        SinglePost(
                          avatar: "./assets/images/avatar/people6.jpeg",
                          postUrl: "./assets/images/posts/post1.jpeg",
                          caption: "Wallpaper <3 ",
                          name: "James Anderson",
                        )

                        // Posts List End
                      ],
                    ),
                  )),
                ],
              ),
            )
          : Container(),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              label: 'Home',
              // backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.black),
              label: 'Search',
              // backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_rounded, color: Colors.black),
              label: 'Add',
              // backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.black),
              label: 'Favorite',
              // backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black),
              label: 'Person',
              // backgroundColor: Colors.green,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }

  Container add_story_widget() {
    return Container(
      height: 130,
      width: 100,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset("./assets/images/avatar/avatar0.png"),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue,
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        child: Icon(Icons.add, color: Colors.white, size: 15))),
              )
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "Your Story",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class SinglePost extends StatelessWidget {
  String? avatar;
  String? name;
  String? caption;
  String? postUrl;

  SinglePost({this.avatar, this.name, this.caption, this.postUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipOval(
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ClipOval(
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              child: CircleAvatar(
                                  minRadius: 40,
                                  maxRadius: 50,
                                  backgroundImage: AssetImage(avatar!)),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.yellow.shade600,
                            Colors.orange,
                            Colors.red
                          ]),
                          border: Border.all(
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      name!,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(children: [
                  Icon(Icons.more_vert),
                ]),
              ],
            ),
          ),
          SizedBox(height: 8),
          Image.asset(postUrl!),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.favorite_border_outlined),
                    SizedBox(width: 8),
                    Image.asset("./assets/images/comment.webp",
                        width: 30, height: 30),
                    SizedBox(width: 8),
                    Image.asset("./assets/images/share.webp",
                        width: 20, height: 20),
                  ],
                ),
                Row(
                  children: [
                    Image.asset("./assets/images/saved.png",
                        width: 30, height: 30)
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Text(
                  name!,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  caption!,
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StoriesListWidget extends StatelessWidget {
  String? imagePath;
  String? name;

  StoriesListWidget({this.imagePath = "", this.name = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          clipBehavior: Clip.antiAlias,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipOval(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  width: 70.0,
                  height: 70.0,
                  child: CircleAvatar(
                      minRadius: 40,
                      maxRadius: 50,
                      backgroundImage: AssetImage(imagePath!)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.yellow.shade600, Colors.orange, Colors.red]),
              border: Border.all(
                color: Colors.amber,
              ),
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          name!,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
