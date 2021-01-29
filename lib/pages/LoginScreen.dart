import 'package:flutter/material.dart';
import 'package:flutter_app_expensetracker/pages/HomePage.dart';
import 'package:flutter_app_expensetracker/pages/SignUpScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [primary, primary],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * .2,
            ),
            buildAppLogo(),
            const SizedBox(
              height: 20,
            ),
            buildLoginLabel(),
            const SizedBox(
              height: 40,
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
            buildForgotPasswordLink(),
            const SizedBox(
              height: 20,
            ),
            buildLoginButton(primary),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => SignUpUser()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",style: TextStyle(color: Colors.white, fontSize: 14),),
                  Text("Sign Up ",style: TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),),
                ],
              ),
            )
          ],
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

  Center buildLoginButton(Color primary) {
    return Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => HomePage()));
              },
              color: Colors.white,
              child: Text(
                'Login!',
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
          'Login with your account details',
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

class CustomTextField extends StatelessWidget {
  final String hint;
  final bool secure;
  const CustomTextField({this.hint, this.secure});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25),
      child: TextField(
        obscureText: secure,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.white.withOpacity(.5),
              fontSize: 18,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w700,
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(.3),
            focusColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.transparent),
            )),
      ),
    );
  }
}
