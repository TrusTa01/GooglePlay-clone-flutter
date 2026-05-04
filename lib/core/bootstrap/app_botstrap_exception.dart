// Ошибка обязательной конфигурации при холодном старте
final class AppBootstrapException implements Exception {
  AppBootstrapException(this.message);
  final String message;

  @override
  String toString() => message;
}
