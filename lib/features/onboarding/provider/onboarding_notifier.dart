import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'onboarding_notifier.g.dart';

// Riverpod generator to manage the state of the onboarding screen

@riverpod
class IndexDot extends _$IndexDot {
  @override
  int build() {
    return 0;
  }

  void changeIndex(int value) {
    state = value;
  }

}