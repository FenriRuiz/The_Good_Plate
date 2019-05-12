import 'package:flutter/material.dart';
import 'package:the_good_plate/rutas/editarPerfil.dart';
import 'package:the_good_plate/auxiliar/guillotinaMenu.dart';
import 'package:the_good_plate/rutas/modificarPerfil.dart';

class AnimatedFab extends StatefulWidget {
  final VoidCallback onClick;

  const AnimatedFab({Key key, this.onClick}) : super(key: key);

  @override
  _AnimatedFabState createState() => new _AnimatedFabState();
}

class _AnimatedFabState extends State<AnimatedFab>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorAnimation;

  final double expandedSize = 180.0;
  final double hiddenSize = 20.0;

  @override
  void initState() {
    super.initState();
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    _colorAnimation = new ColorTween(
            begin: Color.fromRGBO(200, 69, 59, 100),
            end: Color.fromRGBO(127, 42, 36, 100))
        .animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: expandedSize,
      height: expandedSize,
      child: new AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return new Stack(
            alignment: Alignment.center,
            children: <Widget>[
              _buildExpandedBackground(),
              _buildOption(Icons.edit, 0.0),
              _buildOption(Icons.flash_on, -3.14 / 3),
              _buildOption(Icons.access_time, -2 * 3.14 / 3),
              _buildOption(Icons.error_outline, 3.14),
              _buildFabCore(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOption(IconData icon, double angle) {
    if (_animationController.isDismissed) {
      return Container();
    }
    double iconSize = 0.0;
    if (_animationController.value > 0.8) {
      iconSize = 26.0 * (_animationController.value - 0.8) * 5;
    }
    return new Transform.rotate(
      angle: angle,
      child: new Align(
        alignment: Alignment.topCenter,
        child: new Padding(
          padding: new EdgeInsets.only(
            top: 8.0,
          ),
          child: new IconButton(
            onPressed: () {
              _onIconclick(icon);
            },
            icon: new Transform.rotate(
              angle: -angle,
              child: new Icon(
                icon,
                color: Colors.white,
              ),
            ),
            iconSize: iconSize,
            alignment: Alignment.center,
            padding: new EdgeInsets.all(0.0),
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedBackground() {
    double size =
        hiddenSize + (expandedSize - hiddenSize) * _animationController.value;
    return new Container(
      height: size,
      width: size,
      decoration: new BoxDecoration(
          shape: BoxShape.circle, color: Color.fromRGBO(200, 69, 59, 100)),
    );
  }

  Widget _buildFabCore() {
    double scaleFactor = 2 * (_animationController.value - 0.5).abs();
    return new FloatingActionButton(
      onPressed: _onFabTap,
      child: new Transform(
        alignment: Alignment.center,
        transform: new Matrix4.identity()..scale(1.0, scaleFactor),
        child: new Icon(
          _animationController.value > 0.5 ? Icons.close : Icons.add_circle,
          color: Colors.white,
          size: 26.0,
        ),
      ),
      backgroundColor: _colorAnimation.value,
    );
  }

  open() {
    if (_animationController.isDismissed) {
      _animationController.forward();
    }
  }

  close() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    }
  }

  _onFabTap() {
    if (_animationController.isDismissed) {
      open();
    } else {
      close();
    }
  }

  _onIconclick(icono) {
    if (icono == Icons.edit) {
      // Fluttertoast.showToast(msg: "No disponible ");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((BuildContext context) => EditarPerfil())));
    } else if (icono == Icons.flash_on) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((BuildContext context) => ModificarPerfil())));
      /*  } else if (opc == "Mapa") {
      Navigator.push(context, buildMaterialPageMaps());
    } else if (opc == "Ajustes de cuenta") {
      Navigator.push(context, buildMaterialPagePerfil());
    }*/
      close();
    }
  }
}
