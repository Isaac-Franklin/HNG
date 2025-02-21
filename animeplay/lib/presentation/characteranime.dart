// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:o3d/o3d.dart';

class View3DElement extends StatefulWidget {
  const View3DElement({super.key});

  @override
  State<View3DElement> createState() => _View3DElementState();
}

class _View3DElementState extends State<View3DElement>
    with SingleTickerProviderStateMixin {
  O3DController controller = O3DController();
  O3DController controller2 = O3DController();
  O3DController controller3 = O3DController();
  late String characterChoice;
  late TabController _tabController;
  String _keyPressed = "Press a key";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  // Key press detection
  void _onKeyEvent(KeyEvent event) {
    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        // FACE UP OR CENTRALIZE
        controller.cameraOrbit(0, 75, 70);
        controller.cameraTarget(0, 0.87, 0);
      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        // FACE LEFT
        controller.cameraOrbit(90, 75, 70);
        controller.cameraTarget(1, 1, 0);
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        // FACE RIGHT
        controller.cameraOrbit(-90, 75, 70);
        controller.cameraTarget(-1, 1, 0);
      }
    }
    print(event);
    setState(() {
      _keyPressed = "Key pressed: ${event.logicalKey.debugName}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anime_Play Characters"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            color: Colors.black,
            child: TabBar(
              controller: _tabController,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 4.0, color: Colors.blue),
                insets: EdgeInsets.symmetric(horizontal: 16),
              ),
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              tabs: [
                Tab(text: "Diloo"),
                Tab(text: "Monarchh"),
                Tab(text: "Nanna"),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              O3D.asset(
                controller: controller,
                cameraControls: true,
                autoRotate: true,
                src: 'assets/animecharacters/male02.glb',
              ),
              O3D.asset(
                controller: controller,
                cameraControls: true,
                autoRotate: true,
                src: 'assets/animemotions/male01.glb',
              ),
              O3D.asset(
                controller: controller,
                cameraControls: true,
                autoRotate: true,
                src: 'assets/animecharacters/female01.glb',
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    controller.cameraOrbit(90, 75, 70);
                    controller.cameraTarget(1, 1, 0);
                  },
                  child: const Icon(Icons.swipe_left_rounded),
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    controller.cameraOrbit(0, 75, 70);
                    controller.cameraTarget(0, 0.87, 0);
                  },
                  child: const Icon(Icons.person_2_outlined),
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    // controller.cameraOrbit(0, 75, 70);
                    // controller.cameraTarget(0, 0.87, 0);
                  },
                  child: const Icon(Icons.center_focus_strong),
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {
                    controller.cameraOrbit(-90, 75, 70);
                    controller.cameraTarget(-1, 1, 0);
                  },
                  child: const Icon(Icons.swipe_right_rounded),
                )
              ],
            ),
          ),

          Focus(
            autofocus: true,
            onKeyEvent: (FocusNode node, KeyEvent event) {
              _onKeyEvent(event);
              return KeyEventResult.handled;
            },
            child: Text(''),
          )
          //
        ],
      ),
    );
  }
}
