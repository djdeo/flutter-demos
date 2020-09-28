import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDaytime; // true or false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    Response response =
        await Dio().get('http://worldtimeapi.org/api/timezone/Europe/London');
    String datetime = response.data['datetime'];
    String offset = response.data['utc_offset'].substring(1, 3);
    // print(datetime);
    // print(offset);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);

    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);
  }
}
