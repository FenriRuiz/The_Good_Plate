import 'package:flutter/material.dart';

//import 'start:math';
class GuillotineMenu extends StatefulWidget {
  @override
  _GuillotineMenuState createState() => _GuillotineMenuState();
}

class _GuillotineMenuState extends State<GuillotineMenu>
    with SingleTickerProviderStateMixin {
  AnimationController animationControllerMenu;
  Animation<double> animationMenu;
  Animation<double> animationTitleFadeInOut;
  _GuillotineAnimationStatus menuAnimationStatus;
  TextEditingController _controller = TextEditingController();

  double pi = 3.14;

  final List<Map> _menus = <Map>[
    {
      "icon": Icons.person,
      "title": "profile",
      "color": Colors.white,
    },
    {
      "icon": Icons.view_agenda,
      "title": "feed",
      "color": Colors.white,
    },
    {
      "icon": Icons.swap_calls,
      "title": "activity",
      "color": Colors.cyan,
    }
  ];

  @override
  void initState() {
    super.initState();
    menuAnimationStatus = _GuillotineAnimationStatus.closed;

//Inicialización del controlador de la animacion
    animationControllerMenu = new AnimationController(
        duration: const Duration(
          milliseconds: 1000,
        ),
        vsync: this)
      ..addListener(() {});

    //Inicialización de la animación de la apariencia del menu
    animationMenu =
        new Tween(begin: -pi / 2.0, end: 0.0).animate(new CurvedAnimation(
      parent: animationControllerMenu,
      curve: Curves.bounceOut,
      reverseCurve: Curves.bounceIn,
    ))
          ..addListener(() {
            setState(() {
              //*force refresh
            });
          })
          ..addStatusListener((AnimationStatus status) {
            if (status == AnimationStatus.completed) {
              menuAnimationStatus = _GuillotineAnimationStatus.open;
            } else if (status == AnimationStatus.dismissed) {
              menuAnimationStatus = _GuillotineAnimationStatus.closed;
            } else {
              menuAnimationStatus = _GuillotineAnimationStatus.animating;
            }
          });
    //*Inicializar la animacion in/out del titulo
    animationTitleFadeInOut =
        new Tween(begin: 1.0, end: 0.0).animate(new CurvedAnimation(
      parent: animationControllerMenu,
      curve: new Interval(
        0.0,
        0.5,
        curve: Curves.ease,
      ),
    ));
  }

  @override
  void dispose() {
    animationControllerMenu.dispose();
    super.dispose();
  }

//*Empezar la animacion dependiendo del estado de menu
  void _playAnimation() {
    try {
      if (menuAnimationStatus == _GuillotineAnimationStatus.animating) {
        //*Durante la animaciion, no hacer nada
      } else if (menuAnimationStatus == _GuillotineAnimationStatus.closed) {
        animationControllerMenu.forward().orCancel;
      } else {
        animationControllerMenu.reverse().orCancel;
      }
    } on TickerCanceled {
      //*La animacion es canccelada
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    double angle = animationMenu.value;

    return new Transform.rotate(
      angle: angle,
      origin: new Offset(24.0, 56.0),
      alignment: Alignment.topLeft,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: screenWidth,
          height: screenHeight,
          color: Color(0xFF333333),
          child: new Stack(
            children: <Widget>[
              //*Titulo menu
              new Positioned(
                top: 32.0,
                left: 40.0,
                width: screenWidth,
                height: 24.0,
                child: new Transform.rotate(
                    alignment: Alignment.topLeft,
                    origin: Offset.zero,
                    angle: pi / 2.0,
                    child: new Center(
                      child: new Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: new Opacity(
                          opacity: animationTitleFadeInOut.value,
                          //TODO: Poner el buscador en condiciones
                          
                          child: TextField(
                              controller: _controller,
                              style: TextStyle(
                                  fontFamily: 'Montserrat', fontSize: 18.0),
                              decoration: InputDecoration(
                                  labelText: "Buscar...",
                                  hintText: "Buscar...",
                                  prefixIcon: Icon(Icons.search),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0))))),
                        ),
                      ),
                    )),
              ),
              //*Icono Hamburguesa
              new Positioned(
                top: 32.0,
                left: 4.0,
                child: new IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: _playAnimation,
                ),
              ),
              //*Contenido menu
              new Padding(
                padding: const EdgeInsets.only(left: 64.0, top: 96.0),
                child: new Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _menus.map((menuItem) {
                      return new ListTile(
                        leading: new Icon(
                          menuItem["icon"],
                          color: menuItem["color"],
                        ),
                        title: RaisedButton(
                          //TODO: Personalizar los botones del menu
                          color: Color(0xFF333333),
                          splashColor: Color.fromRGBO(100, 230, 235, 100),
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            print('Button clicked');
                          },
                          child: new Text(
                            menuItem["title"],
                            style: new TextStyle(
                                color: menuItem["color"], fontSize: 24.0),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum _GuillotineAnimationStatus { closed, open, animating }
