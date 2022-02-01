import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Life Simulation Project';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    String passwordKeeper = "";
    bool? isChecked = false;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('please enter your username'),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Text('please enter your password'),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value1) {
              if (value1 == null || value1.isEmpty) {
                return 'Please enter some text';
              }
              passwordKeeper = value1;
              return null;
            },
          ),
          Text('please re enter your password'),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty ) {
                return 'Please enter some text';
              }
              else if(value != passwordKeeper)
                {
                  return "password and the re-enter value doesn't match";
                }
              return null;
            },
          ),
          Center(
            child: Checkbox(value: isChecked, onChanged: (value){
              setState(() {
                isChecked = value!;
              });
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // todo
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>
                    SecondRoot())
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Login'),
            ),

          ),

        ], //Objects in form
      ),
    );
  }
}

class SecondRoot extends StatelessWidget {
  const SecondRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var money = 10000;
    var population = 0;
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(money.toString()),
                Icon(
                  Icons.attach_money, color: Colors.pink,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(population.toString()),
                Icon(Icons.family_restroom
                , color: Colors.pink,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){}, child: Text("Pass year"),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.red)
                )
                  ,)
              ],
            ),
          ],
        )
      ),
    );
  }
}

