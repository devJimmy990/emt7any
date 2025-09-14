extension StringExtension on String {
  String capitalize() =>
      split(" ").map((e) => e[0].toUpperCase() + e.substring(1)).join(" ");

  String capitalizeFirst() =>
      this[0].toUpperCase() + substring(1).toLowerCase();
}
