import 'package:flutter/material.dart';
import 'package:flutter_app_expensetracker/pages/HomePage.dart';
import 'package:flutter_app_expensetracker/pages/LoginScreen.dart';

class SignUpUser extends StatefulWidget {
  @override
  _SignUpUserState createState() => _SignUpUserState();
}

class _SignUpUserState extends State<SignUpUser> {
  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [primary, primary],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .1,
              ),
              buildAppLogo(),
              const SizedBox(
                height: 20,
              ),
              buildLoginLabel(),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                hint: 'Name',
                secure: false,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: 'Username',
                secure: false,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: 'Password',
                secure: true,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: 'Confirm Password',
                secure: true,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: 'Email',
                secure: false,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: 'Mobile Number',
                secure: false,
              ),
              const SizedBox(
                height: 20,
              ),
              buildSignUpButton(primary),
            ],
          ),
        ),
      ),
    );
  }

  Center buildAppLogo() {
    return const Center(
      child: Icon(Icons.monetization_on_sharp,
        color: Colors.white,
        size: 90,
      ),
    );
  }

  Center buildSignUpButton(Color primary) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => HomePage()));
        },
        color: Colors.white,
        child: Text(
          'SignUp!',
          style: TextStyle(
            color: primary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  Padding buildForgotPasswordLink() {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Forgot Password?',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Padding buildLoginLabel() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Center(
        child: Text(
          'Create your account',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: 'quicksand',
          ),
        ),
      ),
    );
  }
}
