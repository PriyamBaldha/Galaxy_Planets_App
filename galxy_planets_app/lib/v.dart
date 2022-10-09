import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xff3e3963),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(top: 60, left: 20, right: 20),
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff434273),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 70),
                    Text(
                      res['planets'],
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Milkyway Gallaxy",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.my_location, color: Colors.grey),
                        SizedBox(width: 5),
                        Text(
                          res['km'],
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 150),
                        Icon(Icons.unfold_less, color: Colors.grey),
                        SizedBox(height: 5),
                        Text(
                          res['m/s'],
                          style: TextStyle(
                            fontSize: 15,
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
                  tag: res['tag'],
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            color: Color(0xff3e3963),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15),
                                  alignment: Alignment.centerRight,
                                  height: 70,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: <Color>[
                                        Color(0xff2a90fd),
                                        Color(0xff2a90fd),
                                        Color(0xff02c3ff),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Welcome to ${res['planets']}",
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                RotationTransition(
                                  turns: animationController,
                                  child: Hero(
                                    tag: res['tag'],
                                    child: Container(
                                      height: 150,
                                      width: 150,
                                      margin: EdgeInsets.all(10),
                                      child: Image.asset(
                                        res['images'],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Center(
                                  child: Text(
                                    "Distance to sun",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "${res['distance to sun']}",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Center(
                                  child: Text(
                                    "Distance to earth",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "${res['distance to earth']}",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        res['images'],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'OVERVIWE',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              '''${res['detail']}''',
              style:
                  TextStyle(color: Colors.grey, wordSpacing: 2, fontSize: 17),
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerRight,
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color(0xff2a90fd),
                  Color(0xff2a90fd),
                  Color(0xff02c3ff),
                ],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 30,
                  ),
                  Text(
                    "BACK",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
