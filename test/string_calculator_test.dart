import 'package:string_calculator_tdd_final/string_calculator.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final calculator = StringCalculator();

  test('empty string returns 0', () {
    expect(calculator.add(''), 0);
  });

  test('single number returns its value', () {
    expect(calculator.add('1'), 1);
  });
  test('two comma separated numbers return sum', () {
    expect(calculator.add('1,5'), 6);
  });

  test('multiple comma separated numbers return sum', () {
    expect(calculator.add('1,2,3,4'), 10);
  });
  test('numbers separated by newline and comma return sum', () {
    expect(calculator.add('1\n2,3'), 6);
  });
  test('custom delimiter support', () {
    expect(calculator.add('//;\n1;2'), 3);
  });
  test('negative numbers throw exception with values', () {
    expect(
      () => calculator.add('1,-2,3,-5'),
      throwsA(
        predicate(
            (e) => e.toString().contains('negative numbers not allowed -2,-5')),
      ),
    );
  });
}
