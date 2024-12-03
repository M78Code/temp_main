abstract class Singleton {
  static dynamic _instance;

  static T getInstance<T extends SingletonType>() {
    if (_instance == null) {
      _instance = T;
    }
    return _instance as T;
  }

  static void deleteInstance<T extends Singleton>() {
    _instance = null;
  }
}

typedef SingletonType<T> = T Function();
