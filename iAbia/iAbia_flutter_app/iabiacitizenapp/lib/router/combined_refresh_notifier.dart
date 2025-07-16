import 'dart:async';
import 'package:flutter/foundation.dart';

class CombinedRefreshNotifier extends ChangeNotifier {
  final List<Stream> _streams;
  final List<StreamSubscription> _subscriptions = [];

  CombinedRefreshNotifier(this._streams) {
    for (final stream in _streams) {
      _subscriptions.add(stream.listen((_) => notifyListeners()));
    }
  }

  @override
  void dispose() {
    for (final sub in _subscriptions) {
      sub.cancel();
    }
    super.dispose();
  }
}
