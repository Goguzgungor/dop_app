import 'package:dop_app/core/base/state/base_state.dart';
import 'package:dop_app/core/component/assets/assets_decider.dart';
import 'package:dop_app/core/component/myStreamsBuilders/detailstream.dart';
import 'package:dop_app/core/constant/enum/streamtype.dart';
import 'package:dop_app/ui/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailView extends StatefulWidget {
  final String urlPath;
  final String theme;
  const DetailView({Key? key, required this.urlPath, required this.theme}) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends BaseState<DetailView> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: Column(children: [
        Container(
          width: width,
          height: dynamicHeight(110),
          decoration: BoxDecoration(
            color: themeData.colorScheme.primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: dynamicHeight(50)),
            child: Row(children: [
              SizedBox(
                width: dynamicWidth(40),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    AssetDecide().iconDecider('backarrow', widget.theme),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              SizedBox(
                width: dynamicWidth(60),
              ),
              Image.asset(
                AssetDecide().pngDecide('worldtime', widget.theme),
                fit: BoxFit.scaleDown,
              ),
            ]),
          ),
        ),
        SizedBox(
          height: dynamicHeight(50),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: themeData.colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: themeData.colorScheme.onPrimaryContainer),
              ),
              child: Center(child: DetailStream(streamType: STREAMTYPE.HOURS, url: widget.urlPath)),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: themeData.colorScheme.secondary,
                  radius: dynamicWidth(4.5),
                ),
                SizedBox(
                  height: dynamicHeight(16),
                ),
                CircleAvatar(
                  backgroundColor: themeData.colorScheme.secondary,
                  radius: dynamicWidth(4.5),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: themeData.colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: themeData.colorScheme.onPrimaryContainer),
              ),
              child: Center(child: DetailStream(streamType: STREAMTYPE.MINUTE, url: widget.urlPath)),
            ),
          ],
        ),
        SizedBox(
          height: dynamicHeight(30),
        ),
        DetailStream(streamType: STREAMTYPE.DETAIL, url: widget.urlPath)
      ]),
    );
  }
}
