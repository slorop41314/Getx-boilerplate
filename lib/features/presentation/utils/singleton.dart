class ExampleSingleton {
  static ExampleSingleton? instance;

  ExampleSingleton._() {}

  factory ExampleSingleton() => instance ??= ExampleSingleton();
}
