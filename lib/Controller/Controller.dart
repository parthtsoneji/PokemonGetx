import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../Model/PokemonModel.dart';

class PokemonController extends GetxController {
  var pokeDexModal = [].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getApi();
  }
  getApi() async {
    try {
      isLoading(true);
      var url = Uri.parse('https://pokeapi.co/api/v2/pokemon');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response);
        pokeDexModal.value = json.decode(response.body)['results'];
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false);
    }
  }
}
