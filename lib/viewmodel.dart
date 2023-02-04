import 'package:catinder/repository.dart';

abstract class CatinderViewModel {
  Future<int> getNextCat(int currentCatKey);
  Future<int> dislikeCat(int catKey);
  void undislikeCat(int catKey);
  void purge();
}

class ImplCatinderViewModel implements CatinderViewModel {
  final CatLikesRepository _catLikesRepository;
  ImplCatinderViewModel(this._catLikesRepository);

  @override
  Future<int> dislikeCat(int catKey) async{
    _catLikesRepository.dislikeCat(catKey);
    return _getNextAvailableCatKey(catKey);

  }

  @override
  Future<int> getNextCat(int currentCatKey) {
    return _getNextAvailableCatKey(currentCatKey);
  }


  Future<int> _getNextAvailableCatKey(int currentKey) async {
    Set<int> dislikedCats = await _catLikesRepository.getDislikedCats();
    int candidate = currentKey + 1;
    while (dislikedCats.contains(candidate)) {
      candidate++;
    }
    return candidate;
  }

  @override
  purge() async {
    _catLikesRepository.purge();
  }

  @override
  void undislikeCat(int catKey) async{
    _catLikesRepository.undislikeCat(catKey);
  }

}