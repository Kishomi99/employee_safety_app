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
          'dont_have_account': "Don't have an account?",
          'sign_up': "Sign Up",
          'role': 'Role',
          'val_role': 'Role is required',

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

          //signup
          'register_user': 'Register User',
          'hint_name': "Enter the Name",
          'val_name': 'Name is required',
          'hint_position': 'Enter the Position',
          'val_position': 'Position is required',
          'hint_current_work_place': 'Enter the Corrent Work Place',
          'val_current_work_place': 'Corrent Work Place is required',
          'hint_mobile_num': 'Enter the Mobile Number',
          'val_mobile_num': 'Mobile Number is required',
          'val_mobile_num2': 'Enter the valid Phone Number',
          'hint_role': 'Select the Role',
          'gender': 'Gender',
          'hint_gender': 'Select the Gender',
          'val_gender': 'Gender is required',
          'cancel': 'Cancel',

          //cancel
          "lbl_are_u_sure": "Are you sure?",
          "msg_are_u_sure": "Are you sure you want to discard all changes?",
          "msg_error": "Error",
          "lbl_yes": "Yes",
          "lbl_no": "No",
          //manager home

          "search": "Search",
          'report_tab': "Reports",
          'project_tab': "Projects",
          'employee_count': "Employees",
          "incident_reported": ' Incidents reported',
          'audit_report': 'Audit Reports',
        }
      };
}
