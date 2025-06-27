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
          "val_email": "Email is required",
          "val_email2": "Enter a valid email address",
          "val_password": "Password is required",
          "val_password2": "Password must be at least 6 characters",
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
          "completed": "Completed",
          "pending": "Pending",
          "report": "REPORTS",
          "certificate": "CERTIFICATES",

          //profile
          "employee_id": "Employee ID",
          "name": "Name",
          "mob_num": "Mobile Number",
          "per_mail": "Personal Email",
          "position": "Position",
          "current_work_place": "Current Work Place",
          "logout": "Logout",
          "work_mail": "Work Email",
          "my_profile": "My Profile",

          //notification
          "notification": "Notifications",
        }
      };
}
