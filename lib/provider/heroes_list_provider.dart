import 'package:dota_app_swirf_labs_test_case/view/model/hero_model.dart';
import 'package:dota_app_swirf_labs_test_case/view_model/product_list.dart';
import 'package:flutter/material.dart';

class HeroesListProvider with ChangeNotifier {
  final HeroesListService _service = HeroesListService();
  bool isLoading = false;
  List<HeroesModel> _heroesList = [];
  List<HeroesModel> get heroesList => _heroesList;
  List<HeroesModel> _heroesInitiator = [];
  List<HeroesModel> get heroesInitiator => _heroesInitiator;
  List<HeroesModel> _heroesDurable = [];
  List<HeroesModel> get heroeDurable => _heroesDurable;
  List<HeroesModel> _heroesDisabler = [];
  List<HeroesModel> get heroeDisabler => _heroesDisabler;
  List<HeroesModel> _heroesSupport = [];
  List<HeroesModel> get heroeSupport => _heroesSupport;
  List<HeroesModel> _heroesEscape = [];
  List<HeroesModel> get heroeEscape => _heroesEscape;
  List<HeroesModel> _heroesPusher = [];
  List<HeroesModel> get heroesPusher => _heroesPusher;
  List<HeroesModel> _heroesNuker = [];
  List<HeroesModel> get heroesNuker => _heroesNuker;
  List<HeroesModel> _heroesCarry = [];
  List<HeroesModel> get heroesCarry => _heroesCarry;
  List<String> heroesFilterHome = [];
  List<String> heroesFilter = [];

  Future<void> getAllHeroes(List<String> newHeroFIlter) async {
    heroesFilterHome = newHeroFIlter;
    isLoading = true;
    notifyListeners();

    final response = await _service.getHeroesList();
    _heroesList = response
        .where(
            (element) => containsAny(element.roles.toString(), newHeroFIlter))
        .toList();
    _heroesInitiator = response
        .where(
            (element) => containsAny(element.roles.toString(), ['Initiator']))
        .toList();
    _heroesDurable = response
        .where((element) => containsAny(element.roles.toString(), ['Durable']))
        .toList();
    _heroesDisabler = response
        .where((element) => containsAny(element.roles.toString(), ['Disabler']))
        .toList();
    _heroesSupport = response
        .where((element) => containsAny(element.roles.toString(), ['Support']))
        .toList();
    _heroesEscape = response
        .where((element) => containsAny(element.roles.toString(), ['Escape']))
        .toList();
    _heroesPusher = response
        .where((element) => containsAny(element.roles.toString(), ['Pusher']))
        .toList();
    _heroesNuker = response
        .where((element) => containsAny(element.roles.toString(), ['Nuker']))
        .toList();
    _heroesCarry = response
        .where((element) => containsAny(element.roles.toString(), ['Carry']))
        .toList();
    isLoading = false;
    notifyListeners();
  }

  bool containsAny(String text, List<String> substrings) {
    // returns true if any substring of the [substrings] list is contained in the [text]
    for (var substring in substrings) {
      if (text.contains(substring)) return true;
    }
    return false;
  }
}
