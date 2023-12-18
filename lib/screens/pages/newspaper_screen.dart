import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/news_service.dart';

class NewspaperScreen extends StatelessWidget {
  const NewspaperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return const Scaffold();
  }
}
