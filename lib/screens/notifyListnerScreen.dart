import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class NotifyListnerScreen extends StatelessWidget {
   NotifyListnerScreen({Key? key}) : super(key: key);
   ValueNotifier<int> _counter = ValueNotifier<int>(0);
   ValueNotifier<bool> toggle = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('blah blah blah'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: toggle,
              builder: ( context, value,  child) {
                return TextFormField(
                  obscureText: toggle.value,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffix: InkWell(
                        onTap: (){
                          toggle.value = !toggle.value;
                        },
                        child: Icon(toggle.value? Icons.visibility_off : Icons.visibility)),
                  ),
                );
              },

            ),

            Center(child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: ( context, value,  child) {
                return Text(_counter.value.toString(),style: TextStyle(fontSize: 50),);
              },

            ),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _counter.value++;
          print(_counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
