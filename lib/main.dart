import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gemini_app/BusinessLogic/cubit/auth_cubit.dart';
import 'package:gemini_app/Constants/Constants.dart';
import 'package:gemini_app/Presentation/Views/ChatView.dart';
import 'package:gemini_app/Presentation/Views/SplacshView.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: Supabase_url, anonKey: Supabase_Key);
  Gemini.init(apiKey: GEMINI_API_KEY);

  runApp(const GeminiAPP());
}

class GeminiAPP extends StatelessWidget {
  const GeminiAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splacshview(),
      ),
    );
  }
}
