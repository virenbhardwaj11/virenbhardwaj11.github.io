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
  int index = 0;
  Future<void> _getDataFromFirestore() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('banner').get();
      setState(() {
        _documents = snapshot.docs;
      });
    } catch (error) {
      // Handle error here
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(body: ResponsiveBuilder(builder: (context, size) {
      if (size.deviceScreenType == DeviceScreenType.mobile && width < 400) {
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
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: height * .0012,
                      viewportFraction: 1,
                      // onPageChanged: (indexs, reason) {
                      //   setState(() {
                      //     index = indexs;
                      //   });
                      // }
                      autoPlay: true,
                    ),
                    items: _documents
                        .map(
                          (item) => Stack(children: [
                            Container(
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black,
                              ),
                              child: Image.network(
                                height: height * .5,
                                item['mbanner'],
                                width: width,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Container(
                                height: height * .2,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(1),
                                      // You can adjust the darkness here
                                    ],
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item['mname'],
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontSize: width * .05),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextButton.icon(
                                      icon: const Icon(
                                        Icons.play_arrow_rounded,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Actionmovies(
                                                        id: "banner",
                                                        name:
                                                            "Trending Movies")));
                                      },
                                      label: Text(
                                        "Play",
                                        style: GoogleFonts.poppins(
                                            color: Colors.black),
                                      ),
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]),
                        )
                        .toList(),
                  ),
                  MarvelMoviesWidget(
                    title: "Action Movies",
                    collection: "cinema",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "cinema", name: "Action Movies")));
                    },
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  MarvelMoviesWidget(
                    title: "Horror Movies",
                    collection: "horror",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "horror", name: "Horror Movies")));
                    },
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  MarvelMoviesWidget(
                    title: "Marvel Movies",
                    collection: "marvel",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "marvel", name: "Marvel Movies")));
                    },
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  MarvelMoviesWidget(
                    title: "Adventure Movies",
                    collection: "Adventure",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "Adventure", name: "Adventure Movies")));
                    },
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  MarvelMoviesWidget(
                    title: "Kids Movies",
                    collection: "kids",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "kids", name: "Kids Movies")));
                    },
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  MarvelMoviesWidget(
                    title: "Science Fiction Movies",
                    collection: "Sci-Fi",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "Sci-Fi", name: "Sci-Fi Movies")));
                    },
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  MarvelMoviesWidget(
                    title: "Comedy Movies",
                    collection: "Comedy",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "Comedy", name: "Comedy Movies")));
                    },
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  MarvelMoviesWidget(
                    title: "Thriller Movies",
                    collection: "Thriller",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "Thriller", name: "Thriller Movies")));
                    },
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  MarvelMoviesWidget(
                    title: "Romantic Movies",
                    collection: "Romantic",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "Romantic", name: "Romantic Movies")));
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }
      if(size.deviceScreenType == DeviceScreenType.tablet){
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
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: height * .0016,
                      viewportFraction: 1,
                      // onPageChanged: (indexs, reason) {
                      //   setState(() {
                      //     index = indexs;
                      //   });
                      // }
                      autoPlay: true,
                    ),
                    items: _documents
                        .map(
                          (item) => Stack(children: [
                        Container(
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black,
                          ),
                          child: Image.network(
                            height: height * .5,
                            item['mbanner'],
                            width: width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            height: height * .2,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(1),
                                  // You can adjust the darkness here
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item['mname'],
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: width * .05),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextButton.icon(
                                  icon: const Icon(
                                    Icons.play_arrow_rounded,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const Actionmovies(
                                                id: "banner",
                                                name:
                                                "Trending Movies")));
                                  },
                                  label: Text(
                                    "Play",
                                    style: GoogleFonts.poppins(
                                        color: Colors.black),
                                  ),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(5))),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                    )
                        .toList(),
                  ),
                  MarvelMoviestabletWidget(
                    title: "Action Movies",
                    collection: "cinema",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "cinema", name: "Action Movies")));
                    },
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  MarvelMoviestabletWidget(
                    title: "Horror Movies",
                    collection: "horror",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "horror", name: "Horror Movies")));
                    },
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  MarvelMoviestabletWidget(
                    title: "Marvel Movies",
                    collection: "marvel",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "marvel", name: "Marvel Movies")));
                    },
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  MarvelMoviestabletWidget(
                    title: "Adventure Movies",
                    collection: "Adventure",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "Adventure", name: "Adventure Movies")));
                    },
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  MarvelMoviestabletWidget(
                    title: "Kids Movies",
                    collection: "kids",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "kids", name: "Kids Movies")));
                    },
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  MarvelMoviestabletWidget(
                    title: "Science Fiction Movies",
                    collection: "Sci-Fi",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "Sci-Fi", name: "Sci-Fi Movies")));
                    },
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  MarvelMoviestabletWidget(
                    title: "Comedy Movies",
                    collection: "Comedy",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "Comedy", name: "Comedy Movies")));
                    },
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  MarvelMoviestabletWidget(
                    title: "Thriller Movies",
                    collection: "Thriller",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "Thriller", name: "Thriller Movies")));
                    },
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  MarvelMoviestabletWidget(
                    title: "Romantic Movies",
                    collection: "Romantic",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Actionmovies(
                                  id: "Romantic", name: "Romantic Movies")));
                    },
                  ),
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
                    height: MediaQuery.of(context).size.height *.5,
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider(
                      options: CarouselOptions(
                          disableCenter: true,
                          autoPlay: true,
                          enlargeFactor: 0.2,
                          enlargeCenterPage: true),
                      items: _documents
                          .map(
                            (item) => Stack(children: [
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
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  const Actionmovies(
                                                      id: "banner",
                                                      name:
                                                      "Trending Movies")));
                                        },
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
                            ]),
                          )
                          .toList(),
                    )),
                Divider(
                  color: Colors.white.withOpacity(0.5),
                ),
                MarvelMovieswebWidget(
                  title: "Action Movies",
                  collection: "cinema",
                  onPressed: () {},
                ),
                Divider(
                  color: Colors.white.withOpacity(0.5),
                ),
                MarvelMovieswebWidget(
                  title: "Horror Movies",
                  collection: "horror",
                  onPressed: () {},
                ),
                Divider(
                  color: Colors.white.withOpacity(0.5),
                ),
                MarvelMovieswebWidget(
                  title: "Marvel Movies",
                  collection: "marvel",
                  onPressed: () {},
                ),
                Divider(
                  color: Colors.white.withOpacity(0.5),
                ),
                MarvelMovieswebWidget(
                  title: "Adventure Movies",
                  collection: "Adventure",
                  onPressed: () {},
                ),
                Divider(
                  color: Colors.white.withOpacity(0.5),
                ),
                MarvelMovieswebWidget(
                  title: "Kids Movies",
                  collection: "kids",
                  onPressed: () {},
                ),
                Divider(
                  color: Colors.white.withOpacity(0.5),
                ),
                MarvelMovieswebWidget(
                  title: "Science Fiction Movies",
                  collection: "Sci-Fi",
                  onPressed: () {},
                ),
                Divider(
                  color: Colors.white.withOpacity(0.5),
                ),
                MarvelMovieswebWidget(
                  title: "Comedy Movies",
                  collection: "Comedy",
                  onPressed: () {},
                ),
                Divider(
                  color: Colors.white.withOpacity(0.5),
                ),
                MarvelMovieswebWidget(
                  title: "Thriller Movies",
                  collection: "Thriller",
                  onPressed: () {},
                ),
                Divider(
                  color: Colors.white.withOpacity(0.5),
                ),
                MarvelMovieswebWidget(
                  title: "Romantic Movies",
                  collection: "Romantic",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
