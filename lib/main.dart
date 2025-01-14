import 'package:flutter/material.dart';
import 'package:gemini_app/Presentation/Views/SplacshView.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://hrfmxjawmkqkcrzxbtrl.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhyZm14amF3bWtxa2NyenhidHJsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY4NTkzMzQsImV4cCI6MjA1MjQzNTMzNH0.FxQrVxyo96Zb0wc7AMf6ZBwm8KGczbCRXj-IefQaYMU');
  runApp(const GeminiAPP());
}

class GeminiAPP extends StatelessWidget {
  const GeminiAPP({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splacshview(),
    );
  }
}
