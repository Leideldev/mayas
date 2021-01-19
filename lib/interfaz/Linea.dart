import 'package:flutter/widgets.dart';

class Linea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/linea.png'),
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
                  child: Linea(),
                ), */
