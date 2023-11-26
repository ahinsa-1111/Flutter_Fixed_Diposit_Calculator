import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  TextEditingController _controller3 = new TextEditingController();

  double interest = 0;
  double total = 0;

  //_controller1.text is Amount
  //_controller2.text is Interest Rate
  //_controller3.text is Period

  void calculation() {
    // ignore: unused_local_variable
    final calinterestrate = (double.parse(_controller2.text) / 100 / 12) *
        int.parse(_controller3.text);
    final calinterest = calinterestrate * int.parse(_controller1.text);
    setState(() {
      interest = calinterest;
      total = interest + int.parse(_controller1.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.notes,
            size: 30,
            color: Colors.white,
          ),
          toolbarHeight: 30,
          backgroundColor: Colors.blue,
          elevation: 0,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.info,
                size: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: body());
  }

  Widget body() {
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Container(
            height: 120,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Fixed Diposit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Calculator",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 40, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                inputForm(
                    title: "Deposit Amount :",
                    controller: _controller1,
                    hinttext: "e.g 20000"),
                inputForm(
                    title: "Annual Interest Rate(%) :",
                    controller: _controller2,
                    hinttext: "e.g 3"),
                inputForm(
                    title: "Period (in months):",
                    controller: _controller3,
                    hinttext: "e.g 3"),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    calculation();
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(
                        25,
                      ),
                    ),
                    child: const Center(
                      child: Text("CALCULATE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // ignore: unnecessary_null_comparison
                interest != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Result :",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "Interest : Rs." + interest.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "Total : Rs." + total.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget inputForm(
      {required String title,
      required TextEditingController controller,
      required String hinttext}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                hintText: hinttext),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}