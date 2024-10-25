extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
  String capitalize() {
    if (isNullOrEmpty()) return '';
    return this!.split(' ').map(
      (word) {
        if (word.isEmpty) return word;
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      },
    ).join(' ');
  }
}
