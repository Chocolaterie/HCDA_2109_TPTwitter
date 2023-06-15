import 'package:flutter/material.dart ';
import 'package:tp_twitter/tweet/footer.dart';
import 'package:tp_twitter/tweet/header.dart';
import 'package:tp_twitter/tweet/tweet-card.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:tp_twitter/tweet/tweet.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class TweetPage extends StatefulWidget {
  @override
  State<TweetPage> createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage> {
  // la liste de tweet (la donnée)
  var tweets = [];
  ProgressDialog? pgDl;


  /**
   * Afficher une chargement
   */
  void showProgress(){
    ///= Create progress dialog
    pgDl = ProgressDialog(context: context);

    // Display progress
    pgDl!.show(
        msg: 'Récupération des Tweets...',
        progressBgColor: Colors.transparent,
        elevation: 10.0,
        barrierColor: Color(0x77000000)
    );
  }

  void callApi() async {
    // Affiche le chargement
    showProgress();

    // Preparer l'url
    var url = Uri.parse(
        "https://raw.githubusercontent.com/Chocolaterie/EniWebService/main/api/tweets.json");

    // Simuler 3 secondes d'attente
    await Future.delayed(Duration(seconds: 1));

    // Appel api
    var response = await http.get(url);

    // résponse valide
    if (response.statusCode == 200) {
      // Notifier au widget qu'il doit rafraichir la vue et mapper le json en liste de tweets
      setState(() {
        // le mapping
        tweets = convert
            .jsonDecode(response.body)
            .map((data) => Tweet.fromJson(data))
            .toList();

        // Fermer le chargemet
        pgDl!.close();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          // Header
          Header(),
          // Content
          Expanded(
              child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      callApi();
                    },
                    child: Text("Rafraichir"),
                  )),
              Expanded(
                child: ListView.builder(
                    itemCount: tweets.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TweetCard();
                    }),
              ),
            ],
          )),
          // Footer
          Footer(),
        ],
      ),
    );
  }
}
