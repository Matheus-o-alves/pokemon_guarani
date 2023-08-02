import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../utils/pokemon_type_colors.dart';
import '../../../../../utils/pokemon_type_icons.dart';
import '../controllers/pokemon_page_controller.dart';

class PokemonPage extends StatelessWidget {
  PokemonPageController controller = Get.find();
  PokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthPage = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        backgroundColor: controller.colorPokemon,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: controller.colorPokemon,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    child: Hero(
                        tag: controller.pokemonData.imageUrl,
                        child: Image.network(controller.pokemonData.imageUrl)),
                  ),
                  const SizedBox(height: 200),
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.pokemonData.name.toUpperCase(),
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
                              color: colorBackgrounType[controller.pokemonData
                                    ..types[0].name] ??
                                  Colors.blueGrey,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  iconsPokemon[
                                      controller.pokemonData.types[0].name],
                                  color: Colors.white,
                                  height: 15,
                                ),
                                Text(
                                  controller.pokemonData.types[0].name,
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
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              controller.pokemonData.name,
              style: const TextStyle(
                color: Color.fromARGB(198, 24, 24, 24),
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children:
                  List.generate(controller.pokemonData.types.length, (index) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorBackgroundCard[
                            controller.pokemonData.types[index].name] ??
                        Colors.blueGrey,
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Text(
                    controller.pokemonData.types[index].name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'Peso',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(213, 53, 53, 53),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '${controller.numberFormated(controller.pokemonData.weight)} KG',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 75, 75, 75),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 80),
                Column(
                  children: [
                    const Text(
                      'Altura',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(213, 53, 53, 53),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '${controller.numberFormated(controller.pokemonData.height)} M',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 75, 75, 75),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            const Text(
              'Abilidades',
              style: TextStyle(
                color: Color.fromARGB(198, 24, 24, 24),
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 5),
            Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(
                controller.pokemonData.abilities.length,
                (index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: colorBackgroundCard[
                              controller.pokemonData.types[0].name] ??
                          Colors.blueGrey,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      controller.pokemonData.abilities[index].name ?? '',
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Stats',
              style: TextStyle(
                color: Color.fromARGB(198, 24, 24, 24),
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            Column(
              children:
                  List.generate(controller.pokemonData.stats.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.pokemonData.stats[index].name,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(198, 24, 24, 24),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: controller.barWidth(
                                  controller.pokemonData.stats[index].baseStat,
                                ),
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: colorStatPokemon[
                                      controller.pokemonData.stats[index].name],
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                controller.pokemonData.stats[index].baseStat
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(197, 67, 67, 67),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
