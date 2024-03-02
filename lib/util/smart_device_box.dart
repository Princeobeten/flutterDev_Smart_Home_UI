import "dart:math";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

// ignore: must_be_immutable
class SmartDeviceBox extends StatelessWidget {  
  
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onChanged;
  SmartDeviceBox({super.key, required this.smartDeviceName, required this.iconPath, required this.powerOn, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey[900]: Colors.grey[400],
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // icon
            Image.asset(iconPath, height: 65, color:  powerOn ? Colors.white: Colors.black,),
        
            // smart device name and swicth
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(smartDeviceName, style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:  powerOn ? Colors.white : Colors.black,
                    ),),
                  ),
                ),

                // swicth
                Transform.rotate( // Transform.rotate -> make swicth button vetical via an angle
                  angle: pi / 2, // angle: pi / 2 -> pi / 2 angle to rotate 90 degrees
                  child: CupertinoSwitch(
                    activeColor: Colors.grey[700],
                    value: powerOn, onChanged: onChanged
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}