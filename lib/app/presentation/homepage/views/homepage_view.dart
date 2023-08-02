import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_guarani/app/presentation/homepage/views/widgets/header_homepage.dart';

import '../controllers/homepage_controller.dart';
import 'widgets/grid_pokemon.dart';
import 'widgets/loading_pokemons.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomePageController>();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pokémon Guarani'),
          actions: [
            IconButton(
              onPressed: () => controller.favoritePokemons(),
              icon: const Icon(Icons.favorite_border_outlined),
              tooltip: 'Pokemons Favoritos',
            ),
          ],
        ),
        body: HeaderHomePage(
          child: GetBuilder<HomePageController>(
            id: 'cards',
            builder: (_) {
              if (_.isLoading) {
                return const Loading();
              }
              return GridPokemon(controller: _);
            },
          ),
        ),
      ),
    );
  }
}
