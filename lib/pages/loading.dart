import 'package:flutter/material.dart';
import 'package:valorantagentpicker/network.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  void getDatas() async {
    await MyNetwork().getAgents();
    await Future.delayed(
      Duration(seconds: 2),
    );
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void initState() {
    // TODO: implement initState
    getDatas();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(60),
        child: Center(
          child: FadeTransition(
            opacity: _animation,
            child: Image.asset("assets/valorantLogo.png"),
          ),
        ),
      ),
    );
  }
}
