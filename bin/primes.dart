import 'dart:io';

void main() {
  List<int> primes = [];

  stdout.write('Geben Sie eine positive Zahl ein (von 2-100): ');
  String? input = stdin.readLineSync();
  int? inZahl = int.tryParse(input ?? '') ?? 0;

  if (inZahl < 2 || inZahl > 100) {
    print('Ungültige Eingabe! Bitte eine Zahl zwischen 2 und 100 eingeben.');
    return;
  }

  for (int i = 2; i <= inZahl; i++) {
    if (isPrime(i)) {
      primes.add(i);
    }
  }

  print('Primzahlen bis $inZahl: ${primes.join('- ')}');
}

bool isPrime(int number) {
  if (number < 2) return false; // proof

  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}
