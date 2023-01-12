import 'package:flutter/material.dart';
import 'package:lab05/pages/subpage.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

int isRadio = 3;
bool isCheck = false;

class _InputPageState extends State<InputPage> {
  final GlobalKey<FormState> _formKey = GlobalKey(); //form เก็บสถานะของform

  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();

  String isRadio = "";
  bool isCheck = false;
  double? _bmi;
  String _message = "test";

  List<Fruit> fruits = [];

  void _calculate() {
    final double height = double.parse(_height.value.text) / 100;
    final double weight = double.parse(_weight.value.text);

    // Check if the inputs are valid
    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _message = "Your height and weigh must be positive numbers";
      });
      return;
    }
    setState(() {
      _bmi = weight / (height * height);
      if (_bmi! < 18.5) {
        _message = "You are underweight";
      } else if (_bmi! < 25) {
        _message = 'You body is fine';
      } else if (_bmi! < 30) {
        _message = 'You are overweight';
      } else {
        _message = 'You are obese';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fruits = Fruit.getFruit();
    print(fruits[0].engName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input"),
      ),
      body: Center(
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                // const Text("เก็บข้อมูลส่วนสูง (เซนติเมตร)"),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.height),
                    labelText: 'INPUT YOUR HEIGHT',
                    hintText: 'Enter Height',
                    suffixText: ("cm"),
                    filled: true,
                    fillColor: Colors.grey[300],
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  controller: _height, //เรียกตัวคอนโทรลจากที่ประกาศด้านบน
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                // Text("เก็บข้อมูลน้ำหนัก (กิโลกรัม)"),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.line_weight),
                    labelText: 'INPUT YOUR WEIGHT',
                    hintText: 'Enter Weight',
                    suffixText: ("kg"),
                    filled: true,
                    fillColor: Colors.grey[300],
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  controller: _weight, //เรียกตัวคอนโทรลจากที่ประกาศด้านบน
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),

                ElevatedButton(
                  onPressed: _calculate,
                  child: const Text('Calculate'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  _bmi == null ? 'No Result' : _bmi!.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  _message,
                  textAlign: TextAlign.center,
                ),

                // Text("Height: ${_height.text}"),
                // Text("Weight: ${_weight.text}"),
                ElevatedButton(
                  child: Text('Go to next page.'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Secondpage(
                          bmi: _bmi,
                          msg: _message,
                        ),
                      ),
                    );
                  },
                ),
///////////////////////////////////////////////////////////////

                RadioListTile(
                  title: Text('male'),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: 'male',
                  activeColor: Colors.black,
                  groupValue: isRadio,
                  onChanged: (value) {
                    setState(() {
                      isRadio = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('female'),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: 'female',
                  activeColor: Colors.black,
                  groupValue: isRadio,
                  onChanged: (value) {
                    setState(() {
                      isRadio = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('other (LGBT+)'),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: 'other',
                  activeColor: Colors.black,
                  groupValue: isRadio,
                  onChanged: (value) {
                    setState(() {
                      isRadio = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: Text('not specify'),
                  controlAffinity: ListTileControlAffinity.platform,
                  value: 'not specify',
                  activeColor: Colors.black,
                  groupValue: isRadio,
                  onChanged: (value) {
                    setState(() {
                      isRadio = value!;
                    });
                  },
                ),
                const Text("ผลไม้"),
                Column(children: createFruitCheckbox()),
              ],
            )),
      ),
    );
  }

  List<Widget> createFruitCheckbox() {
    List<Widget> myfruit = [];

    for (Fruit fruit in fruits) {
      // print(fruit.thNaRme);
      myfruit.add(
        CheckboxListTile(
          title: Text(fruit.thName),
          value: fruit.isCheck,
          onChanged: (value) {
            setState(() {
              fruit.isCheck = value!;
            });
          },
        ),
      );
    }

    return myfruit;
  }

///////////////////////////////////////////////////////////////

}

//632021117 Chanawee Wanasuwanich

class Fruit {
  String engName;
  String thName;
  bool isCheck;

  Fruit(this.engName, this.thName, this.isCheck);

  static List<Fruit> getFruit() {
    return <Fruit>[
      Fruit("1", "แอปเปิ้ล", false),
      Fruit("2", "มะละกอ", false),
      Fruit("3", "กล้วย", true),
      Fruit("4", "ส้ม", false),
      Fruit("5", "มะพร้าว", false),
    ];
  }
}
