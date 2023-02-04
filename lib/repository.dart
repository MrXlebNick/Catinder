import 'dart:ffi';
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

abstract class CatLikesRepository {
  Future<Set<int>> getDislikedCats();

  void dislikeCat(int key);
  void undislikeCat(int key);

  void purge();
}

class ImplCatLikesRepository implements CatLikesRepository {
  final Future<SharedPreferences> _sPrefs = SharedPreferences.getInstance();
  // ignore: constant_identifier_names
  static const String _KEY = "disliked_cats";

  @override
  void dislikeCat(int key) async {
    final sPrefs = await _sPrefs;
    Set<int> dislikedCats = await getDislikedCats();
    dislikedCats.add(key);
    await sPrefs.setString(_KEY, dislikedCats.join(";"));
  }

  @override
  Future<Set<int>> getDislikedCats() async {
    return (await _sPrefs)
            .getString(_KEY)
            ?.split(';')
            .map((cat) => int.tryParse(cat))
            .whereType<int>()
            .toSet() ??
        <int>{};
  }

  @override
  void purge() async {
    final sPrefs = await SharedPreferences.getInstance();
    await sPrefs.remove(_KEY);
  }

  @override
  void undislikeCat(int key) async {
    final sPrefs = await _sPrefs;
    Set<int> dislikedCats = await getDislikedCats();
    dislikedCats.remove(key);
    await sPrefs.setString(_KEY, dislikedCats.join(";"));
  }
}
