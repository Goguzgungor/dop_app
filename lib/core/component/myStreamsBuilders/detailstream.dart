import 'package:dop_app/core/base/state/base_state.dart';
import 'package:dop_app/core/component/customfonc/dateFonc.dart';
import 'package:dop_app/core/constant/enum/streamtype.dart';
import 'package:dop_app/core/init/services/data_request.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailStream extends StatefulWidget {
  final String url;
  final String streamType;
  const DetailStream({Key? key, required this.streamType, required this.url}) : super(key: key);

  @override
  State<DetailStream> createState() => _DetailStreamState();
}

class _DetailStreamState extends BaseState<DetailStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: GetDataFromApi().getDetailStream(widget.url),
      builder: (context, snapshot) {
        var myData = snapshot.data;
        if (!snapshot.hasData) {
          return Text(
            "Loading",
            style: TextStyle(color: Colors.black),
          );
        }
        String updateTime = DateFonc().replace(myData['data']['datetime'], myData['data']["utc_offset"], '+00:00');
        if (widget.streamType == STREAMTYPE.MINUTE) {
          return Text(
            DateFonc().minuteConvert(updateTime),
            style: GoogleFonts.montserrat(textStyle: themeData.textTheme.caption),
          );
        }
        if (widget.streamType == STREAMTYPE.HOURS) {
          return Text(
            DateFonc().hoursConvert(updateTime),
            style: GoogleFonts.montserrat(textStyle: themeData.textTheme.caption),
          );
        }
        if (widget.streamType == STREAMTYPE.DETAIL) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFonc().getCity(myData['data']['timezone']),
                style: GoogleFonts.montserrat(textStyle: themeData.textTheme.headline5),
              ),
              Text(
                DateFonc().getState(myData['data']['timezone']),
                style: GoogleFonts.montserrat(textStyle: themeData.textTheme.headline3),
              ),
              SizedBox(
                height: dynamicHeight(10),
              ),
              Text(
                DateFonc().dateNameConvert(myData['data']['day_of_week']) + ', ' + 'GMT ' + myData['data']['utc_offset'],
                style: GoogleFonts.montserrat(textStyle: themeData.textTheme.subtitle1),
              ),
              Text(
                DateFonc().monthConvert(updateTime) + ' ' + DateFonc().dateConvert(updateTime) + ', ' + DateFormat.y().format(DateTime.parse(updateTime)),
                style: GoogleFonts.montserrat(textStyle: themeData.textTheme.headline3),
              ),
            ],
          );
        }
        return Text('Loading');
      },
    );
  }
}
