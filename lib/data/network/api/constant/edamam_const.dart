class EdamamConst {
  EdamamConst._();

  // Credential from another github
  static const appid = 'ea1d37d5';
  static const appkey = 'fd382a172ba8d6668c0430dc9c14a181';

  // final appid = '3f4f310f';
  // final appkey = 'a3fd0d28cd6a2b5c664de96da482a7c1';

  /// Base URL
  static const String baseUrl = 'https://api.edamam.com/api/recipes/v2';

  /// Receive Timeout
  static const int receiveTimeout = 15000;

  /// connectTimeout
  static const int connectionTimeout = 15000;

  static const String endpoint = '';

  static const String users = '/users';
}

/// https://api.edamam.com/api/recipes/v2?type=public&q=chicken&app_id=ea1d37d5&app_key=fd382a172ba8d6668c0430dc9c14a181
/// https://api.edamam.com/api/recipes/v2?type=public&q=chicken&app_id=3f4f310f&app_key=a3fd0d28cd6a2b5c664de96da482a7c1
/// 
/// 