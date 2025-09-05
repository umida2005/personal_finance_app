
import 'observer.dart';

class Observable<T extends Object?> {
  T _value;
  final List<Observer<T>> _listeners = [];

  Observable(this._value);

  T get value => _value;

  set value(T newValue) {
    if (_value != newValue) {
      _value = newValue;
      _notifyListeners();
    }
  }

  void addListener(Observer<T> listener) {
    _listeners.add(listener);
    listener.notify(_value);
  }

  void removeListener(Observer<T> listener) {
    _listeners.remove(listener);
  }

  void _notifyListeners() {
    for (var listener in _listeners) {
      listener.notify(_value);
    }
  }
}
