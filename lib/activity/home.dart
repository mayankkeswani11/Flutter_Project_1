//import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

//const url = 'https://api.openweathermap.org/data/2.5/weather?q=Amravati&appid=04e5610f7a542c90d14270c177a1d8d2';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchcontroller=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var city_name = [
      "mumbai",
      "pune",
      "Amravati",
      "",
      "Nanded",
      "Nandurbar",
      "Nagpur",
      "Banglore"
    ];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;
    String? temp=(info?['temp'].toString());
    String? humidity=(info?['hum'].toString());
    String? Air_Speed=(info?['speed_value'].toString());
    String? describe=(info?['description'].toString());
    if(temp=="NA")
      {
        print("NA");
      }
    else{
      temp=(info?['temp'].toString())?.substring(0,4);
      Air_Speed=(info?['speed_value'].toString())?.substring(0,4);
    }


    String? icon=info?['icon_value'];
    String? city_nam=info?['city_value'];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child:AppBar(
         // backgroundColor: Colors.tealAccent.withOpacity(0.5),
          
        ),
      ),
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
              Colors.blue,
                  Colors.cyanAccent
            ])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if((searchcontroller.text).replaceAll(" ", "")=="")
                          {print("blank search");}
                        else{
                          Navigator.pushReplacementNamed(context, "/Loading",arguments: {
                            "search_text":searchcontroller.text
                          });
                        }

                      },
                      child: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                      ),
                    ),
                    //Icon(Icons.search), ye just icon show karne ke liye lekin agar uspe touch karne se effect dekhna hai to gestureDetector use karna padega
                    Expanded(
                        child: TextField(controller: searchcontroller,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search $city",

                      ),
                    ))
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.all(26),
                        child: 
                        Row(

                          children: [
                            Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(width: 10,),
                            Column(
                              children: [


                                    Text("$describe",style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                    ),),
                                SizedBox(height: 2,),
                                Text("in $city_nam",style: TextStyle(fontSize: 20),)

                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        padding: EdgeInsets.all(26),
                        height: 265,
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.thermostat,size: 60),

                            Column(

                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("$temp",style: TextStyle( fontSize: 70),),
                                    Container(child: Icon(Icons.circle_outlined,size: 20,),padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                                        ),
                                    Text("C",style: TextStyle(fontSize: 40),)


                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                  ),
                  ),
                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        margin:
                            EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: EdgeInsets.all(26),
                        height: 150,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.wind_power,size: 30,)
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("$Air_Speed",style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold

                            ),),
                            Text("Km/hr")
                          ],
                        )),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10)),
                        margin:
                        EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: EdgeInsets.all(26),
                        height: 150,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.percent_rounded,size:28,)
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("$humidity",style: TextStyle(
                                fontSize: 30,
                              fontWeight: FontWeight.bold
                            ),),
                            Text("humidity")
                          ],
                        )),
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.all(25),
                  child: Column(

                    children: [
                      Text("Made by Mayank"),
                      Text("Data Provided by Openweather App")
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
