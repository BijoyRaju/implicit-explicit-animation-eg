import 'package:flutter/material.dart';

class CurevedAnimation extends StatefulWidget {
  const CurevedAnimation({super.key});

  @override
  State<CurevedAnimation> createState() => _CurevedAnimationState();
}

class _CurevedAnimationState extends State<CurevedAnimation> with TickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration:  Duration(seconds: 3)
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceIn
    );
    _animationController.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Curved Animation"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context,child){
                return Transform.scale(
                  scale: _animation.value,
                  child: Container(
                    color: Colors.amber,
                    width: 100,
                    height: 100,
                  ),
                );
              }
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            if(_animationController.status == AnimationStatus.completed){
              _animationController.reverse();
            }else{
              _animationController.forward();
            }
          });
        },
        child: Icon(Icons.loop),
      ),
    );
  }
}