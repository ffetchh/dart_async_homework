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

Future<void> runTask7() async {
  // ---------------- Task 7: Зворотний відлік зі стріму (periodic) ---------------------

  final countdownStream = Stream<int>.periodic(
    Duration(seconds: 1),
    (i) => i + 1,
  ).take(10); // обмежуємо до 10 значень

  print('--- Task 7: Відлік ---');
  await for (final number in countdownStream) {
    print('$number...');
  }
}
void main() async {
  await runTask7();
}
