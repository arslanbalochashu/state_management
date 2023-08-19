import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/provider/favourite_provider.dart';
import 'package:state_management/screens/favourit/my_favourite_screen.dart';

class FavouritScreen extends StatefulWidget {
  const FavouritScreen({Key? key}) : super(key: key);

  @override
  State<FavouritScreen> createState() => _FavouritScreenState();
}

class _FavouritScreenState extends State<FavouritScreen> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourit App'),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavouriteScreenItem()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(width: 20,),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
                itemBuilder: (context , index){
              return Consumer<FavouriteItemProvider>(
                  builder: (context, value , child){
                return ListTile(
                  onTap: (){

                    if(value.selectedItem.contains(index)){
                      value.removeItem(index);
                    }
                    else{
                      value.addItem(index);
                    }

                  },
                  title: Text('item ' + index.toString()),
                  trailing: Icon(
                      value.selectedItem.contains(index) ? Icons.favorite : Icons.favorite_border_outlined),
                );
              });
            }),
          ),
        ],
      ),
    );
  }
}
