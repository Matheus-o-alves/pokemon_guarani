// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pokemon_guarani/app/presentation/homepage/views/widgets/card_struct.dart';
import 'package:pokemon_guarani/app/presentation/homepage/views/widgets/image_pokemon.dart';
import 'package:pokemon_guarani/app/utils/pokemon_type_icons.dart';

import '../../../../utils/pokemon_type_colors.dart';
import '../../../../domain/entities/pokemon.dart';
import '../../controllers/homepage_controller.dart';

class CardPokemon extends StatelessWidget {
  Pokemon pokemon;
  int index;
  HomePageController controller;

  CardPokemon(
      {Key? key,
      required this.pokemon,
      required this.index,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        '/pokemon-page',
        arguments: {
          'pokemon': pokemon,
          'color':
              colorBackgroundCard[pokemon.types[0].name] ?? Colors.blueGrey,
        },
      ),
      child: CardStruct(
        color: colorBackgroundCard[pokemon.types[0].name],
        child: Row(
          children: [
            Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "# ${index.toString()}",
                      style: const TextStyle(
                        color: Color(0xfff000000),
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      pokemon.name.toUpperCase(),
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        color: Color(0xfff000000),
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Container(
                      width: 100,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      margin: const EdgeInsets.only(top: 12),
                      decoration: BoxDecoration(
                        color: colorBackgrounType[pokemon.types[0].name] ??
                            Colors.blueGrey,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            iconsPokemon[pokemon.types[0].name],
                            color: Colors.white,
                            height: 15,
                          ),
                          Text(
                            pokemon.types[0].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: ImagePokemon(
                typeName: pokemon.types[0].name,
                urlImage: pokemon.imageUrl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 34.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        final controller = Get.find<HomePageController>();
                        controller.pokemonIsFavorite(
                          !pokemon.isFavorite,
                          pokemon,
                        );
                        final snackBar = SnackBar(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          content: Row(
                            children: [
                              controller.isFavoriteList
                                  ? SvgPicture.asset(
                                      "lib/app/assets/icons/icon_favorite.svg",
                                      height: 30,
                                      width: 40,
                                    )
                                  : SvgPicture.asset(
                                      "lib/app/assets/icons/icon_not_favorite.svg",
                                      height: 30,
                                      width: 40,
                                    ),
                              const SizedBox(width: 10),
                              controller.isFavoriteList
                                  ? const Text(
                                      'Pokémon adicionado aos favoritos',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  : const Text(
                                      'Pokémon removido dos favoritos',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                            ],
                          ),
                          duration: const Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: pokemon.isFavorite
                          ? SvgPicture.asset(
                              "lib/app/assets/icons/icon_favorite.svg",
                              height: 30,
                              width: 40,
                            )
                          : SvgPicture.asset(
                              "lib/app/assets/icons/icon_not_favorite.svg",
                              height: 30,
                              width: 40,
                            ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void snackBarFavorite(
  //   BuildContext context,
  // ) {
  //   final snackBar = SnackBar(
  //     backgroundColor: Colors.white,
  //     shape: RoundedRectangleBorder(
  //       side: const BorderSide(color: Colors.yellow, width: 2),
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     content: StreamBuilder<bool>(
  //         stream: controller.streamIsFavorite,
  //         initialData: false,
  //         builder: (context, snapshot) {
  //           return Row(
  //             children: [
  //               snapshot.data.reactive.hasListeners
  //                   ? SvgPicture.asset(
  //                       "lib/app/assets/icons/icon_favorite.svg",
  //                       height: 30,
  //                       width: 40,
  //                     )
  //                   : SvgPicture.asset(
  //                       "lib/app/assets/icons/icon_not_favorite.svg",
  //                       height: 30,
  //                       width: 40,
  //                     ),
  //               const SizedBox(width: 10),
  //               snapshot.data.reactive.hasListeners
  //                   ? const Text(
  //                       'Pokemon adicionado aos favoritos',
  //                       style: TextStyle(fontSize: 16, color: Colors.black),
  //                     )
  //                   : const Text(
  //                       'Pokemon removido dos favoritos',
  //                       style: TextStyle(fontSize: 16, color: Colors.black),
  //                     )
  //             ],
  //           );
  //         }),
  //     duration: const Duration(seconds: 3),
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }
}
