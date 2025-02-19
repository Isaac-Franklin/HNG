// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:three_dart/three_dart.dart' as three;
// import 'package:three_dart_jsm/three_dart_jsm/loaders/gltf/gltf_loader.dart';

// class ThreeDartScene extends StatefulWidget {
//   @override
//   _ThreeDartSceneState createState() => _ThreeDartSceneState();
// }

// class _ThreeDartSceneState extends State<ThreeDartScene> {
//   late three.Scene scene;
//   late three.Camera camera;
//   late three.WebGLRenderer renderer;
//   three.AnimationMixer? mixer;
//   late three.Clock clock;

//   @override
//   void initState() {
//     super.initState();
//     initScene();
//   }

//   void initScene() async {
//     // Initialize Scene
//     scene = three.Scene();
//     camera = three.PerspectiveCamera(75, 1, 0.1, 1000);
//     // camera.position.setValues(0, 1, 5);

//     // Initialize Renderer
//     // renderer = three.WebGLRenderer();
//     renderer.setSize(500, 500);
//     renderer.setClearColor(three.Color(0xEEEEEE));

//     // Load the 3D model
//     var loader = GLTFLoader();
//     loader.load("assets/animemotions/tester.glb", (gltf) {
//       var model = gltf.scene;
//       scene.add(model);

//       // Load animations
//       if (gltf.animations.isNotEmpty) {
//         mixer = three.AnimationMixer(model);
//         var action = mixer!.clipAction(gltf.animations[0]);
//         action?.play();
//       }

//       // Start rendering
//       animate();
//     });
//   }

//   void animate() {
//     if (mounted) {
//       setState(() {
//         mixer?.update(clock.getDelta());
//       });
//       renderer.render(scene, camera);
//       Future.delayed(Duration(milliseconds: 16), animate);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: HtmlElementView(viewType: 'three-js-canvas'),
//     );
//   }
// }
