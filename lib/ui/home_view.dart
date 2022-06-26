import 'package:dop_app/core/base/state/base_state.dart';
import 'package:dop_app/core/component/assets/assets_decider.dart';
import 'package:dop_app/core/component/containers/customCont.dart';
import 'package:dop_app/core/component/myStreamsBuilders/homeStream.dart';

import 'package:dop_app/core/viewmodels/homeview_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

HomeViewModel viewModel = HomeViewModel();

class _HomeViewState extends BaseState<HomeView> {


  @override
  void initState() {
    super.initState();
    viewModel.getData();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: themeData.colorScheme.background),
      width: width,
      height: height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                SizedBox(
                  width: width,
                  height: dynamicHeight(230),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: dynamicHeight(30)),
                  child: Container(
                    width: width,
                    height: dynamicHeight(200),
                    decoration: BoxDecoration(
                      color: themeData.colorScheme.primary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: dynamicWidth(35)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HomeStream(),
                            Padding(
                              padding: EdgeInsets.only(right: dynamicWidth(35)),
                              child: InkWell(
                                onTap: () {
                                  viewModel.changeTheme(context);
                                },
                                child: CircleAvatar(
                                  radius: dynamicHeight(20),
                                  backgroundColor: themeData.colorScheme.onPrimary,
                                  child: CircleAvatar(
                                    radius: dynamicHeight(17),
                                    backgroundColor: themeData.colorScheme.secondary,
                                    child: SvgPicture.asset(
                                      AssetDecide().iconDecider('change', viewModel.theme),
                                      fit: BoxFit.scaleDown,
                                      color: themeData.colorScheme.inversePrimary,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width - dynamicWidth(70),
                  height: dynamicHeight(60),
                  child: TextFormField(
                    controller: controller,
                    onChanged: (value) {
                      viewModel.searrchFonc(controller.text);
                    },
                    style: GoogleFonts.montserrat(textStyle: themeData.textTheme.headline6),
                    decoration: InputDecoration(
                      hintText: 'Arama',
                      hintStyle: GoogleFonts.montserrat(textStyle: themeData.textTheme.headline6),
                      prefixIcon: SvgPicture.asset(
                        'assets/ligth/icons/search.svg',
                        fit: BoxFit.scaleDown,
                      ),
                      focusColor: themeData.colorScheme.primary,
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(35), borderSide: BorderSide(color: themeData.colorScheme.onPrimary, width: dynamicWidth(1))),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(35), borderSide: BorderSide(color: themeData.colorScheme.onPrimary, width: dynamicWidth(1))),
                      fillColor: themeData.colorScheme.onSecondary,
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: width,
              height: height - dynamicHeight(280),
              child: Observer(builder: (_) {
                return ListView.builder(
                  itemCount: viewModel.stateList.length,
                  itemBuilder: (context, index) {
                    return CustomContainer(
                      t1: viewModel.stateList[index],
                      theme: viewModel.theme,
                      isVisible: true,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    ));
  }
}
