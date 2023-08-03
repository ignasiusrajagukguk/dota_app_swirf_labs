import 'dart:convert';
import 'package:dota_app_swirf_labs_test_case/view/model/hero_model.dart';
import 'package:http/http.dart' as http;

class HeroesListService {
  Future<List<HeroesModel>> getHeroesList() async {
    String url = 'https://api.opendota.com/api/herostats';
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      final dataList = jsonDecode(response.body) as List;
      List<HeroesModel> productList = dataList.map((e) {
        HeroesModel product = HeroesModel.fromJson(e);
        return product;
      }).toList();
      return productList;
    }
    return [];
  }
}
