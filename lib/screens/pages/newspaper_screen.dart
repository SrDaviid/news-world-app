import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_world_app/widgets/list_news.dart';
import 'package:provider/provider.dart';
import '../../services/news_service.dart';

class NewspaperScreen extends StatelessWidget {
  const NewspaperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'News',
            style: GoogleFonts.nunito(
                fontWeight: FontWeight.w800, color: Colors.white, fontSize: 24),
          ),
          backgroundColor: Colors.indigo,
        ),
        body: ListNews(newsService.headlines));
  }
}
