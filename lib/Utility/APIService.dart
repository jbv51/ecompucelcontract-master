import 'package:http/http.dart' as http;

import 'ApiUtils.dart';

class APIService {
  static downloadTransactionsCSVFilesName(String json) async {
    String link = ApiUtils.getMainLink() +
        "Api_CSVSink/FM_DownLoadAllTransactionTables?"
            "JsonDataAskQueryMain=$json";

    print(link);

    return await http.get(Uri.parse(link));
  }

  static getDeleteDownloadedFiles({Map body}) async {
    String link =
        ApiUtils.getMainLink() + "Api_FarmERPMobDownLoad/DeleteAllFile";
    return await http.post(Uri.parse(link), body: body);
  }
}
