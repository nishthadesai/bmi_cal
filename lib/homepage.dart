import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var inchcontroller = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "BMI Calculator",
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
              ),
            ),
          ),
          leading: Container(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/bmi.jpg'),
          )),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/bg1.png"), fit: BoxFit.cover)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                    child: Column(children: [
                  TextFormField(
                    style: const TextStyle(color: Colors.red, fontSize: 30),
                    controller: wtcontroller,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyanAccent)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyanAccent)),
                      label: Text(
                        "Enter Weight(kg):",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    cursorHeight: 20,
                    cursorColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.red, fontSize: 30),
                    controller: ftcontroller,
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyanAccent)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyanAccent)),
                      label: Text(
                        "Height(Feet):",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    cursorHeight: 20,
                    cursorColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.red, fontSize: 30),
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyanAccent)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyanAccent)),
                      label: Text(
                        "Height(Inch):",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    controller: inchcontroller,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    cursorHeight: 20,
                    cursorColor: Colors.white,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.cyanAccent),
                      onPressed: () {
                        var wt = wtcontroller.text.toString();
                        var ft = ftcontroller.text.toString();
                        var inch = inchcontroller.text.toString();
                        if (wt != "" && ft != "" && inch != "") {
                          setState(() {
                            var iwt = int.parse(wt);
                            var ift = int.parse(ft);
                            var iinch = int.parse(inch);
                            var tinch = (ift * 12) + iinch;
                            var tcm = tinch * 2.54;
                            var tm = tcm / 100;
                            var bmi = iwt / (tm * tm);
                            var msg = "";
                            if (bmi > 25) {
                              msg = "You are Over Weight!!!";
                            } else if (bmi < 18) {
                              msg = "You are Under Weight!!!";
                            } else {
                              msg = "You are Healthy";
                            }
                            setState(() {
                              result =
                                  "$msg \n \n Your BMI is: ${bmi.toStringAsFixed(2)}";
                            });
                          });
                        } else {
                          setState(() {
                            result = "First Please fill all data!!!";
                          });
                        }
                      },
                      child: const Text(
                        "Calculate",
                        style: TextStyle(fontSize: 28, color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    result,
                    style: const TextStyle(fontSize: 30, color: Colors.teal),
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            child: const Text(
                                '*If BMI<18 than You are Underweight',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white))),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          child: const Text(
                              '*If BMI>25 than You are Overweight',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          child: const Text(
                              '*If BMI is between 18 to 25 than You are Healthy',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white))),
                    ],
                  ),
                ])),
              ),
            ),
          ),
        ));
  }
}
