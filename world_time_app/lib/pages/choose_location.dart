import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations =[
    WorldTime(url:'Asia/Kolkata',location: 'India', flag: 'india.png'),
    WorldTime(url:'Europe/Berlin',location: 'Germany', flag: 'germany.png'),
    WorldTime(url:'Europe/London',location: 'London', flag: 'london.png'),
    WorldTime(url:'Africa/Cairo',location: 'Cairo', flag: 'cairo.png'),
    WorldTime(url:'Africa/Nairobi',location: 'Nairobi', flag: 'nairobi.png'),
    WorldTime(url:'Asia/Shanghai',location: 'China', flag: 'china.png'),
    WorldTime(url:'America/Los_Angeles',location: 'New York', flag: 'usa.png'),
    WorldTime(url:'Europe/Oslo',location: 'Oslo', flag: 'oslo.png'),
  ];

  void updateTime(index) async
  {
    WorldTime instance = locations[index];
    await instance.getTime();

    //nevigate to home screen
    Navigator.pop(context, {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });

  }

  @override
  Widget build(BuildContext context) {
    // print('build init state function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context , index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical:1, horizontal:4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}