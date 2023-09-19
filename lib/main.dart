import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_animated_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff262433),
        appBar: AppBar(
          title: const Text('Magic Navigation Tabs Menu'),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({super.key});

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar>
     {

  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      alignment: Alignment.bottomCenter,
      // padding: const EdgeInsets.symmetric(horizontal: 30),
      // color: const Color(0xFF262433),
      child: Stack(
        // alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 150,
            child: Column(
              children: [
                const SizedBox(height: 50,),
                ClayContainer(
                  height: 100,
                  color: const Color(0xFF242433),
                borderRadius: 12,
                  spread: 2,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                    customBottomNavigationBarItems.length,
                    (index) => GestureDetector(

                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: AnimatedRow(
                              title: customBottomNavigationBarItems[index].label,
                              icon: customBottomNavigationBarItems[index].icon,
                              active: index == selectedIndex),
                        )

                    ),
              ),
            ),
          )
        ],
      ),
    );
  }


}

class AnimatedRow extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool active;

  AnimatedRow({required this.title, required this.icon, required this.active});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SizedBox(
          height: 70, // Use the animated value
          width: 70,
          child: Stack(
            alignment:   Alignment.center,
            children: [
              AnimatedOpacity(
                opacity: active ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: ClayContainer(
                  // Duration for size animation
                  height: 70, // Use the animated value
                  width: 70, // Use the animated value
                  color: Colors.blue,
                  curveType: CurveType.convex,
                  spread: 1,
                  depth: 3,

                  borderRadius: 50,

                ),
              ),
              SizedBox(
                height: 50,
                width: 50,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClayAnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: active ? 50 : 0,
                      height: active ? 50 : 0,
                      color: Color(0xff262433),
                      depth: 3,
                      customBorderRadius: BorderRadius.circular(50),
                      spread: 1,
                      parentColor: const Color(0xff262433).withOpacity(0.6),
                      curveType: CurveType.concave,

                    ),
                    AnimatedPadding(
                      padding:  EdgeInsets.only(top: active?0:35),
                      duration: const Duration(milliseconds: 500),
                      child: Icon(icon, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

          AnimatedOpacity(
            opacity: active ? 1.0 : 0.0,
            duration:  Duration(milliseconds:active? 500:0),
            // Adjust the duration as needed
            curve: Curves.easeInOut,
            // Adjust the curve as needed
            child: AnimatedSize(
              duration:  Duration(milliseconds:active? 500:0),
              // Adjust the duration as needed
              curve: Curves.easeInOut,
              // Adjust the curve as needed
              child: active
                  ? AnimatedPadding(
                duration:  Duration(milliseconds:active? 500:0),
                padding:  EdgeInsets.symmetric(vertical: active? 15:8),
                child: ClayContainer(
                  borderRadius: 8,
                  color: Colors.white,
                  spread: 1,
                  depth: 4,
                  emboss: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                    child: Text(title),
                  ),
                ),
              )
                  : const SizedBox(),
            ),
          ),


          AnimatedOpacity(
            opacity: active ? 1.0 : 0.0,
            duration:  Duration(milliseconds:active? 500:0),
            // Adjust the duration as needed
            curve: Curves.easeInOut,
            // Adjust the curve as needed
            child: AnimatedSize(
              duration:  Duration(milliseconds:active? 500:0),
              // Adjust the duration as needed
              curve: Curves.easeInOut,
              // Adjust the curve as needed
              child: active
                  ? Container(
                height: 6,
                width: 6,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  boxShadow: [
                    const BoxShadow(
                      color: Color(0xFF0084ff),
                      offset: Offset(1, 1),
                      blurRadius: 6,
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.25),
                      offset: const Offset(-1, 1),
                      blurRadius: 6,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(-1, -1),
                      blurRadius: 6,
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
              )
                  : const SizedBox(),
            ),
          ),
      ],
    );
  }
}

class CustomBottomNavigationBarItem {
  final IconData icon;
  final String label;

  CustomBottomNavigationBarItem({required this.icon, required this.label});
}

List<CustomBottomNavigationBarItem> customBottomNavigationBarItems = [
  CustomBottomNavigationBarItem(
    icon: Icons.home,
    label: 'Home',
  ),
  CustomBottomNavigationBarItem(
    icon: Icons.person,
    label: 'Profile',
  ),
  CustomBottomNavigationBarItem(
    icon: Icons.chat_bubble,
    label: 'Messages',
  ),
  CustomBottomNavigationBarItem(
    icon: Icons.camera,
    label: 'Photos',
  ),
  CustomBottomNavigationBarItem(
    icon: Icons.settings,
    label: 'Settings',
  ),
];


