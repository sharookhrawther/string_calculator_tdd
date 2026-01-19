class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) return 0;

    String delimiter = ',';
    String numberSection = numbers;

    if (numbers.startsWith('//')) {
      final parts = numbers.split('\n');
      delimiter = parts[0].substring(2);
      numberSection = parts[1];
    }

    numberSection = numberSection.replaceAll('\n', delimiter);

    final parts = numberSection.split(delimiter);
    return parts.map(int.parse).reduce((a, b) => a + b);
  }
}
