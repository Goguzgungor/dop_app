import 'package:dop_app/core/base/state/base_state.dart';
import 'package:dop_app/core/component/customfonc/dateFonc.dart';
import 'package:dop_app/core/init/services/data_request.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeStream extends StatefulWidget {
  const HomeStream({Key? key}) : super(key: key);

  @override
  State<HomeStream> createState() => _HomeStreamState();
}

String replace(String text, String findtext, String replace) {
  String newText = text.replaceAll(findtext, replace);
  return newText;
}

class _HomeStreamState extends BaseState<HomeStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: GetDataFromApi().getStreamDat(),
      builder: (context, snapshot) {
        var myData = snapshot.data;
        if (!snapshot.hasData) {
          return Text(
            "Loading",
            style: TextStyle(color: themeData.colorScheme.secondary),
          );
        }
        String updateTime = DateFonc().replace(myData['data']['datetime'], myData['data']["utc_offset"], '+00:00');
        String currentTime = DateFormat().add_Hm().format(DateTime.parse(updateTime));

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Günaydın, Özgür!',
              style: GoogleFonts.montserrat(textStyle: themeData.textTheme.headline1),
            ),
            Text(
              currentTime,
              style: GoogleFonts.montserrat(textStyle: themeData.textTheme.button),
            ),
            Row(children: [
              Text(
                DateFonc().dateConvert(myData['data']['datetime']) + ' ',
                style: GoogleFonts.montserrat(textStyle: themeData.textTheme.headline1),
              ),
              Text(
                DateFonc().monthConvert(myData['data']['datetime']) + ', ',
                style: GoogleFonts.montserrat(textStyle: themeData.textTheme.headline1),
              ),
              Text(
                DateFonc().dateNameConvert(myData['data']['day_of_week']),
                style: GoogleFonts.montserrat(textStyle: themeData.textTheme.headline1),
              ),
            ]),
          ],
        );
      },
    );
  }
}
