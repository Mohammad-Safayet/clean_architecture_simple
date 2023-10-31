import 'package:shared_preferences/shared_preferences.dart';
import 'package:chuck_norris/src/core/utils/local/local_manager.dart';

class LocalManagerImpl extends LocalManager {
  static final _preferences = SharedPreferences.getInstance();

  LocalManagerImpl._internal();

  @override
  Future<bool> clear() {
    return _preferences.then(
      (preference) => preference.clear(),
    );
  }

  @override
  Future<bool> getBool(
    String key, {
    bool defaultValue = false,
  }) {
    return _preferences.then(
      (preference) => preference.getBool(key) ?? defaultValue,
    );
  }

  @override
  Future<double> getDouble(
    String key, {
    double defaultValue = 0.0,
  }) {
    return _preferences.then(
      (preference) => preference.getDouble(key) ?? defaultValue,
    );
  }

  @override
  Future<int> getInt(
    String key, {
    int defaultValue = 0,
  }) {
    return _preferences.then(
      (preference) => preference.getInt(key) ?? defaultValue,
    );
  }

  @override
  Future<String> getString(
    String key, {
    String defaultValue = "",
  }) {
    return _preferences.then(
      (preference) => preference.getString(key) ?? defaultValue,
    );
  }

  @override
  Future<List<String>> getStringList(
    String key, {
    List<String> defaultValue = const [],
  }) {
    return _preferences.then(
      (preference) => preference.getStringList(key) ?? defaultValue,
    );
  }

  @override
  Future<bool> remove(
    String key,
  ) {
    return _preferences.then(
      (preference) => preference.remove(key),
    );
  }

  @override
  Future<bool> setBool(
    String key,
    bool value,
  ) {
    return _preferences.then(
      (preference) => preference.setBool(
        key,
        value,
      ),
    );
  }

  @override
  Future<bool> setDouble(
    String key,
    double value,
  ) {
    return _preferences.then(
      (preference) => preference.setDouble(
        key,
        value,
      ),
    );
  }

  @override
  Future<bool> setInt(
    String key,
    int value,
  ) {
    return _preferences.then(
      (preference) => preference.setInt(
        key,
        value,
      ),
    );
  }

  @override
  Future<bool> setString(
    String key,
    String value,
  ) {
    return _preferences.then(
      (preference) => preference.setString(
        key,
        value,
      ),
    );
  }

  @override
  Future<bool> setStringList(
    String key,
    List<String> value,
  ) {
    return _preferences.then(
      (preference) => preference.setStringList(
        key,
        value,
      ),
    );
  }
}
