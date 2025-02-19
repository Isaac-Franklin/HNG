import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class View3DElement extends StatefulWidget {
  // final String elementURL;
  const View3DElement({super.key});

  @override
  State<View3DElement> createState() => _View3DElementState();
}

class _View3DElementState extends State<View3DElement> {
  O3DController controller = O3DController();
  late String characterChoice;

  @override
  void initState() {
    super.initState();
    setState(() {
      characterChoice = 'assets/animemotions/zombie.glb';
      // characterChoice = 'assets/animecharacters/deadpool_marvel.glb';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimePlay Character"),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.change_circle,
              size: 40,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return FractionallySizedBox(
                    // heightFactor: 1,
                    child: Container(
                      height: 400,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Choose a different avatar',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              IconButton(
                                color: Colors.grey,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.cancel),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          // other characters option starts here
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                characterChoice =
                                    'assets/animemotions/male01.glb';
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'MONARCCH',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: const Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/images/monarch.png',
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                characterChoice =
                                    'assets/animecharacters/male02.glb';
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'DiLoo',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: const Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/images/dilo.png',
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                characterChoice =
                                    'assets/animecharacters/female01.glb';
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Nanaa',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: const Image(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          'assets/images/Nana.png',
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          O3D(
            controller: controller,
            cameraControls: true,
            src: characterChoice,
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(20),
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
          )
        ],
      ),
    );
  }
}
