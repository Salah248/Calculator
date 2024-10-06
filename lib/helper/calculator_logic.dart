import 'package:math_expressions/math_expressions.dart';
import 'package:intl/intl.dart';

String evaluateExpression(String expression, void Function(String) onError) {
  try {
    Parser parser = Parser();
    Expression exp = parser.parse(expression
        .replaceAll('×', '*')
        .replaceAll('÷', '/')
        .replaceAll('−', '-'));
    ContextModel cm = ContextModel();
    double result = exp.evaluate(EvaluationType.REAL, cm);

    NumberFormat formatter = NumberFormat('#,##0.##');
    return result == result.toInt()
        ? formatter.format(result.toInt())
        : formatter.format(result);
  } catch (e) {
    onError('Error');
    return 'Error';
  }
}

String toggleSign(String expression) {
  if (expression.startsWith('-')) {
    return expression.substring(1);
  } else {
    return '-$expression';
  }
}
