import 'package:flutter/material.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();

}

class _SettingsState extends State<Settings> {

  int sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: ListView(
          children: [
            Slider(
              value: sliderValue.toDouble(),
              onChanged: (double value) {
                setState(() {
                  sliderValue = value.toInt();
                  print(value);
                });
              },
              min: 0,
              max: 100,
              divisions: 100,
              label: '$sliderValue',
            ),
            Text('Slider value: $sliderValue'),
            Padding(
              padding: EdgeInsets.all(sliderValue.toDouble()),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name',
                ),
              ),
             ),
             Container(
              height: 50,
              color: Colors.red,
             ),
             GridPaper(
               divisions: 5,
               subdivisions: 5,
               color: Colors.black,
               interval: 50,
               child: Container(
                height: 250,
                width: 250,
                color: Color.fromARGB(255, 240, 164, 94),
               ),
             ),
             const Spacer(),
             Radio(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: 20,
              groupValue: sliderValue,
              onChanged: (value) {
              setState(() {
                sliderValue = value as int;
                });
              },
              toggleable: true,
              activeColor: Colors.green,

             ),
             Radio(
                value: 2,
                groupValue: sliderValue,
                onChanged: (value) => setState(() => sliderValue = value as int),
              ),
              Radio(
                value: 3,
                groupValue: sliderValue,
                onChanged: (value) => setState(() => sliderValue = value as int),
              ),],
        )
      ),
    );
  }
}