import 'package:get/get.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'title': 'Flutter Demo',
          'home': 'Flutter Demo Home Page',
          'pushed': 'You have pushed the button this many times:',

          //login
          "welcome": "Welcome To Embark \nJourney",
          'email': 'Email',
          'password': 'Password',
          'hint_email': 'Enter the Email',
          'hint_password': 'Enter the Password',
          'login': "Login",

          //home
          "training": "TRAINING HISTORY",
          "work": "WORK HISTORY",
          "working_on": "working on",
          "insurance": "INSURANCE",
          "expire_date": "Expire Date",
          "course": "COURSES",
          "report": "REPORTS",
          "certificate": "CERTIFICATES",
        }
      };
}
