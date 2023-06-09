import 'package:fl_preferencias/share_preferences/preferences.dart';
import 'package:fl_preferencias/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName='Home';

  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(            
      appBar: AppBar(      
        title: const Text("Home"),
      ),
      drawer:const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('isDarkmode: ${Preferences.isDarkmode}'),
          const Divider(),
          Text('Genero : ${Preferences.gender}'),
          const Divider(),
          Text('Nombre Usuario : ${Preferences.name}'),
        ],
      )
    );
  }
}