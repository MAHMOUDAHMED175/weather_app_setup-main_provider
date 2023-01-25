
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';

import '../providers/providers.dart';
import '../services/service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data)
            {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;

              WeatherService service = WeatherService();

              WeatherModel? weather =
              await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
              Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
              EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: Text('search'),
              suffixIcon: GestureDetector(

                  onTap : () async
                  {
                    WeatherService service = WeatherService();

                    WeatherModel? weather =
                    await service.getWeather(cityName: cityName!);

                    Provider.of<WeatherProvider>(context,listen: false).weatherData = weather;
                    Provider.of<WeatherProvider>(context,listen: false).cityName = cityName;

                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
              border: OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}




/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/providers.dart';
import 'package:weather_app/services/service.dart';

class SearchScreen extends StatelessWidget {
  String? cityName;
   var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 5.0,
        title: const Text(
          "Search For Your Location",
        ),
      ),
      body:Center(
        child:Padding(
          padding: EdgeInsets.all(20.0),
          child: TextFormField(
            key: formKey,
            onChanged: (duringTypeCityName){
              cityName=duringTypeCityName;
            },

            onFieldSubmitted: (submitCityName) async{
                cityName=submitCityName;
                WeatherServices service=WeatherServices();
                WeatherModel? weather=await service.getWeather(cityName: cityName!);
                Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
                Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;

                Navigator.pop(context);


              },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical:25.0),
              border: OutlineInputBorder(),
              labelText: 'search',
              hintText: "Enter City Name",
              suffixIcon: InkWell(
                  onTap:()async{
                      WeatherServices service=WeatherServices();
                      WeatherModel? weather=await service.getWeather(cityName: cityName!);
                      Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
                      Provider.of<WeatherProvider>(context,listen: false).cityName=cityName;

                      Navigator.pop(context);

                  },
                  child:Icon(Icons.search)),


            ),
            validator: (String? value){
              if(value!.isEmpty)
                {
                  return 'Type The City Name ' ;
                }
            },
          ),
        ),
      ),

    );
  }
}
*/