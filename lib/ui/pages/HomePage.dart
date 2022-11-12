import 'package:challenge_app/cubit/home_cubit.dart';
import 'package:challenge_app/domain/repository/characterRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit((context.read<CharacterRepository>()))..getData(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sample Code'),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: ((context, state) {
            switch (state.status) {
              case HomeStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case HomeStatus.success:
                return GridView.count(
                  crossAxisCount: 2,
                  children: state.characters
                      .map((character) => Card(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(character.title),
                            ),
                          ))
                      .toList(),
                );
              case HomeStatus.error:
                return const Center(
                  child: Text("Error"),
                );
            }
          }),
        ));
  }
}
