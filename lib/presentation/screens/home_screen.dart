import 'package:flutter/material.dart';
import 'package:second_homework/logic/metric_converter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _enteredNumber = 0;
  String? _fromMetric;
  String? _toMetric;
  String _result = "";
  FocusNode _focusNode = FocusNode();
  TextEditingController _textEditingController = TextEditingController();

  final List<String> _metrics = [
    'cm',
    'm',
    'km',
  ];
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Listener(
        // onPointerDown: (_) => _focusNode.unfocus(),
        child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Metrics Converter',
            style: TextStyle(
                fontSize: 23, fontWeight: FontWeight.bold, color: Colors.blue),
          )),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Number:',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                      SizedBox(
                        height: 50,
                        width: 120,
                        child: Center(
                          child: TextField(
                            textAlign: TextAlign.center,
                            focusNode: _focusNode,
                            controller: _textEditingController,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.white,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10.0),
                              filled: true,
                              fillColor: Colors.blue,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(35)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(35)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(35)),
                            ),
                            onChanged: (text) {
                              setState(() {
                                var number = double.tryParse(text);
                                if (number != null) {
                                  _enteredNumber = number;
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: deviceSize.height * 0.4,
                        decoration: ShapeDecoration(
                          color: Colors.blue.shade100,
                          shape: const CircleBorder(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'From:',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(35),
                                      color: Colors.white),
                                  width: 100,
                                  height: 60,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      selectedItemBuilder: (_) => _metrics
                                          .map((e) => Center(child: Text(e)))
                                          .toList(),
                                      iconEnabledColor: Colors.white,
                                      value: _fromMetric,
                                      borderRadius: BorderRadius.circular(35),
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 18),
                                      items: _metrics
                                          .map((e) => DropdownMenuItem<String>(
                                                value: e,
                                                child: Text(
                                                  e,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (dynamic value) {
                                        setState(() {
                                          _fromMetric = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('To:',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 30)),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(35),
                                      color: Colors.white),
                                  width: 100,
                                  height: 60,
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      selectedItemBuilder: (_) => _metrics
                                          .map((e) => Center(child: Text(e)))
                                          .toList(),
                                      iconEnabledColor: Colors.white,
                                      value: _toMetric,
                                      borderRadius: BorderRadius.circular(35),
                                      style: const TextStyle(
                                          color: Colors.blue, fontSize: 18),
                                      items: _metrics
                                          .map((e) => DropdownMenuItem<String>(
                                                value: e,
                                                child: Text(
                                                  e,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (dynamic value) {
                                        setState(() {
                                          _toMetric = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Result:",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 150,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(35),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                _result,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                      ),
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text('CONVERSION'),
                        onPressed: () {
                          if (_enteredNumber == null ||
                              _fromMetric == null ||
                              _toMetric == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('please fill in all given fields')),
                            );
                          } else {
                            setState(() {
                              _result = MetricConverter()
                                  .convert(
                                      _enteredNumber, _fromMetric, _toMetric)
                                  .toString();
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                      ),
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: const Text('RESET'),
                        onPressed: () {
                          setState(() {
                            _focusNode.unfocus();
                            _textEditingController.clear();
                            _enteredNumber = 0;
                            _fromMetric = null;
                            _toMetric = null;
                            _result = "";
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
