import 'package:dop_app/core/constant/enum/url_const.dart';
import 'package:dop_app/core/init/memory/hive_boxes.dart';
import 'package:dop_app/core/init/memory/hive_manager.dart';
import 'package:dop_app/core/init/network/http_manager.dart';

class GetDataFromApi {
  setStateNames() async {
    dynamic res = await HttpManager.instance.getJsonRequest(URLCONST.URL);
    if (res['status']) HiveManager.instance.addListToBox(HiveBoxes.STATE, res['data']);
  }

  Stream getStreamDat() {
    return Stream.periodic(Duration(seconds: 1)).asyncMap((_) => getStream());
  }

  Stream getDetailStream(String url) {
    return Stream.periodic(Duration(seconds: 1)).asyncMap((_) => getStreamDetail(url));
  }

  getStream() async {
    dynamic res = await HttpManager.instance.getJsonRequest(URLCONST.CURRENTDATA);
    return res;
  }

  getStreamDetail(String url) async {
    dynamic res = await HttpManager.instance.getJsonRequest('${URLCONST.URL}/$url');
    return res;
  }
}
