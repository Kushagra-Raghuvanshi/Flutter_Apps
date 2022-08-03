import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math';

class Frame extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FrameState();
  }
}

class _FrameState extends State<Frame> {
  var curr = "0";
  var next = "";
  var operator = "";

  void updateNum(int num) {
    setState(() {
      if (curr == "0") {
        curr = num.toString();
      } else if (operator != "") {
        next += num.toString();
      } else {
        curr += num.toString();
      }
    });
  }

  void reset() {
    setState(() {
      curr = "0";
      operator = "";
      next = "";
    });
  }

  void delete() {
    setState(() {
      if (curr.length == 1 && operator == "") {
        curr = "0";
        operator = "";
        next = "";
      } else if (operator != "" && next.length == 0) {
        operator = "";
      } else if (operator != "" && next.length == 1) {
        next = "";
      } else if (operator != "" && next.length != 1) {
        next = next.substring(0, next.length - 1);
      } else {
        curr = curr.substring(0, curr.length - 1);
      }
    });
  }

  void point() {
    setState(() {
      if (curr.contains(".") && operator == "" && next == "") {
        curr = curr;
      } else if (next.contains(".")) {
        next = next;
      } else if (operator != "") {
        next = "$next.";
      } else {
        curr = "$curr.";
      }
    });
  }

  void plus() {
    setState(() {
      if (next == ".") {
        next = "0";
      }
      if (next != "") {
        compute();
        operator = "+";
      }
      if (operator != "" && next == "") {
      } else if ("0123456789.".contains(curr[curr.length - 1])) {
        operator = "+";
      } else {
        curr = curr;
      }
      if (curr.length > 1 &&
          curr.substring(curr.length - 2, curr.length) == ".0") {
        curr = curr.substring(0, curr.length - 2);
      }
      if (next.length > 1 &&
          next.substring(next.length - 2, next.length) == ".0") {
        next = next.substring(0, next.length - 2);
      }
    });
  }

  void minus() {
    setState(() {
      if (next == ".") {
        next = "0";
      }
      if (next != "") {
        compute();
        operator = "-";
      }
      if (operator != "" && next == "") {
        if (operator == "*" || operator == "/") {
          next = "-";
        } else {}
      } else if ("0123456789.".contains(curr[curr.length - 1])) {
        operator = "-";
      } else {
        curr = curr;
      }
      if (curr.length > 1 &&
          curr.substring(curr.length - 2, curr.length) == ".0") {
        curr = curr.substring(0, curr.length - 2);
      }
      if (next.length > 1 &&
          next.substring(next.length - 2, next.length) == ".0") {
        next = next.substring(0, next.length - 2);
      }
    });
  }

  void multiply() {
    setState(() {
      if (next == ".") {
        next = "0";
      }
      if (next != "") {
        compute();
        operator = "*";
      }
      if (operator != "" && next == "") {
      } else if ("0123456789.".contains(curr[curr.length - 1])) {
        operator = "*";
      } else {
        curr = curr;
      }
      if (curr.length > 1 &&
          curr.substring(curr.length - 2, curr.length) == ".0") {
        curr = curr.substring(0, curr.length - 2);
      }
      if (next.length > 1 &&
          next.substring(next.length - 2, next.length) == ".0") {
        next = next.substring(0, next.length - 2);
      }
    });
  }

  void divide() {
    setState(() {
      if (next == ".") {
        next = "0";
      }
      if (next != "") {
        compute();
        operator = "/";
      }
      if (operator != "" && next == "") {
      } else if ("0123456789.".contains(curr[curr.length - 1])) {
        operator = "/";
      } else {
        curr = curr;
      }
      if (curr.length > 1 &&
          curr.substring(curr.length - 2, curr.length) == ".0") {
        curr = curr.substring(0, curr.length - 2);
      }
      if (next.length > 1 &&
          next.substring(next.length - 2, next.length) == ".0") {
        next = next.substring(0, next.length - 2);
      }
    });
  }

  void getlog() {
    setState(() {
      if (next == ".") {
        next = "0";
      }
      if (next == "") {
        var numlog = double.parse(curr);
        curr = (log(numlog) / log(10)).toString();
        operator = "";
      } else {
        compute();
        var numlog = double.parse(curr);
        curr = (log(numlog) / log(10)).toString();
      }
      if (curr.length > 1 &&
          curr.substring(curr.length - 2, curr.length) == ".0") {
        curr = curr.substring(0, curr.length - 2);
      }
      if (next.length > 1 &&
          next.substring(next.length - 2, next.length) == ".0") {
        next = next.substring(0, next.length - 2);
      }
    });
  }

  void getsquare() {
    setState(() {
      if (next == ".") {
        next = "0";
      }
      if (next == "") {
        var numsquare = double.parse(curr);
        curr = (numsquare * numsquare).toString();
        operator = "";
      } else {
        compute();
        var numsquare = double.parse(curr);
        curr = (numsquare * numsquare).toString();
      }

      if (curr.length > 1 &&
          curr.substring(curr.length - 2, curr.length) == ".0") {
        curr = curr.substring(0, curr.length - 2);
      }
      if (next.length > 1 &&
          next.substring(next.length - 2, next.length) == ".0") {
        next = next.substring(0, next.length - 2);
      }
    });
  }

