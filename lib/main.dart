import 'package:challenge_app/domain/repository/characterRepository.dart';
import 'package:challenge_app/ui/pages/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CharacterRepository(),
      child: MaterialApp(
        title: 'Challenge App',
        home: const HomePage(),
      ),
    );
  }
}
