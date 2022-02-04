import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Ditils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController rotationController;
  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(
      duration: Duration(milliseconds: 4500),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff3e3962),
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("Galaxy Planets"),
        centerTitle: true,
        actions: [
          Icon(Icons.search),
          SizedBox(width: 10),
        ],
      ),
      body: ListView.builder(
        itemCount: L1.length,
        itemBuilder: (context, i) => Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 60, right: 10, top: 30),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Details(page: L1[i]),
                    ),
                  );
                },
                child: Container(
                  height: 140,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color(0xff434273),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 70, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 150,
                              child: Text(
                                "${L1[i].name}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 24),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              Icons.more_vert,
                              size: 20,
                              color: Colors.white.withOpacity(0.45),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "${L1[i].galaxy}",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.65),
                              fontWeight: FontWeight.w400,
                              fontSize: 13),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 20,
                              child:
                                  Image.asset("Assets/Images/ic_distance.png"),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "${L1[i].distance}",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                height: 20,
                                width: 20,
                                child: Image.asset(
                                    "Assets/Images/ic_gravity.png")),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${L1[i].gravity} m/s²",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontWeight: FontWeight.w800,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 17,
                top: 48,
              ),
              child: Container(
                width: 100,
                height: 100,
                child: RotationTransition(
                  turns: rotationController,
                  child: Image.asset(
                    "${L1[i].asset}",
                    height: MediaQuery.of(context).size.height * 0.37,
                    width: MediaQuery.of(context).size.width * 0.32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Planet {
  String? name,
      galaxy,
      url,
      overView,
      distance,
      dts,
      dte,
      price,
      gravity,
      asset;

  var over;
  Planet(
      {this.name,
      this.gravity,
      this.url,
      this.price,
      this.distance,
      this.dte,
      this.dts,
      this.galaxy,
      this.over,
      required String assetView,
      this.asset,
      required String overView});
}

List<Planet> L1 = [
  Planet(
      name: "Mars",
      gravity: "3.721",
      distance: "6,779 km",
      dte: "396.1 million km",
      dts: "246.96 million km",
      price: "2.8m",
      galaxy: "Milkyway Glaxey",
      asset: "Assets/earth.png",
      url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-s6p8yZ2uq21XfkUX46iA8tIPoWqEl_cnmQ&usqp=CAU",
      overView:
          "Mars is the fourth planet from the Sun and is commonly referred to as the Red Planet. The rocks, soil and sky have a red or pink hue. The distinct red color was observed by stargazers throughout history. It was given its name by the Romans in honor of their god of war",
      assetView: ''),
  Planet(
      name: "Mercury",
      gravity: "3.7m",
      distance: "4,879.4 km",
      dte: "124.4 million km",
      dts: "64.382",
      price: "2.2m",
      galaxy: "Milkyway Glaxey",
      asset: "Assets/p2.png",
      url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC3RnEJO4wyZw1DLGas1AJO-M ShmzgxBJ3Pw&usqp=CAU",
      overView:
          "Mercury was named by the Romans after the fleet-footed messenger of the gods because it seemed to move more quickly than any other planet. It is the closest planet to the Sun, and second smallest planet in the solar system. Its diameter is 40% smaller than Earth and 40% larger than the Moon.",
      assetView: ''),
  Planet(
      name: "Moon",
      gravity: "1.62",
      distance: "3,474.8 km",
      dte: "384,400 km",
      dts: "150 million km",
      price: "2.0m",
      galaxy: "Milkyway Glaxey",
      asset: "Assets/p3.png",
      url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQW_otoH3XuO8yhEUkb3SoeUmk60flkYID3YA&usqp=CAU",
      overView:
          "Moons – also known as natural satellites – orbit planets and asteroids in our solar system. Earth has one moon, and there are more than 200 moons in our solar system. Most of the major planets – all except Mercury and Venus – have moons.",
      assetView: ''),
  Planet(
      name: "Neptune",
      gravity: "11.15",
      distance: "49,244 km",
      dte: "4.3264 billion km",
      dts: "4.4751 billion km",
      price: "18.6m",
      galaxy: "Milkyway Glaxey",
      asset: "Assets/p4.png",
      url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNQCjcZxZbG2c7u0Dmwn_n9PeQngYX15Zkfg&usqp=CAU",
      overView:
          "Neptune is the eighth and farthest known Solar planet from the Sun. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth, slightly more massive than its near-twin Uranus. Neptune is denser and physically smaller than Uranus because its greater mass causes more gravitational compression of its atmosphere",
      assetView: ''),
  Planet(
      name: "Earth",
      gravity: "9.807",
      distance: "12,742 km",
      dte: "0.00",
      dts: "150.15 million km",
      price: "free",
      galaxy: "Milkyway Glaxey",
      asset: "Assets/p5.png",
      url:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSO0aLHlkZjmJbhgtYOu2-7Z6-AIK1a2wbyAQ&usqp=CAU",
      overView:
          "From the perspective we get on Earth, our planet appears to be big and sturdy with an endless ocean of air. From space, astronauts often get the impression that the Earth i small with a thin, fragile layer of atmosphere. For a space traveler, the distinguishing Eart features are the blue waters, brown and green land masses and white clouds set against a black background.Many dream of traveling in space and viewing the wonders of the universe. In reality all of us are space travelers.",
      assetView: ''),
  Planet(
    name: "Jupiter",
    gravity: "24.79",
    distance: "139,820 km",
    dte: "624.43 million km",
    dts: "750.8 million km",
    price: "35.4m",
    galaxy: "Milkyway Glaxey",
    asset: "Assets/p6.png",
    url:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeGa_2rAM5k9DyDRSYZAAUP0Zr37ASslH4vA&usqp=CAU",
    overView:
        "Jupiter has a long history of surprising scientists – all the way back to 1610 whenGalileo Galilei found the first moons beyond Earth. That discovery changed the way we see theuniverse.The LatestFull Moon Guide: September - October 2021Jupiter ResourcesFifth in linefrom the Sun, Jupiter is, by far, the largesplanet in the solar system – more than twice as massive as all the other planets combined.",
    assetView: 'Assets/p6.png',
  )
];
