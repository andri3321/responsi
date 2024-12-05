import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/amiibo.dart';
import '../services/api_service.dart';

class AmiiboProvider with ChangeNotifier {
  List<Amiibo> _amiibos = [];
  List<Amiibo> _favorites = [];
  bool _isLoading = true;

  List<Amiibo> get amiibos => _amiibos;
  List<Amiibo> get favorites => _favorites;
  bool get isLoading => _isLoading;

  AmiiboProvider() {
    loadAmiibos();
    loadFavorites();
  }

  Future<void> loadAmiibos() async {
    _isLoading = true;
    notifyListeners();
    try {
      _amiibos = await ApiService.fetchAmiibos();
    } catch (e) {
      _amiibos = [];
    }
    _isLoading = false;
    notifyListeners();
  }

  void toggleFavorite(Amiibo amiibo) async {
    if (_favorites.contains(amiibo)) {
      _favorites.remove(amiibo);
    } else {
      _favorites.add(amiibo);
    }
    notifyListeners();
    saveFavorites();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFavorites = prefs.getStringList('favorites') ?? [];
    _favorites = _amiibos
        .where((amiibo) =>
            savedFavorites.contains(jsonEncode({'name': amiibo.name})))
        .toList();
    notifyListeners();
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'favorites',
      _favorites.map((amiibo) => jsonEncode({'name': amiibo.name})).toList(),
    );
  }
}
