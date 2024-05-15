import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinemahall/screens/Actionmovies.dart';
import 'package:cinemahall/screens/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _getDataFromFirestore();
  }

  List<DocumentSnapshot> _documents = [];
  int index=0;
  Future<void> _getDataFromFirestore() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('banner').get();
      setState(() {
        _documents = snapshot.docs;
      });
    } catch (error) {
      print("Error getting documents: $error");
      // Handle error here
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: const Color(0xFF191714),
        forceMaterialTransparency: false,
        backgroundColor: const Color(0xFF191714),
        centerTitle: true,
        title: Text(
          "Cinema Hall",
          style:
              GoogleFonts.poppins(color: Colors.white, fontSize: width * .04),
        ),
      ),
      body: ResponsiveBuilder(builder: (context,size){
        if(size.deviceScreenType == DeviceScreenType.mobile){
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF191714),
                  Color(0xFF2234AE),
                  // You can adjust the darkness here
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: MediaQuery.of(context).size.height * .2,
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider(
                          options: CarouselOptions(
                              onPageChanged: (indexs, reason) {
                                setState(() {
                                  index = indexs;
                                });
                              },
                              disableCenter: true,
                              autoPlay: true,
                              enlargeFactor: 0.2,
                              enlargeCenterPage: true
                          ),
                          items: _documents
                              .map((item) => Stack(children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black,
                              ),
                              margin: const EdgeInsets.all(5),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    item['mbanner'],
                                    width: width,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            Container(
                              width: width,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.black.withOpacity(0.3)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.play_circle_outlined,
                                        color: Colors.white,
                                        size: width * .1,
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    item['mname'],
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: width * .04),
                                  )
                                ],
                              ),
                            ),
                          ]),)
                              .toList(),

                        )),
                    SizedBox(
                      width: width*.1,
                      height: width*.05,
                      child: ListView.builder(
                        itemCount: _documents.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int indexp) {
                          return Container(
                            width: 8,
                            height: 8.0,
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index == indexp ? Colors.white : Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                    Divider(
                      color: Colors.white.withOpacity(0.5),
                    ),
                     MarvelMoviesWidget(
                        title: "Action Movies", collection: "cinema", onPressed: () {
                          print("----");
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const Actionmovies(id:"cinema",name:"Action Movies")));
                     },),
                    Divider(
                      color: Colors.white.withOpacity(0.5),
                    ),
                     MarvelMoviesWidget(
                        title: "Horror Movies", collection: "horror", onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const Actionmovies(id:"horror",name:"Horror Movies")));

                     },),
                    Divider(
                      color: Colors.white.withOpacity(0.5),
                    ),
                     MarvelMoviesWidget(
                        title: "Marvel Movies", collection: "marvel", onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const Actionmovies(id:"marvel",name:"Marvel Movies")));

                     },),
                    Divider(
                      color: Colors.white.withOpacity(0.5),
                    ),
                     MarvelMoviesWidget(
                        title: "Adventure Movies", collection: "Adventure", onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const Actionmovies(id:"Adventure",name:"Adventure Movies")));

                     },),
                    Divider(
                      color: Colors.white.withOpacity(0.5),
                    ),
                     MarvelMoviesWidget(
                        title: "Kids Movies", collection: "kids", onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const Actionmovies(id:"kids",name:"Kids Movies")));

                     },),
                    Divider(
                      color: Colors.white.withOpacity(0.5),
                    ),
                     MarvelMoviesWidget(
                        title: "Science Fiction Movies", collection: "Sci-Fi", onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const Actionmovies(id:"Sci-Fi",name:"Sci-Fi Movies")));

                     },),
                    Divider(
                      color: Colors.white.withOpacity(0.5),
                    ),
                     MarvelMoviesWidget(
                        title: "Comedy Movies", collection: "Comedy", onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const Actionmovies(id:"Comedy",name:"Comedy Movies")));

                     },),
                    Divider(
                      color: Colors.white.withOpacity(0.5),
                    ),
                     MarvelMoviesWidget(
                        title: "Thriller Movies", collection: "Thriller", onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const Actionmovies(id:"Thriller",name:"Thriller Movies")));

                     },),
                    Divider(
                      color: Colors.white.withOpacity(0.5),
                    ),
                     MarvelMoviesWidget(
                        title: "Romantic Movies", collection: "Romantic", onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const Actionmovies(id:"Romantic",name:"Romantic Movies")));

                     },),
                  ],
                ),
              ),
            ),
          );
        }
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF191714),
                Color(0xFF191714),
                Color(0xFF2234AE),
                // You can adjust the darkness here
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: MediaQuery.of(context).size.height * .4,
                      width: MediaQuery.of(context).size.width,
                      child: CarouselSlider(
                        options: CarouselOptions(
                            onPageChanged: (indexs, reason) {
                              setState(() {
                                index = indexs;
                              });
                            },
                            disableCenter: true,
                            autoPlay: true,
                            enlargeFactor: 0.2,
                            enlargeCenterPage: true
                        ),
                        items: _documents
                            .map((item) => Stack(children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black,
                            ),
                            margin: const EdgeInsets.all(5),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  item['mbanner'],
                                  width: width,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Container(
                            width: width,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black.withOpacity(0.3)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.play_circle_outlined,
                                      color: Colors.white,
                                      size: width * .1,
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  item['mname'],
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: width * .03),
                                )
                              ],
                            ),
                          ),
                        ]),)
                            .toList(),

                      )),
                  SizedBox(
                    width: width*.1,
                    height: height*.1,
                    child: ListView.builder(
                      itemCount: _documents.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int indexp) {
                        return Container(
                          width: 15,
                          height: 15.0,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == indexp ? Colors.white : Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                   MarvelMoviesWidget(
                      title: "Action Movies", collection: "cinema", onPressed: () {  },),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                   MarvelMoviesWidget(
                      title: "Horror Movies", collection: "horror", onPressed: () {  },),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                   MarvelMoviesWidget(
                      title: "Marvel Movies", collection: "marvel", onPressed: () {  },),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                   MarvelMoviesWidget(
                      title: "Adventure Movies", collection: "Adventure", onPressed: () {  },),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                   MarvelMoviesWidget(
                      title: "Kids Movies", collection: "kids", onPressed: () {  },),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                   MarvelMoviesWidget(
                      title: "Science Fiction Movies", collection: "Sci-Fi", onPressed: () {  },),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                   MarvelMoviesWidget(
                      title: "Comedy Movies", collection: "Comedy", onPressed: () {  },),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                   MarvelMoviesWidget(
                      title: "Thriller Movies", collection: "Thriller", onPressed: () {  },),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                   MarvelMoviesWidget(
                      title: "Romantic Movies", collection: "Romantic", onPressed: () {  },),
                ],
              ),
            ),
          ),
        );
      })
    );
  }
}
