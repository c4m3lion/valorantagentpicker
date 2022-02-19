// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:valorantagentpicker/datas.dart';
import 'package:valorantagentpicker/network.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showImage = false;
  int rngNumber = 0;

  void generateRandomNumber() {
    PaintingBinding.instance!.imageCache?.clear();
    rngNumber = Random().nextInt(Datas.agents.length - 1);
    print(Datas.agents[rngNumber].displayName);
    setState(() {
      showImage = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //MyNetwork().getAgents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showImage)
              Expanded(
                child: !showImage
                    ? const SizedBox()
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          if (Datas.agents[rngNumber].background != null)
                            FadeInImage.assetNetwork(
                              image: Datas.agents[rngNumber].background,
                              fadeInDuration: Duration(milliseconds: 300),
                              placeholder: "assets/back.png",
                            ),
                          FadeInImage.assetNetwork(
                            fadeInDuration: Duration(seconds: 1),
                            image: Datas.agents[rngNumber].fullPortrait,
                            placeholder: "assets/back.png",
                          ),
                        ],
                      ),
              ),
            SizedBox(
              height: 80,
              width: 120,
              child: ElevatedButton(
                onPressed: () => {
                  generateRandomNumber(),
                },
                child: Text("Find"),
              ),
            ),
            if (showImage)
              SizedBox(
                height: 40,
              )
          ],
        ),
      ),
    );
  }
}
