import 'package:calculator_app/helper/calculator_logic.dart';
import 'package:calculator_app/helper/digit_limit_dialog.dart';
import 'package:calculator_app/helper/history_dialog.dart';
import 'package:calculator_app/widgets/custom_button.dart';
import 'package:calculator_app/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _expression = '';
  String _history = '';
  bool _bracketOpen = false;
  List<String> calculationHistory = [];

  void _onButtonPress(String text) {
    setState(
      () {
        if (text == 'C') {
          _expression = '';
          _history = '';
        } else if (text == '()') {
          _expression += _bracketOpen ? ')' : '(';
          _bracketOpen = !_bracketOpen;
        } else if (text == '±') {
          _expression = toggleSign(_expression);
        } else if (text == '=') {
          _evaluateExpression();
        } else {
          if (_expression.length + text.length > 15) {
            showDigitLimitExceededDialog(context);
          } else {
            _expression += text;
          }
        }
      },
    );
  }

  void _evaluateExpression() {
    String result = evaluateExpression(_expression, (error) {
      setState(() {
        _expression = error;
      });
    });

    if (result != 'Error') {
      setState(() {
        _history = _expression;
        calculationHistory.add('$_history = $result');
        _expression = result;
      });
    }
  }

  void _onBackspace() {
    setState(() {
      if (_expression.isNotEmpty) {
        _expression = _expression.substring(0, _expression.length - 1);
      }
    });
  }

  void _onHistory() {
    showHistoryDialog(context, calculationHistory);
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color backgroundColorOperator =
        isDarkMode ? const Color(0xff8b6642) : const Color(0xffd2a377);
    Color backgroundColorNumber =
        isDarkMode ? const Color(0xff7c6c5a) : const Color(0xfff4dfc8);
    Color backgroundColorFunction = isDarkMode ? Colors.red : Colors.redAccent;

    return Column(
      children: [
        const SizedBox(height: 50),
        CustomContainer(
          result: _expression.isNotEmpty ? _expression : ' ',
          expression: _history, // عرض التاريخ
          onBackspace: _onBackspace, // تمرير الوظيفة الجديدة لمسح آخر حرف
          onHistory: _onHistory,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            padding: const EdgeInsets.only(top: 30),
            children: [
              CustomButton(
                text: 'C',
                backgroundColor: backgroundColorFunction,
                onTap: () => _onButtonPress('C'),
              ),
              CustomButton(
                text: '()',
                backgroundColor: backgroundColorOperator,
                onTap: () => _onButtonPress('()'),
              ),
              CustomButton(
                text: '%',
                backgroundColor: backgroundColorOperator,
                onTap: () => _onButtonPress('%'),
              ),
              CustomButton(
                text: '÷',
                backgroundColor: backgroundColorOperator,
                onTap: () => _onButtonPress('÷'),
              ),
              CustomButton(
                text: '7',
                backgroundColor: backgroundColorNumber,
                onTap: () => _onButtonPress('7'),
              ),
              CustomButton(
                text: '8',
                backgroundColor: backgroundColorNumber,
                onTap: () => _onButtonPress('8'),
              ),
              CustomButton(
                text: '9',
                backgroundColor: backgroundColorNumber,
                onTap: () => _onButtonPress('9'),
              ),
              CustomButton(
                text: '×',
                backgroundColor: backgroundColorOperator,
                onTap: () => _onButtonPress('×'),
              ),
              CustomButton(
                text: '4',
                backgroundColor: backgroundColorNumber,
                onTap: () => _onButtonPress('4'),
              ),
              CustomButton(
                text: '5',
                backgroundColor: backgroundColorNumber,
                onTap: () => _onButtonPress('5'),
              ),
              CustomButton(
                text: '6',
                backgroundColor: backgroundColorNumber,
                onTap: () => _onButtonPress('6'),
              ),
              CustomButton(
                text: '−',
                backgroundColor: backgroundColorOperator,
                onTap: () => _onButtonPress('−'),
              ),
              CustomButton(
                text: '1',
                backgroundColor: backgroundColorNumber,
                onTap: () => _onButtonPress('1'),
              ),
              CustomButton(
                text: '2',
                backgroundColor: backgroundColorNumber,
                onTap: () => _onButtonPress('2'),
              ),
              CustomButton(
                text: '3',
                backgroundColor: backgroundColorNumber,
                onTap: () => _onButtonPress('3'),
              ),
              CustomButton(
                text: '+',
                backgroundColor: backgroundColorOperator,
                onTap: () => _onButtonPress('+'),
              ),
              CustomButton(
                text: '.',
                backgroundColor: backgroundColorNumber,
                onTap: () => _onButtonPress('.'),
              ),
              CustomButton(
                text: '0',
                backgroundColor: backgroundColorNumber,
                onTap: () => _onButtonPress('0'),
              ),
              CustomButton(
                text: '±',
                backgroundColor: backgroundColorNumber,
                onTap: () => _onButtonPress('±'),
              ),
              CustomButton(
                text: '=',
                backgroundColor: const Color(0xffa67c30),
                onTap: () => _onButtonPress('='),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButton(String text, Color backgroundColor) {
    return CustomButton(
      text: text,
      backgroundColor: backgroundColor,
      onTap: () => _onButtonPress(text),
    );
  }
}
