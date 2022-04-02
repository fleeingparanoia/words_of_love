import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class InvidiousInstanceManager {
  static const String kInstanceListUrl =
      "https://api.invidious.io/instances.json?pretty=1&sort_by=api,health";
  List instancesWithApiUrl = [];
  int currentInstanceIdx = -1;

  Future<bool> init() async {
    // Updates the list of instances
    if (await updateInstanceUrls() == false) {
      return false;
    }
    return true;
  }

  Future<bool> updateInstanceUrls() async {
    // Fetch the list of invidious instances and decode the json
    http.Response response = await http.get(Uri.parse(kInstanceListUrl));
    if (response.statusCode != 200) {
      return false;
    }
    var decodedJson = jsonDecode(response.body);

    // Update the list with the api instances
    for (var instance in decodedJson) {
      if (instance[1]["api"] == true) {
        instancesWithApiUrl.add(instance[0]);
      }
    }

    return true;
  }

  Future<String> getOtherInstance() async {
    if (currentInstanceIdx < instancesWithApiUrl.length - 1) {
      currentInstanceIdx++;
    } else {
      currentInstanceIdx = 0;
      await updateInstanceUrls();
    }
    return instancesWithApiUrl[currentInstanceIdx];
  }
}
