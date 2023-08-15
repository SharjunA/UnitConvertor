import 'package:flutter/material.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UnitConverterScreen(),
    );
  }
}

class UnitConverterScreen extends StatefulWidget {
  @override
  _UnitConverterScreenState createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  double inputValue = 0.0;
  double convertedValue = 0.0;
  String fromUnit = 'meters';
  String toUnit = 'centimeters';

  Map<String, double> conversionFactors = {
    'meters': 1,
    'decimeters': 10,
    'centimeters': 100,
    'millimeters': 1000,
    'kilometers': 0.001,
    'inches': 39.3701,
    'feet': 3.28084,
    'yards': 1.09361,
    'grams': 1,
    'decagrams': 0.1,
    'kilograms': 0.001,
    'pounds': 0.00220462,
  };

  void convertUnits() {
    setState(() {
      convertedValue = inputValue *
          (conversionFactors[fromUnit]! / conversionFactors[toUnit]!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    inputValue = double.tryParse(value) ?? 0.0;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Enter value to convert',
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton<String>(
                    value: fromUnit,
                    onChanged: (String? newValue) {
                      setState(() {
                        fromUnit = newValue!;
                      });
                    },
                    items: conversionFactors.keys
                        .map<DropdownMenuItem<String>>((String unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                  ),
                  SizedBox(width: 20),
                  Text('to'),
                  SizedBox(width: 20),
                  DropdownButton<String>(
                    value: toUnit,
                    onChanged: (String? newValue) {
                      setState(() {
                        toUnit = newValue!;
                      });
                    },
                    items: conversionFactors.keys
                        .map<DropdownMenuItem<String>>((String unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: convertUnits,
                child: Text('Convert'),
              ),
              SizedBox(height: 20),
              Text(
                'Converted Value:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$convertedValue',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
