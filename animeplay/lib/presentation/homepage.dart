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
  //
  final O3DController controller = O3DController(),
      _controllerTwo = O3DController(),
      _controllerThree = O3DController();
  //
  @override
  void initState() {
    super.initState();
    // _controllerTwo.pause();
    // _controllerThree.pause();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('AnimePlay 🤖')),
      ),
      body: Stack(
        children: [
          if (characterDisplayOption)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenwidth * 0.5,
                  height: 900,
                  child: O3D(
                    src: 'assets/animecharacters/talkingman.glb',
                    controller: _controllerTwo,
                    cameraControls: false,
                    autoPlay: true,
                    animationName: 'animation_0',
                    cameraOrbit: CameraOrbit(-90, 75, 70),
                  ),
                ),
                SizedBox(
                  width: screenwidth * 0.5,
                  height: screenheight,
                  child: O3D(
                    src: 'assets/animecharacters/talkinglady.glb',
                    controller: _controllerThree,
                    cameraControls: false,
                    autoPlay: true,
                    animationName: 'animation_4',
                    cameraOrbit: CameraOrbit(90, 75, 70),
                  ),
                ),
              ],
            ),
          if (!characterDisplayOption)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenwidth * 0.5,
                  height: 900,
                  child: O3D(
                    src: 'assets/animecharacters/standingglb1.glb',
                    controller: _controllerTwo,
                    cameraControls: false,
                    autoPlay: true,
                  ),
                ),
                SizedBox(
                  width: screenwidth * 0.5,
                  height: screenheight,
                  child: O3D(
                    src: 'assets/animecharacters/standingglb2.glb',
                    controller: _controllerThree,
                    cameraControls: false,
                    autoPlay: true,
                  ),
                ),
              ],
            ),
          Positioned(
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      characterDisplayOption = !characterDisplayOption;
                    },
                    child: const Text(
                      'Switch Act',
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   child: const Text(
                  //     'Stop Conversation',
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
