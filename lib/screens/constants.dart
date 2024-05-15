import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Showvideo.dart';

class MarvelMoviesWidget extends StatelessWidget {
  final String title;
  final String collection;
  final VoidCallback? onPressed;
  const MarvelMoviesWidget({
    required this.title,
    required this.collection,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(
                 title,
                 style: GoogleFonts.poppins(  color: Colors.white,
                   fontSize: width * 0.04,
                   fontWeight: FontWeight.w600,)
             ),
             TextButton(
              style:ButtonStyle( overlayColor: WidgetStateColor.resolveWith((states) => Colors.white54),),
               onPressed: onPressed, child:
             Text(
                 "View more",
                 style: GoogleFonts.poppins(  color: Colors.white,
                   fontSize: width * 0.03,
                   fontWeight: FontWeight.w600,)
             ),
             )
           ],
         ),
        const SizedBox(height: 10),
         SizedBox(
           height: height*.3,
           child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection(collection).limit(10).snapshots(),
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
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = snapshot.data!.docs[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Showvideo(url : document['mvideourl'])));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SizedBox(
                            width: width * 0.35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    height: height * 0.25,
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
      ],
    );
  }
}
