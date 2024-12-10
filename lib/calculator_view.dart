// import 'package:flutter/material.dart';

// void main() => runApp(const CalculatorApp());

// class CalculatorApp extends StatelessWidget {
//   const CalculatorApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Calculator App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: const CalculatorHome(),
//     );
//   }
// }

// class CalculatorHome extends StatefulWidget {
//   const CalculatorHome({super.key});

//   @override
//   _CalculatorHomeState createState() => _CalculatorHomeState();
// }

// class _CalculatorHomeState extends State<CalculatorHome> {
//   String _output = "0"; // The displayed value
//   String _currentInput = ""; // The value currently being typed
//   double _num1 = 0; // First number
//   double _num2 = 0; // Second number
//   String _operator = ""; // The operator (+, -, *, /)

//   // Function to handle button presses
//   void _buttonPressed(String value) {
//     setState(() {
//       // Clear button
//       if (value == "C") {
//         _output = "0";
//         _currentInput = "";
//         _num1 = 0;
//         _num2 = 0;
//         _operator = "";
//       }
//       // Backspace button
//       else if (value == "<-") {
//         if (_currentInput.isNotEmpty) {
//           _currentInput = _currentInput.substring(0, _currentInput.length - 1);
//           _output = _currentInput.isNotEmpty ? _currentInput : "0";
//         }
//       }
//       // Operator buttons
//       else if (value == "+" || value == "-" || value == "*" || value == "/") {
//         if (_currentInput.isNotEmpty) {
//           _num1 = double.parse(_currentInput);
//           _operator = value;
//           _currentInput = "";
//         }
//       }
//       // Equal button
//       else if (value == "=") {
//         if (_operator.isNotEmpty && _currentInput.isNotEmpty) {
//           _num2 = double.parse(_currentInput);

//           switch (_operator) {
//             case "+":
//               _output = (_num1 + _num2).toString();
//               break;
//             case "-":
//               _output = (_num1 - _num2).toString();
//               break;
//             case "*":
//               _output = (_num1 * _num2).toString();
//               break;
//             case "/":
//               _output = _num2 != 0 ? (_num1 / _num2).toString() : "Error";
//               break;
//           }

//           // Reset for next operation
//           _num1 = 0;
//           _num2 = 0;
//           _operator = "";
//           _currentInput = "";
//         }
//       }
//       // Other buttons (numbers, dot, etc.)
//       else {
//         if (_currentInput == "0") {
//           _currentInput = value;
//         } else {
//           _currentInput += value;
//         }
//         _output = _currentInput;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Calculator buttons
//     final List<String> buttons = [
//       "C",
//       "*",
//       "/",
//       "<-",
//       "7",
//       "8",
//       "9",
//       "+",
//       "4",
//       "5",
//       "6",
//       "-",
//       "1",
//       "2",
//       "3",
//       "*",
//       "%",
//       "0",
//       ".",
//       "=",
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Calculator App"),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//       ),
//       body: Column(
//         children: [
//           // Display area
//           Container(
//             padding: const EdgeInsets.all(12.0),
//             alignment: Alignment.centerRight,
//             child: Text(
//               _output,
//               style: const TextStyle(
//                 fontSize: 36.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           // Buttons grid
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4, // 4 buttons per row
//                 crossAxisSpacing: 8.0,
//                 mainAxisSpacing: 8.0,
//               ),
//               itemCount: buttons.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.all(20.0),
//                     backgroundColor: Colors.grey[300],
//                     foregroundColor: Colors.black,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   onPressed: () {
//                     _buttonPressed(buttons[index]);
//                   },
//                   child: Text(
//                     buttons[index],
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  final TextEditingController _controller =
      TextEditingController(); // Single controller for input and output
  double _num1 = 0; // First number
  double _num2 = 0; // Second number
  String _operator = ""; // The operator (+, -, *, /)

  // Function to handle button presses
  void _buttonPressed(String value) {
    setState(() {
      // Clear button
      if (value == "C") {
        _controller.text = "0";
        _num1 = 0;
        _num2 = 0;
        _operator = "";
      }
      // Backspace button
      else if (value == "<-") {
        if (_controller.text.isNotEmpty) {
          _controller.text =
              _controller.text.substring(0, _controller.text.length - 1);
          if (_controller.text.isEmpty) {
            _controller.text = "0";
          }
        }
      }
      // Operator buttons
      else if (value == "+" || value == "-" || value == "*" || value == "/") {
        if (_controller.text.isNotEmpty && _controller.text != "0") {
          _num1 = double.parse(_controller.text);
          _operator = value;
          _controller.text = "0";
        }
      }
      // Equal button
      else if (value == "=") {
        if (_operator.isNotEmpty && _controller.text.isNotEmpty) {
          _num2 = double.parse(_controller.text);

          switch (_operator) {
            case "+":
              _controller.text = (_num1 + _num2).toString();
              break;
            case "-":
              _controller.text = (_num1 - _num2).toString();
              break;
            case "*":
              _controller.text = (_num1 * _num2).toString();
              break;
            case "/":
              _controller.text =
                  _num2 != 0 ? (_num1 / _num2).toString() : "Error";
              break;
          }

          // Reset for next operation
          _num1 = 0;
          _num2 = 0;
          _operator = "";
        }
      }
      // Other buttons (numbers, dot, etc.)
      else {
        if (_controller.text == "0") {
          _controller.text = value;
        } else {
          _controller.text += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculator buttons
    final List<String> buttons = [
      "C",
      "*",
      "/",
      "<-",
      "7",
      "8",
      "9",
      "+",
      "4",
      "5",
      "6",
      "-",
      "1",
      "2",
      "3",
      "*",
      "%",
      "0",
      ".",
      "=",
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator App"),
      ),
      body: Column(
        children: [
          // Display area (using controller)
          Container(
            padding: const EdgeInsets.all(12.0),
            alignment: Alignment.centerRight,
            child: TextField(
              controller: _controller,
              enabled: false,
              style: const TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ),
          const SizedBox(height: 10),
          // Buttons grid
          Expanded(
            child: GridView.count(
              crossAxisCount: 4, // 4 buttons per row
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: buttons.map((String button) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    _buttonPressed(button);
                  },
                  child: Text(
                    button,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
