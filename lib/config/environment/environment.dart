import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String newsAPIkey =
      dotenv.env['NEWS_API'] ?? 'NEWS_API not found';
}
