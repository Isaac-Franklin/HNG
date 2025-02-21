// ignore_for_file: unused_element

import 'package:animeplay/presentation/characteranime.dart';
import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

// import 'package:model_viewer_plus/model_viewer_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool characterDisplayOption = false;
  final O3DController controller = O3DController(),
      _controllerOne = O3DController(),
      _controllerTwo = O3DController();

  // Animation actions: Character One
  void _charOneRun() {
    _controllerOne.animationName = 'Run';
  }

  void _charOneAttack() {
    _controllerOne.animationName = 'Attack';
  }

  void _charOneWalk() {
    _controllerOne.animationName = 'Walk';
  }

  void _charOneFall() {
    _controllerOne.animationName = 'FallingBack';
  }

  void _charOneIdle() {
    _controllerOne.animationName = 'Idle';
  }

  // Animation actions: Character Two
  void _charTwoRun() {
    _controllerTwo.animationName = 'Run';
  }

  void _charTwoAttack() {
    _controllerTwo.animationName = 'Attack';
  }

  void _charTwoWalk() {
    _controllerTwo.animationName = 'Walk';
  }

  void _charTwoFall() {
    _controllerTwo.animationName = 'FallingBack';
  }

  void _charTwoIdle() {
    _controllerTwo.animationName = 'Idle';
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime_Play 🤖'),
        actions: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const View3DElement();
                  },
                ),
              );
            },
            label: const Row(
              children: [
                Text(
                  'View Characters',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_circle_right,
                  size: 30,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 60),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(0),
                  // color: Colors.grey[100],
                  child: SizedBox(
                    width: screenwidth * 0.5,
                    height: screenheight,
                    child: O3D(
                      src: 'assets/animemotions/zombie.glb',
                      controller: _controllerOne,
                      cameraControls: false,
                      autoPlay: true,
                      animationName: 'animation_0',
                      cameraOrbit: CameraOrbit(-90, 75, 90),
                    ),
                  ),
                ),
                SizedBox(
                  width: screenwidth * 0.5,
                  height: screenheight,
                  child: O3D(
                    src: 'assets/animemotions/zombie.glb',
                    controller: _controllerTwo,
                    cameraControls: false,
                    autoPlay: true,
                    animationName: 'Idle',
                    cameraOrbit: CameraOrbit(90, 75, 90),
                  ),
                ),
              ],
            ),
          ),

          // animation character controls here
          Positioned(
            bottom: 0, left: 0, right: 0,
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    '3D Character Animation Control',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // CHARACTER ONE CONTROL STARTS HERE
                      Container(
                        height: 160,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(200)),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(13),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                backgroundColor: Colors.black,
                              ),
                              child: const Text(
                                'Attack',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                _charOneAttack();
                              },
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    backgroundColor: Colors.black,
                                  ),
                                  child: const Text(
                                    'Walk',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    _charOneWalk();
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {
                                    return _charOneIdle();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: const Text(
                                      '1',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    backgroundColor: Colors.black,
                                  ),
                                  child: const Text(
                                    'Run',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    _charOneRun();
                                  },
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                backgroundColor: Colors.black,
                              ),
                              child: const Text(
                                'Fall',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                _charOneFall();
                              },
                            ),
                          ],
                        ),
                      ),

                      // CHARACTER ONE CONTROL SETUP ENDS HERE

                      // CHARACTER TWO CONTROL SETUP ENDS HERE
                      Container(
                        height: 160,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(200)),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(13),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                backgroundColor: Colors.black,
                              ),
                              child: const Text(
                                'Attack',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                _charTwoAttack();
                              },
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    backgroundColor: Colors.black,
                                  ),
                                  child: const Text(
                                    'Walk',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    _charTwoWalk();
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {
                                    return _charTwoIdle();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: const Text(
                                      '2',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    backgroundColor: Colors.black,
                                  ),
                                  child: const Text(
                                    'Run',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    _charTwoRun();
                                  },
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                backgroundColor: Colors.black,
                              ),
                              child: const Text(
                                'Fall',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                _charTwoFall();
                              },
                            ),
                          ],
                        ),
                      )
                      // CHARACTER TWO CONTROL SETUP ENDS HERE
                    ],
                  ),
                ],
              ),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     FloatingActionButton(
            //       backgroundColor: Colors.white,
            //       onPressed: () {
            //         controller.cameraOrbit(90, 75, 70);
            //         controller.cameraTarget(1, 1, 0);
            //       },
            //       child: const Icon(Icons.swipe_left_rounded),
            //     ),
            //     const SizedBox(
            //       width: 10,
            //     ),
            //     FloatingActionButton(
            //       backgroundColor: Colors.white,
            //       onPressed: () {
            //         controller.cameraOrbit(0, 75, 70);
            //         controller.cameraTarget(0, 0.87, 0);
            //       },
            //       child: const Icon(Icons.person_2_outlined),
            //     ),
            //     const SizedBox(
            //       width: 10,
            //     ),
            //     FloatingActionButton(
            //       backgroundColor: Colors.white,
            //       onPressed: () {
            //         // controller.cameraOrbit(0, 75, 70);
            //         // controller.cameraTarget(0, 0.87, 0);
            //       },
            //       child: const Icon(Icons.center_focus_strong),
            //     ),
            //     const SizedBox(
            //       width: 10,
            //     ),
            //     FloatingActionButton(
            //       backgroundColor: Colors.white,
            //       onPressed: () {
            //         controller.cameraOrbit(-90, 75, 70);
            //         controller.cameraTarget(-1, 1, 0);
            //       },
            //       child: const Icon(Icons.swipe_right_rounded),
            //     )
            //   ],
            // ),
          ),
        ],
      ),
    );
  }
}
