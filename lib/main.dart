import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';

import 'app/features/pokemon/data/models/hive/pokemon_hive_model.dart';
import 'app/features/pokemon/presentation/homepage/bindings/homepage_binding.dart';
import 'app/injection.config.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PokemonHiveModelAdapter());
  await Hive.openBox<PokemonHiveModel>('string_list');
  configureInjection();

  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokemon Guarani',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HomePage,
      initialBinding: HomePageBinding(),
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}
