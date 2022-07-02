// import 'dart:convert';
// //import 'dart:html';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter_application_1/njareb/citemodel.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class APIUser {
//   static var client = http.Client();
//   class _SignupState extends State<Signup> {
//   TextEditingController _nomController = TextEditingController();
//   TextEditingController _PrenomController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _confirmpasswordController = TextEditingController();

//   final GlobalKey<FormState> _key = GlobalKey();

//   //Future<User>
//   resetpassword( String email, String password) async {
//     var url = Uri.parse("http://192.168.1.190:3008/api/user/register");

//     String data = jsonEncode(
//         {'email': email, 'password': password});

//     print("ma7abch ye5dem  $data");
//     var response = await http.post(url,
//         headers: {"Content-type": "application/json"}, body: (data));

//     if (response.statusCode == 200) {
//       var jsonResponse = json.decode(response.body);
     
//       print("Response status : ${response.body}");

       
//     } else {
//       throw Exception('Fail to sign up user ');
//     }
//   }

//   }}
