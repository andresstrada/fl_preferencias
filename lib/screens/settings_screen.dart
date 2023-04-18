
import 'package:fl_preferencias/providers/theme_provider.dart';
import 'package:fl_preferencias/share_preferences/preferences.dart';
import 'package:fl_preferencias/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
   static const String routeName='Settings';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  //bool isDarkmode = false;
  //int gender = 1;
  //String name = 'Pedro';


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer:const SideMenu(),
      body: Padding(        
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Ajustes',style: TextStyle(fontSize: 45,fontWeight: FontWeight.w300),),
              const Divider(),
              SwitchListTile(value: Preferences.isDarkmode, onChanged: (value){                
                Preferences.isDarkmode = value;
                final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

   value
                        ? themeProvider.setDarkMode()
                        : themeProvider.setLightMode();

                setState(() {});

              }, title: const Text('Darkmode') ,),
              const Divider(),
              RadioListTile(value: 1, groupValue: Preferences.gender, onChanged: (value){
                      Preferences.gender=value ??1;
                      setState(() {});
                }, title: const Text('Masculino'),),
              const Divider(),
              RadioListTile(value: 2, groupValue: Preferences.gender, onChanged: (value){
                  Preferences.gender=value ??1;
                  setState(() {});
              }, title: const Text('Femenino'),),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.name,
                  onChanged: (value){
                       Preferences.name=value;
                       setState(() {});
                  },
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre'
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}