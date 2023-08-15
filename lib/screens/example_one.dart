import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/example_one_provider.dart';


class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({Key? key}) : super(key: key);

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example One'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: ( context, value,  child) {
            return Slider(
                max: 1,
                min: 0,
                value: value.value, onChanged: (val){
              provider.setValue(val);
            });
          },

          ),


          Consumer<ExampleOneProvider>(
            builder: ( context, value,  child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.red.withOpacity(value.value),
                      child: const Center(
                        child: Text('Container 1'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      color: Colors.green.withOpacity(value.value),
                      child: const Center(
                        child: Text('Container 1'),
                      ),
                    ),
                  ),
                ],
              );
            },

          ),
        ],
      ),
    );
  }
}
