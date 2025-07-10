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

// ---------------- Task 4: Паралельне виконання Future (Future.wait) ---------------------
Future<void> runTask4() async {
  final stopwatch = Stopwatch()..start();

  // запускаємо обидва майбутніх одночасно
  final results = await Future.wait([
    fetchName(),
    fetchAge(),
  ]);

  final name = results[0];
  final age = results[1];

  print('Мене звати $name');
  print('Мені $age');

  stopwatch.stop();
  print('Час виконання паралельно: ${stopwatch.elapsed.inMilliseconds} мс');
}
// ---------------- Task 5: Зворотний відлік з затримкою ---------------------
Future<String> delayedCountdown(int seconds) async {
  for (int i = seconds; i > 0; i--) {
    print('$i...');
    await Future.delayed(Duration(seconds: 1));
  }
  return 'Старт!';
}
Future<void> runTask5() async {
  final message = await delayedCountdown(3);
  print(message);
}
void main() async {
  await runTask5();
}
