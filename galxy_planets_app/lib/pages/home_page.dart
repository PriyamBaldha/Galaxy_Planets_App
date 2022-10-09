import 'package:flutter/material.dart';
import 'package:galxy_planets_app/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("GALAXY PLANETS"),
          centerTitle: true,
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 30,
          ),
          actions: const [
            Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ],
          flexibleSpace: Container(
            height: 350,
            width: 120,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color(0xff2a90fd),
                  Color(0xff2a90fd),
                  Color(0xff02c3ff),
                ],
              ),
            ),
          )),
      backgroundColor: const Color(0xff3e3963),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...Global.Planets.map(
              (e) => GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('DetailScreenPage', arguments: e);
                },
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 70),
                      margin: const EdgeInsets.only(
                          left: 100, bottom: 20, top: 20, right: 20),
                      height: 190,
                      width: 299,
                      decoration: BoxDecoration(
                        color: const Color(0xff434273),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e['planets'],
                                style: const TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Icon(Icons.more_vert, color: Colors.grey),
                            ],
                          ),
                          const Text(
                            "Milkyway Gallery",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 4,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Icon(Icons.my_location, color: Colors.grey),
                              const SizedBox(width: 3),
                              Text(
                                e['km'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              //const SizedBox(width: 5),
                              const Icon(Icons.unfold_less, color: Colors.grey),
                              const SizedBox(height: 5),
                              Text(
                                e['m/s'],
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    RotationTransition(
                      turns: animationController,
                      child: Hero(
                        tag: e['tag'],
                        child: Container(
                          height: 150,
                          width: 150,
                          margin: const EdgeInsets.all(10),
                          child: Image.asset(
                            e['images'],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ).toList(),
          ],
        ),
      ),
    );
  }
}
