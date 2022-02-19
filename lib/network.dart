import 'dart:convert';

import 'package:http/http.dart';
import 'package:valorantagentpicker/datas.dart';

class MyNetwork {
  Future<String> getAgents() async {
    try {
      Response response = await get(
        Uri.parse(
            "https://valorant-api.com/v1/agents?isPlayableCharacter=true"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      var res = jsonDecode(response.body);
      if (res["status"] == 200) {
        var data = res['data'];
        for (var i in data) {
          Agent a = Agent();
          a.displayName = i['displayName'];
          a.id = i['uuid'];
          a.fullPortrait = i['fullPortrait'];
          a.bustPortrait = i['bustPortrait'];
          a.background = i['background'];
          a.audio = i['voiceLine']['mediaList'][0]['wave'];
          print(i['displayName']);
          Datas.agents.add(a);
        }
        print(Datas.agents.length);
      }
      return "OK";
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
