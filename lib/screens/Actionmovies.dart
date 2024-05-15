import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Showvideo.dart';

class Actionmovies extends StatefulWidget {
  final String id;
  final String name;
  const Actionmovies({super.key,required this.id,required this.name});

  @override
  State<Actionmovies> createState() => _ActionmoviesState();
}

class _ActionmoviesState extends State<Actionmovies> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text("${widget.name}",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,color: Colors.white),),
      ),
      body: SizedBox(
        height: height,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection(widget.id).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }
            return GridView.builder(

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 10.0, // Spacing between columns
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.52// Spacing between rows
              ),
              itemCount:snapshot.data!.docs.length , // Number of items in the grid
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot document = snapshot.data!.docs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Showvideo(url : document['mvideourl'])));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 02),
                    child: SizedBox(
                      width: width * 0.35,

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              height: height * 0.22,
                              width: width,
                              imageUrl: document['mimage'],
                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  Image.asset(fit: BoxFit.cover,"assets/loaderImg.gif", height: height * 0.25, width: width),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          ),
                          Text(
                            document['mname'],
                            style: GoogleFonts.poppins(color: Colors.white,fontSize: width*.03),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
