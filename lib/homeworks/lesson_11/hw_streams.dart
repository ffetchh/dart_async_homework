import 'dart:async';

Future<void> runTask6() async {
  // ---------------- Task 6: Stream.fromIterable ---------------------

  final numbers = [1, 2, 3, 4, 5];
  final stream = Stream<int>.fromIterable(numbers);

  print('--- Вивід через await for ---');
  await for (final number in stream) {
    print('await for: $number');
  }

  // Створюємо стрім знову, бо попередній уже завершився
  final stream2 = Stream<int>.fromIterable(numbers);

  print('--- Вивід через listen ---');
  stream2.listen((number) {
    print('listen: $number');
  });
}

void main() async {
  await runTask6();
}