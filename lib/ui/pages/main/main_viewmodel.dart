import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel {
  // ------ START OF INDEX TRACKING FUNCTIONALITY ------ //

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  bool _reverse = false;

  /// Indicates whether we're going forward or backward in terms of the index we're changing.
  /// This is very helpful for the page transition directions.
  bool get reverse => _reverse;

  void setIndex(int value) {
    if (value < _currentIndex) {
      _reverse = true;
    } else {
      _reverse = false;
    }
    _currentIndex = value;
    notifyListeners();
  }

  bool isIndexSelected(int index) => _currentIndex == index;

  // ------ END OF INDEX TRACKING FUNCTIONALITY ------ //

}
