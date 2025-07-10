import 'dart:async';

/// Task 1: Асинхронне отримання імені
Future<String> fetchName() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Влад'; // ← заміни на своє ім’я
}

void main() async {
  final name = await fetchName();
  print('Мене звати $name');
}