import 'dart:io';

import 'package:laufzeit_aurelien/string_color.dart';

void main(List<String> arguments) {
  int height;
  int age;
  bool isValid;
  bool endProgram = false;

  //Main Loop
  while (!endProgram) {
    height = 0;
    age = 0;
    isValid = false;

    //Loop until inputs are valid
    while (!isValid) {
      //Clear the terminal then print header
      stdout.write('\x1B[2J\x1B[0;0H');
      printHeader();

      //Ask user for inputs
      isValid = true;
      stdout.write(coloredString("• ", color: StringColor.white));
      stdout.write(coloredString(
          "Enter your height (in cm) then press Enter : ",
          color: StringColor.blue));

      final String? heightInput = stdin.readLineSync();
      height = getPositiveIntValueOf(heightInput);

      stdout.write(coloredString("• ", color: StringColor.white));
      stdout.write(coloredString("Enter your age then press Enter : ",
          color: StringColor.blue));
      final ageInput = stdin.readLineSync();
      age = getPositiveIntValueOf(ageInput);

      stdout.write("\n");

      //Check height validity
      if (height == 0) {
        isValid = false;
        stdout.write(coloredString("  ERROR : ", color: StringColor.red));
        stdout.write("Invalid height\n");
      }
      //Check age validity
      if (age == 0) {
        isValid = false;
        stdout.write(coloredString("  ERROR : ", color: StringColor.red));
        stdout.write("Invalid age\n");
      }

      //Show error if inputs are not valid
      if (!isValid) {
        stdout.write(
            "\nYour age and height must be numbers greater than 0.\nPress Enter to start again ...");
        stdin.readLineSync();
      }
    }

    //Data output
    if (height > 150) {
      stdout.write(coloredString("✔ ", color: StringColor.green));
      stdout.write(coloredString("You can go !\n", color: StringColor.white));
      if (age < 11) {
        stdout.write(coloredString("➤ ", color: StringColor.yellow));
        stdout.write(
            coloredString("But wear a helmet ...\n", color: StringColor.white));
      }
    } else {
      stdout.write(coloredString("X ", color: StringColor.red));
      stdout.write(coloredString("Sorry, but you cannot go...\n",
          color: StringColor.white));
    }

    //Try again or quit
    stdout.write(coloredString("\nPress Enter to start again or 'q' to quit : ",
        color: StringColor.grey));
    if (stdin.readLineSync()?.toLowerCase() == 'q') {
      //QUIT
      endProgram = true;
    }
  }
}

//For a given String?, return the int value or 0 if String is null, or not an Int or < 0
int getPositiveIntValueOf(String? string) {
  if (string != null) {
    final int? intValue = int.tryParse(string);
    if (intValue != null) {
      return intValue > 0 ? intValue : 0;
    }
  }
  return 0;
}

void printHeader() {
  stdout.write(
      coloredString("+-=-=-=-=-=-=-=-=-=-=-=-=-+\n|", color: StringColor.red));
  stdout.write(
      coloredString(" ★ ROLERCOASTER 3000 ! ★ ", color: StringColor.yellow));
  stdout.write(coloredString("|\n", color: StringColor.red));
  stdout.write(
      coloredString("+-=-=-=-=-=-=-=-=-=-=-=-=-+\n\n", color: StringColor.red));
}
