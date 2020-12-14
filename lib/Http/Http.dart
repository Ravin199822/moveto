import 'dart:convert';

import 'package:http/http.dart' as http;

class networkAPICall {
  final host =
      "http://skymoonlabs.com/moveto/demo/wp-content/plugins/moveto/api/";
  Map<String, String> commonHeaders = {
    'Agent': 'iPhone',
    'App-Version': '1.0.0'
  }; //common header properties for all http requests

  void httpPostRequest(
      String serviceUrl,
      // Map<String, dynamic> headers,
      Map<String, dynamic> postData,
      void completionHandler(bool status, String data)) async {
    var httpHeaders = this.commonHeaders;
    // if (headers != null) {
    //   httpHeaders.addAll(headers);
    // }

    try {
      var response = await http.post(this.host + serviceUrl,
          body: json.encode(postData), headers: httpHeaders);
      if (response.statusCode == 200) {
        final d = response.body;
        print('WebServiceRequest - $serviceUrl \nResponse - $d');
        completionHandler(true, d);
      } else {
        completionHandler(false, "error");
      }
    } catch (e) {
      completionHandler(false, "error");
    }
  }
}
