import "package:flutter/material.dart";
import "package:smart_home_ui/util/smart_device_box.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 5;

  // list of smart devices
  List mySmartDevices = [
    // [DeviceName, iconPath, powerStatus]
    ["Smart Light", "lib/icons/light-bulb.png", false],
    ["Smart AC", "lib/icons/air-conditioner.png", false],
    ["Smart TV", "lib/icons/smart-tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", false],
  ];

  // power button switch
  powerSwitchChanged (bool value, int index){
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              // custom app bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  // menu icons
                  Image.asset('lib/icons/menu.png', height: 45, color: Colors.grey[800],),
                        
                  // account icon
                  Icon(Icons.person, size: 45, color: Colors.grey[800],),
                ],),
              ), const SizedBox(height: 20,),
          
              // welcome home section
              Padding(
               padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
               child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Home,", style: TextStyle(fontSize: 28, color: Colors.grey[700]),),
                  const Text("Prince Obeten", style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),),
                ],
               ),
             ), const SizedBox(height: 10),
          
            // Seperator line
             Padding(
               padding: const EdgeInsets.all(5.0),
               child: Divider(color: Colors.grey[400], thickness: 1,),
             ),
          
            // smart devices + grid
            Padding( padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text('Smart Devices', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800]),),
            ),
            Expanded(child: GridView.builder(
                padding: const EdgeInsets.all(25.0),
                itemCount: mySmartDevices.length,
                // physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  childAspectRatio: 1 /1.2,
                ), 
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                }
              ),
            ),
          
          ],),
        ),
      );
  }
}