  void compute() {
    setState(() {
      if (next == ".") {
        next = "0";
      }
      if (next == "" || operator == "") {
      } else {
        var num1 = double.parse(curr);
        var num2 = double.parse(next);

        if (operator == "+") {
          curr = "${num1 + num2}";
        } else if (operator == "-") {
          curr = "${num1 - num2}";
        } else if (operator == "*") {
          curr = "${num1 * num2}";
        } else if (operator == "/") {
          curr = "${num1 / num2}";
        }

        operator = "";
        next = "";
      }
      if (curr.length > 1 &&
          curr.substring(curr.length - 2, curr.length) == ".0") {
        curr = curr.substring(0, curr.length - 2);
      }
      if (next.length > 1 &&
          next.substring(next.length - 2, next.length) == ".0") {
        next = next.substring(0, next.length - 2);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 392.727,
              height: 90,
              decoration: BoxDecoration(
                  color: Colors.grey, border: Border.all(color: Colors.black)),
              child: Text(
                curr + operator + next,
                style: TextStyle(fontSize: 36),
                textAlign: TextAlign.right,
              ),
            )
          ],
        ),
        Row(
          children: [
            InkWell(
                onTap: () => getlog(),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 59, 58, 58),
                        border: Border.all(color: Colors.white)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "log x",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))),
            InkWell(
                onTap: () => getsquare(),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 59, 58, 58),
                        border: Border.all(color: Colors.white)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "x^2",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))),
            InkWell(
                onTap: () => delete(),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 192, 92, 85),
                        border: Border.all(color: Colors.white)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Del",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))),
            InkWell(
                onTap: () => divide(),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 59, 58, 58),
                        border: Border.all(color: Colors.white)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "/",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))),
          ],
        ),
        Row(
          children: [
            InkWell(
                onTap: () => updateNum(7),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        border: Border.all(color: Colors.black)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "7",
                        style: TextStyle(color: Colors.black),
                      ),
                    ))),
            InkWell(
                onTap: () => updateNum(8),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        border: Border.all(color: Colors.black)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "8",
                        style: TextStyle(color: Colors.black),
                      ),
                    ))),
            InkWell(
                onTap: () => updateNum(9),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        border: Border.all(color: Colors.black)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "9",
                        style: TextStyle(color: Colors.black),
                      ),
                    ))),
            InkWell(
                onTap: () => multiply(),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 59, 58, 58),
                        border: Border.all(color: Colors.white)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "*",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))),
          ],
        ),
        Row(
          children: [
            InkWell(
                onTap: () => updateNum(4),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        border: Border.all(color: Colors.black)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "4",
                        style: TextStyle(color: Colors.black),
                      ),
                    ))),
            InkWell(
                onTap: () => updateNum(5),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        border: Border.all(color: Colors.black)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "5",
                        style: TextStyle(color: Colors.black),
                      ),
                    ))),
            InkWell(
                onTap: () => updateNum(6),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        border: Border.all(color: Colors.black)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "6",
                        style: TextStyle(color: Colors.black),
                      ),
                    ))),
            InkWell(
                onTap: () => minus(),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 59, 58, 58),
                        border: Border.all(color: Colors.white)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "-",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))),
          ],
        ),
        Row(
          children: [
            InkWell(
                onTap: () => updateNum(1),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        border: Border.all(color: Colors.black)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "1",
                        style: TextStyle(color: Colors.black),
                      ),
                    ))),
            InkWell(
                onTap: () => updateNum(2),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        border: Border.all(color: Colors.black)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "2",
                        style: TextStyle(color: Colors.black),
                      ),
                    ))),
            InkWell(
                onTap: () => updateNum(3),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        border: Border.all(color: Colors.black)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "3",
                        style: TextStyle(color: Colors.black),
                      ),
                    ))),
            InkWell(
                onTap: () => plus(),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 59, 58, 58),
                        border: Border.all(color: Colors.white)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "+",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))),
          ],
        ),
        Row(
          children: [
            InkWell(
                onTap: () => reset(),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 192, 92, 85),
                        border: Border.all(color: Colors.black)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "C",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))),
            InkWell(
                onTap: () => updateNum(0),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        border: Border.all(color: Colors.black)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "0",
                        style: TextStyle(color: Colors.black),
                      ),
                    ))),
            InkWell(
                onTap: () => point(),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        border: Border.all(color: Colors.black)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        ".",
                        style: TextStyle(color: Colors.black),
                      ),
                    ))),
            InkWell(
                onTap: () => compute(),
                child: Container(
                    width: 392.727 / 4,
                    height: 60.0,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 192, 92, 85),
                        border: Border.all(color: Colors.black)),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "=",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))),
          ],
        ),
      ],
    );
  }
}
