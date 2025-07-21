import 'package:flutter/material.dart';

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({super.key});

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation> with TickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1)
    );
    _animation = Tween<double>(begin: 100,end: 300).animate(_animationController);
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context,child){
                return Container(
                  width: _animation.value,
                  height: _animation.value,
                  color: Colors.red,
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
        child: Icon(Icons.repeat),
      ),
    );
  }
}



















// import 'package:flutter/material.dart';

// class ExplicitAnimation extends StatefulWidget {
//   const ExplicitAnimation({super.key});

//   @override
//   State<ExplicitAnimation> createState() => _ExplicitAnimationState();
// }

// class _ExplicitAnimationState extends State<ExplicitAnimation> with SingleTickerProviderStateMixin{
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2)
//     );
//     _animation = Tween<double>(begin: 100,end: 300).animate(_controller);
//     _controller.forward();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Explicit Animation"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: AnimatedBuilder(
//               animation: _animation,
//               builder: (context,child){
//                 return Container(
//                   width: _animation.value,
//                   height: _animation.value,
//                   color: Colors.green,
//                 );
//               }
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: (){
//          if(_controller.status == AnimationStatus.completed){
//               _controller.reverse();
//             }else{
//               _controller.forward();
//             }
//       },child: Icon(Icons.repeat)),
//     );
//   }
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }