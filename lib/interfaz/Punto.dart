import 'package:flutter/widgets.dart';

class Punto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/punto.png'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}


/*Container(
                  width: 35,
                  height: 35,
                  child: Punto(),
                ),*/
