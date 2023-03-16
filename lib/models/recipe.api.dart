import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kitchen_genie/models/recipe.dart';



class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "24", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "dc5ec6c7d9msh278927a51996521p10e84ajsn0ba463c8e835",
      "x-rapidapi-host": "yummly2.p.rapidapi.com"
      //"useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['feed']) {
      temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(temp);
  }
}

/*const axios = require("axios");

const options = {
  method: 'GET',
  url: 'https://yummly2.p.rapidapi.com/feeds/list',
  params: {limit: '24', start: '0'},
  headers: {
    'X-RapidAPI-Key': 'dc5ec6c7d9msh278927a51996521p10e84ajsn0ba463c8e835',
    'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
  }
};

axios.request(options).then(function (response) {
	console.log(response.data);
}).catch(function (error) {
	console.error(error);
});*/