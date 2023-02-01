import 'package:stacked/stacked.dart';

class GameListViewModel extends BaseViewModel {
  List<int> _games = [1, 2, 3, 4];
  List<int> get games => _games;
}
