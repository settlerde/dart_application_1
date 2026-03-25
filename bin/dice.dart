import 'dart:io';
import 'dart:math';

void main() {
  // Initialisierung
  final Random random = Random();
  List<int> results = [];
  int? maxRolls;
  int lastRoll = 0;
  bool doubleSix = false;

  // Eingabe mit Gültigkeitsprüfung
  do {
    stdout.write('Geben Sie die Anzahl der Würfe ein (positive Zahl): ');
    String? input = stdin.readLineSync();

    maxRolls = int.tryParse(input ?? '');

    if (maxRolls == null || maxRolls <= 0) {
      print('Ungültige Eingabe! Bitte eine Zahl größer als 0 eingeben.');
    }
  } while (maxRolls == null || maxRolls <= 0);

  // Hauptschleife
  int counter = 0;
  while (counter < maxRolls && !doubleSix) {
    // + 1 (start point 0+1=1) weil random von 0 zählt
    int currentRoll = random.nextInt(6) + 1;
    results.add(currentRoll);
    counter++;

    if (currentRoll == 6 && lastRoll == 6) {
      doubleSix = true;
    } else {
      lastRoll = currentRoll; // lastRoll wird in Liste gespeichert
    }
  }
  // Ergebnisausgabe
  String resultsNice = results.join(' - ');
  print('\n--- Ergebnis ---');

  if (doubleSix) {
    print('Erfolg! Zwei 6 nacheinander gewürfelt.');
    print('Benötigte Würfe: $counter');
  } else {
    print('Limit erreicht. Keine zwei 6 nacheinander dabei.');
  }

  print('Alle gewürfelten Werte: $resultsNice');
}
