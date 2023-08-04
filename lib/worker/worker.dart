
import 'package:http/http.dart' as http; // to import uri http  instead of usinmg  string
import 'dart:convert';
//const url = 'https://api.openweathermap.org/data/2.5/weather?q=Amravati&appid=04e5610f7a542c90d14270c177a1d8d2';

class worker {
  String Location="";
  worker(Locate)
  {
    Location=Locate;
  }
  String Decription="";

  String humidity="";
  String temperature ="";
  String pressure="";
  String air_speed="";
  String icon="";

   Future<void> getdata() async
   {
     try{
       final response =  await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$Location&appid=04e5610f7a542c90d14270c177a1d8d2"));
       final data=jsonDecode(response.body);

       // fetching humidity and pressure
       Map main_data=data['main'];
       int  humidity_data= main_data['humidity'];
       int pressure_data= main_data['pressure'];
       double get_temperature = main_data['temp']-273.15;

       //fetching description from api
       List weather_data= data['weather'];
       Map description_data= weather_data[0];
       String desc_data= description_data['description'];

       Map wind_Data=data['wind'];
       air_speed=(wind_Data['speed']/0.2777777777778).toString();
  icon=description_data['icon'].toString();
       pressure=pressure_data.toString();
       Decription=desc_data;
       temperature=get_temperature.toString();
       humidity=humidity_data.toString();

     }
     catch(e)
     {
       pressure="error occured ";
       Decription="Can't find Data";
       temperature="Not find";
       air_speed="Not find";
       icon="04n";
       humidity="Not find";


     }


   }
}
// Future<void> getdata() async{
//  final result = await http.get(Uri.parse(url));
//  final data = jsonDecode(result.body);
//   List weather_data= data['weather'];
//   Map data_weather_contain= weather_data[0];
//
//   print(data_weather_contain['description']);
// }