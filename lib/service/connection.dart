import 'dart:io';
import 'dart:convert';
import 'dart:async';

class Connection {
  int ok = 0;
  String link = "https://rickandmortyapi.com/api/";

  Future<String> apiRequestGet(String url) async {
    ok = 0;
    String reply = "";
    try {
      HttpClient httpClient = HttpClient();
      HttpClientRequest request =
      await httpClient.getUrl(Uri.parse(link + url));
      print(request);
      request.headers.set('content-type', 'application/json');
      HttpClientResponse response = await request.close();
      print("--------------------");
      print(url);
      if (response.statusCode == 200) {
        ok = 200;
        print("STATUS 200");
        reply = await response.transform(utf8.decoder).join();
        httpClient.close();
        return reply;
      } else {
        if (response.statusCode == 401) {
          ok = 401;
          print("STATUS 401");
          reply = await response.transform(utf8.decoder).join();
          httpClient.close();
          return reply;
        } else {
          if (response.statusCode == 500) {
            ok = 500;
            print("STATUS 500");
            reply = await response.transform(utf8.decoder).join();
            httpClient.close();
            return reply;
          } else {
            if (response.statusCode == 502) {
              ok = 502;
              print("STATUS 502");
              reply = await response.transform(utf8.decoder).join();
              httpClient.close();
              return reply;
            } else {
              print(
                  'Error getting IP address:\nHttp status =  ${response.statusCode}');
            }
          }
        }
      }
    } catch (exception) {
      print(exception);
    }
  }
}
