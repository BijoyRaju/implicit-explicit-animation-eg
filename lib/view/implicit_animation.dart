import 'package:anm_study/view/curved_animation.dart';
import 'package:anm_study/view/explicit_animation.dart';
import 'package:flutter/material.dart';

class ImplicitAnimation extends StatefulWidget {
  const ImplicitAnimation({super.key});

  @override
  State<ImplicitAnimation> createState() => _ImplicitAnimationState();
}

class _ImplicitAnimationState extends State<ImplicitAnimation> {
  double size = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              height: size,
              width: size,
              child: FlutterLogo(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ExplicitAnimation()));
          }, child: Text("Explicit Animation")),
          SizedBox(height: 20),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CurevedAnimation()));
          }, child: Text("Curved Animation")) 
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
          size = size == 100 ? 200 : 100;
          });
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

























// import 'package:anm_study/view/explicit_animation.dart';
// import 'package:flutter/material.dart';

// class AnimationHome extends StatefulWidget {
//   const AnimationHome({super.key});

//   @override
//   State<AnimationHome> createState() => _AnimationHomeState();
// }

// class _AnimationHomeState extends State<AnimationHome> {

//   double size = 100;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//             child: AnimatedContainer(
//               width: size,
//               height: size,
//               duration: Duration(seconds: 2),
//               color: Colors.amberAccent,
//               child: FlutterLogo(),
//             ),
//           ),
//           SizedBox(height: 200),
//           ElevatedButton(onPressed: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context) => ExplicitAnimation()));
//           }, child: Text("Explicit"))
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           setState(() {
//             size = size == 100 ? 200 : 100;
//           });
//         },
//         child: Icon(Icons.play_arrow),
//       ),
//     );
//   }
// }