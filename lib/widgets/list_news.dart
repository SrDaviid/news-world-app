import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_world_app/models/news_models.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;
  const ListNews(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height * 0.28;
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        if (news[index].urlToImage == null) {
          return Container();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: const Offset(0, 2))
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FutureBuilder(
                          future: precacheImage(
                              NetworkImage(news[index].urlToImage.toString()),
                              context),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Image.network(
                                news[index].urlToImage.toString(),
                                height: containerHeight,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              );
                            } else {
                              return SizedBox(
                                height: containerHeight,
                                width: double.infinity,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [1, 1],
                              colors: [Colors.black26, Colors.transparent],
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            DateFormat('yyyy-MM-dd').format(
                              news[index].publishedAt,
                            ),
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    news[index].title,
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    news[index].description.toString(),
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w600, fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
