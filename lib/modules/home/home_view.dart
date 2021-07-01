import 'package:custommarker/modules/home/home_controller.dart';
import 'package:custommarker/modules/maps/maps_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

final controller = HomeController();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google maps Markers'),
        centerTitle: true,
      ),
      body: Center(child: MapsView(page: controller.initialPage)),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: (controller.initialPage == 0) ? MaterialStateProperty.all<Color>(Colors.green.shade900) : null,
              ),
              onPressed: () {
                setState(() {
                  controller.changePage(0);
                });
              },
              icon: Icon(Icons.map_sharp),
              label: Text("Regular Markers"),
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: (controller.initialPage == 1) ? MaterialStateProperty.all<Color>(Colors.green.shade900) : null,
              ),
              onPressed: () {
                setState(() {
                  controller.changePage(1);
                });
              },
              icon: Icon(Icons.map_sharp),
              label: Text("Custom Markers"),
            ),
          ],
        ),
      ),
    );
  }
}
