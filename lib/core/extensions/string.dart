extension StringExtension on String {
  String capitalize() =>
      split(" ").map((e) => e[0].toUpperCase() + e.substring(1)).join(" ");

  String capitalizeFirst() =>
      this[0].toUpperCase() + substring(1).toLowerCase();

  String firstChars() => split(" ").map((e) => e[0].toUpperCase()).join(" ");

  String first() => split(" ")[0];

  String toArabicNumbers() {
    const arabicDigits = ["٠", "١", "٢", "٣", "٤", "٥", "٦", "٧", "٨", "٩"];
    final western = toString();
    return western.split("").map((ch) {
      if (RegExp(r'\d').hasMatch(ch)) {
        return arabicDigits[int.parse(ch)];
      }
      return ch;
    }).join();
  }
}
