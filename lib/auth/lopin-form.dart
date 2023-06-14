import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  var formKey = GlobalKey<FormState>();

  void onSubmit() {
    // Contrôle de surface
    if (formKey.currentState!.validate()) {
      // Connexion reussi
      Navigator.pushNamed(context, "/tweet");
    }

  }

  /*
    * Valider le mot de passe
   */
  String? validatePassword(String? value) {
    if (value!.length < 5) {
      return "Mot de passe non sécurisé";
    }
    return null;
  }

  /*
    * Valider l'email
   */
  String? validateEmail(String? value) {
    if (!EmailValidator.validate(value!)) {
      return "Email invalide";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Connexion Twitter",
                style: TextStyle(color: Colors.black54),
              ),
            ),
            TextFormField(
                decoration: InputDecoration(labelText: "Identifiant"),
                validator: validateEmail),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(labelText: "Mot de passe", ),
              validator: validatePassword,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Switch(value: false, onChanged: (value) {}),
                  Text("Mémoriser mes informations",
                      style: TextStyle(color: Colors.black54))
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Connexion"),
                  ),
                  onPressed: onSubmit),
            )
          ],
        ),
      ),
    );
  }
}
