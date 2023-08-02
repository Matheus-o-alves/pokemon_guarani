import 'package:flutter/material.dart';

import '../../controllers/homepage_controller.dart';
import 'card_pokemon.dart';

class GridPokemon extends StatelessWidget {
  HomePageController controller;
  GridPokemon({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: controller.controllerScroll,
            itemCount: controller.listPokemons.length,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            itemBuilder: (BuildContext context, int index) {
              if (index < controller.listPokemons.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CardPokemon(
                    index: index,
                    pokemon: controller.listPokemons[index],
                    controller: controller,
                  ),
                );
              }
              return Container();
            },
          ),
        ),
        controller.isLoadingMoreData
            ? const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Center(child: CircularProgressIndicator()),
                  )
                ],
              )
            : Container(),
      ],
    );
  }
}
