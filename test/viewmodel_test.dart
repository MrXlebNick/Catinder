import 'package:catinder/repository.dart';
import 'package:catinder/viewmodel.dart';
import 'package:test/test.dart';

void main() {
  var inputsToExpected = [
    GetNextCatTestCase({1}, 0, 2),
    GetNextCatTestCase({1}, 1, 2),
    GetNextCatTestCase({1, 2}, 0, 3),
    GetNextCatTestCase({1, 5}, 0, 2),
  ];
  inputsToExpected.forEach((element) {
    var initialDbState = element.initialDbState;
    var input = element.input;
    var output = element.output;
    test('getNextCat: $input -> $output when initially $initialDbState',
        () async {
      var repository = MockCatLikesRepository({1});
      var viewModel = ImplCatinderViewModel(repository);

      expect(await viewModel.getNextCat(0), 2);
    });
  });
}

class GetNextCatTestCase {
  final Set<int> initialDbState;
  final int input;
  final int output;

  GetNextCatTestCase(this.initialDbState, this.input, this.output);
}

class MockCatLikesRepository implements CatLikesRepository {
  Set<int> dislikedCats = <int>{};

  MockCatLikesRepository(this.dislikedCats);

  @override
  void dislikeCat(int key) {
    // TODO: implement dislikeCat
  }

  @override
  Future<Set<int>> getDislikedCats() async {
    return dislikedCats;
  }

  @override
  void purge() {
    // TODO: implement purge
  }

  @override
  void undislikeCat(int key) {
    // TODO: implement undislikeCat
  }
}
