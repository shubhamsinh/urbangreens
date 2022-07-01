import 'dart:io';

import 'package:flutter/material.dart';
import 'package:urbangreens/pages/signup-login/signin.dart';
import 'package:urbangreens/pages/signup-login/signup.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class profilePageGuest extends StatefulWidget {
  const profilePageGuest({Key? key}) : super(key: key);

  @override
  State<profilePageGuest> createState() => _profilePageGuestState();
}

class _profilePageGuestState extends State<profilePageGuest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //start app bar
          Container(
            color: Colors.white,
            height: 55,
            margin: EdgeInsets.only(top: 32),
            // padding: EdgeInsets.only(left: 15, right: 15, top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.arrow_back,
                          size: 28,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Account",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                InkWell(
                  child: Container(
                    height: 50,
                    width: 58,
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      size: 28,
                    ),
                  ),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const ProductPage()),
                    // );
                  },
                ),
              ],
            ),
          ),
          //end app bar
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const signupPage()),
                      );
                    },
                    child: Text("Create Account"),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const signinPage()));
                      // var client = new http.Client();
                      // try {
                      //   var url = Uri.parse(
                      //       'https://urbangreens.000webhostapp.com/user.php');
                      //   var response = await client.get(url);
                      //   print(response.statusCode);
                      //   print(response.body);
                      // } finally {
                      //   client.close();
                      // }
                    },
                    child: Text("Log In"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
