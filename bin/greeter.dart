import 'dart:io';

void main() {
  final firstName = getString('Gib Deinen Namen: ');
  final lastName = getString("Gib deinen Nachname: ");

  int? age;
  while (age == null) {
    stdout.write("Dein Alter: ");
    String? inputAge = stdin.readLineSync();

    int? parsed = int.tryParse(inputAge ?? "");
    if (parsed != null && parsed >= 0 && parsed <= 150) {
      age = parsed;
    } else {
      print("Gib dein Alter. Zwischen 0 und 150.");
    }
  }

  String? gender;
  while (gender == null) {
    stdout.write("Gib dein Geschlecnt (m/w/d): ");
    String? g = stdin.readLineSync();

    if (g == "m" || g == "w" || g == "d") {
      gender = g;
    } else {
      print("Falsche Angabe. Verfügbar: m, w, d.");
    }
  }

  String anrede;
  if (gender == "m") {
    anrede = "Herr";
  } else if (gender == "w") {
    anrede = "Frau";
  } else {
    anrede = "";
  }

  if (age < 40) {
    print("Hallo, $firstName!");
  } else {
    int hour = DateTime.now().hour;
    String greeting;

    if (hour < 12) {
      greeting = "Guten Morgen";
    } else if (hour < 18) {
      greeting = "Guten Tag";
    } else {
      greeting = "Guten Abend";
    }

    print("$greeting, $anrede $lastName");
  }
}

String getString(String prompt) {
  String? result;
  while (result == null || result.trim().isEmpty) {
    stdout.write(prompt);
    result = stdin.readLineSync();
  }
  return result;
}
