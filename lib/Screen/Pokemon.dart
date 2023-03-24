import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex2/Controller/Controller.dart';
import 'package:pokedex2/Model/PokemonModel.dart';

class PokemonView extends StatelessWidget {
  PokemonView({Key? key}) : super(key: key);

  final PokemonController pokemonController = Get.put(PokemonController());
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon Api Calling"),
      ),
      body: GetBuilder<PokemonController>(
        builder: (controller) {
          if (pokemonController.pokeDexModal.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return _pokemonWidget();
          }
        },
      ),
    );
  }

  _pokemonWidget() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: pokemonController.pokeDexModal.length,
            itemBuilder: (context, index) {
              final pokemon =
                  PokeDexModal.fromJson(pokemonController.pokeDexModal[index]);
              return ListTile(
                title: Text(pokemon.name.toString()),
                leading: Image.network(
                  pokemon.getImage.toString(),
                  height: 80,
                  width: 80,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
