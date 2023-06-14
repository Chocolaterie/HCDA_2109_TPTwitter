import 'package:flutter/material.dart';

class TweetButton extends StatelessWidget{

  String label;

  TweetButton(this.label);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(this.label, textAlign: TextAlign.center));
  }
}

class ContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        // Image + Texte
        Container(
          height: 150,
          child: Flex(
            direction: Axis.horizontal,
            children: [
              SizedBox(
                width: 150,
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTK2nG24AYDm6FOEC7jIfgubO96GbRso2Xshu1f8abSYQ&s",
                  fit: BoxFit.contain,
                ),
              ),
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            "PizzaAnanas@Chocolatine.fr",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            '50s',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                            "Merde j'ai plus de pierres qu'est-ce qu'on fait?"
                            " Allez-y mollo avec la joie!"
                            " Sire, mon père était peut-être unijambiste mais,"
                            " moi, ma femme a pas de moustache! "
                            "Mais Attila vous y attend, Sire! Attila! Le Fléau de Dieu! "),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              TweetButton("Répondre"),
              TweetButton("Retweet"),
              TweetButton("Favoris"),
            ],
          ),
        )
      ],
    );
  }
}
