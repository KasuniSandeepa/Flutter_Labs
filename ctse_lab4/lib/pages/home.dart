import 'package:ctse_lab4/services/agify.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final AgifyService _agifyService;

  static String routeName = '/';

  const Home({Key? key})
      : _agifyService = const AgifyService(),
        super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  int? _age;

  void onSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final calculateAge = await widget._agifyService.getAgeFromName(_name!);

      setState(() {
        _age = calculateAge;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agify"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Form(
            key: _formKey,
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        helperText: 'Name',
                        labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter the Name';
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      setState(() {
                        if (value != null) _name = value;
                      });
                    },
                  )),
              ElevatedButton(onPressed: onSubmit, child: Text("Get Age")),
              const SizedBox(
                height: 10,
              )
            ]),
          ),
          if (_age != null)
            Center(
              child: Text(
                'Age is $_age',
                style: Theme.of(context).textTheme.headline5,
              ),
            )
        ],
      ),
    );
  }
}
