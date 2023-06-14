
import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {

  String? label;
  String? iconPath;

  HeaderButton({this.label, this.iconPath});

  Widget checkButton(){
    // Si icon path est renseignée, alors afficher un icon button
    if (this.iconPath != null){
      return IconButton(onPressed: () {}, icon: Image.asset(this.iconPath!));
    }
    // Sinon par défaut le text habituel
    return Text(
      this.label!,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
       child: checkButton());
  }

}

class Header extends  StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Color(0xFF58B0F0),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            HeaderButton(iconPath : "/images/pencil.png"),
            HeaderButton(label : "Accueil"),
            HeaderButton(iconPath: "/images/search.png",),
          ],
        ),
      ),
    );
  }


}