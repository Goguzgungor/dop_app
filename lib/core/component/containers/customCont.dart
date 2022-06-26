import 'package:dop_app/core/base/state/base_state.dart';
import 'package:dop_app/core/component/customfonc/dateFonc.dart';
import 'package:dop_app/ui/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomContainer extends StatefulWidget {
  final String t1;
  final String theme;
  final dynamic fonc;
  final bool isVisible;
  CustomContainer({Key? key, required this.t1, this.fonc, required this.theme, required this.isVisible}) : super(key: key);

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends BaseState<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isVisible,
      child: Padding(
        padding: EdgeInsets.only(bottom: dynamicHeight(10)),
        child: Stack(
          children: [
            SizedBox(
              width: width,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: width - dynamicWidth(70),
                height: dynamicHeight(55),
                decoration: BoxDecoration(color: themeData.colorScheme.primary, borderRadius: BorderRadius.circular(8)),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: dynamicWidth(20)),
                    child: Text(
                      DateFonc().replace(widget.t1, '/', ', '),
                      style: GoogleFonts.montserrat(textStyle: themeData.textTheme.headline2),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(top: dynamicHeight(12), right: dynamicWidth(21)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailView(
                          urlPath: widget.t1,
                          theme: widget.theme,
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: dynamicHeight(15),
                    backgroundColor: themeData.colorScheme.background,
                    child: CircleAvatar(
                      radius: dynamicHeight(13),
                      backgroundColor: themeData.colorScheme.primary,
                      child: SvgPicture.asset(
                        'assets/ligth/icons/arrow1.svg',
                        fit: BoxFit.scaleDown,
                        color: themeData.colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
