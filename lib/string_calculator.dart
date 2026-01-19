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

    final nums = numberSection.split(delimiter).map(int.parse).toList();
    final negatives = nums.where((n) => n < 0).toList();

    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negatives.join(",")}');
    }

    return nums.reduce((a, b) => a + b);
  }
}
