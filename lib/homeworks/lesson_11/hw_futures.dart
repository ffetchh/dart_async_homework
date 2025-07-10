import 'dart:async';

// ---------------- Task 2: Асинхронне отримання імені ---------------------
Future<String> fetchName() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Влад'; // ← заміни на своє ім’я
}

// ---------------- Task 2: Асинхронне отримання віку ---------------------

Future<String> fetchAge() async {
  await Future.delayed(Duration(milliseconds: 1500));
  int age = 25;

  String suffix;
  if (age % 10 == 1 && age % 100 != 11) {
    suffix = 'рік';
  } else if ([2, 3, 4].contains(age % 10) && !(age % 100 >= 12 && age % 100 <= 14)) {
    suffix = 'роки';
  } else {
    suffix = 'років';
  }

  return '$age $suffix';
}
// ---------------- Task 3: Послідовне виконання Future ---------------------
Future<void> runTask3() async {
  final stopwatch = Stopwatch()..start(); // запускаємо таймер

  final name = await fetchName();
  print('Мене звати $name');

  final age = await fetchAge();
  print('Мені $age');

  stopwatch.stop(); // зупиняємо таймер

  print('Час виконання: ${stopwatch.elapsed.inMilliseconds} мс');
}

// ---------------- MAIN ---------------------

void main() async {
  await runTask3();
}