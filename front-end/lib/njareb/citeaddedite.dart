// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/njareb/api_service.dart';
// import 'package:flutter_application_1/njareb/cite_list.dart';
// import 'package:flutter_application_1/njareb/citemodel.dart';
// import 'package:http/http.dart';
// import 'package:snippet_coder_utils/FormHelper.dart';
// import 'package:snippet_coder_utils/ProgressHUD.dart';
// import 'package:snippet_coder_utils/hex_color.dart';

// class CiteAdd extends StatefulWidget {
//   CiteAdd({Key? key}) : super(key: key);

//   @override
//   State<CiteAdd> createState() => _CiteAddState();
// }

// class _CiteAddState extends State<CiteAdd> {
//   static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
//   bool isAPICallProcess = false;
//   CiteModel? citeModel;

//   bool isEditMode = false;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       appBar: AppBar(),
//       body: ProgressHUD(
//         child: Form(key: globalKey, child: citeForm()),
//         inAsyncCall: isAPICallProcess,
//         opacity: .3,
//         key: UniqueKey(),
//       ),
//     ));
//   }

//   @override
//   void initState() {
//     super.initState();
//     citeModel = CiteModel(
//         area: '',
//         description: '',
//         id: '',
//         lattitude: null,
//         longitude: null,
//         userid: '');

//     Future.delayed(Duration.zero, () {
//       if (ModalRoute.of(context)?.settings.arguments != null) {
//         final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;

//         citeModel = arguments["model"];
//         isEditMode = true;
//         setState(() {});
//       }
//     });
//   }

//   Widget citeForm() {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(bottom: 10, top: 10),
//             child: FormHelper.inputFieldWidget(
//               context,
//               // const Icon(Icons.ac_unit),
//               "area",
//               "name Cite",
//               (onValidateVal) {
//                 if (onValidateVal.isEmpty) {
//                   return 'name Cite is not empty';
//                 }

//                 return null;
//               },
//               (onSavedVal) {
//                 citeModel!.area = onSavedVal;
//               },
//               initialValue: citeModel!.area!,
//               borderColor: Colors.black,
//               borderFocusColor: Colors.black,
//               textColor: Colors.black.withOpacity(.7),
//               borderRadius: 10,
//               showPrefixIcon: false,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(bottom: 10, top: 10),
//             child: FormHelper.inputFieldWidget(
//               context,
//               // const Icon(Icons.ac_unit),
//               "description",
//               "description Cite",
//               (onValidateVal) {
//                 if (onValidateVal.isEmpty) {
//                   return 'nam Cite is not empty';
//                 }

//                 return null;
//               },
//               (onSavedVal) {
//                 citeModel!.description = onSavedVal;
//               },
//               initialValue: citeModel!.description!,
//               // initialValue: citeModel!.description ?? "",
//               borderColor: Colors.black,
//               borderFocusColor: Colors.black,
//               textColor: Colors.black.withOpacity(.7),
//               borderRadius: 10,
//               showPrefixIcon: false,
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Center(
//             child: FormHelper.submitButton("Save", () {
//               if (validateAndSave()) {
//                 setState(() {
//                   isAPICallProcess = true;
//                 });
//                 APIService.update("").then((response) {
//                   setState(() {
//                     isAPICallProcess = false;
//                   });
//                   if (response != null) {
//                     Navigator.pushNamedAndRemoveUntil(
//                         context, "/CiteList", (route) => false);
//                   } else {
//                     FormHelper.showSimpleAlertDialog(
//                         context, "application", "error Occurse", "ok", () {
//                       Navigator.of(context).pop();
//                     });
//                   }
//                 });
//               }
//             },
//                 btnColor: HexColor("#283B71"),
//                 borderColor: Colors.white,
//                 borderRadius: 10),
//           )
//         ],
//       ),
//     );
//   }

//   bool validateAndSave() {
//     final form = globalKey.currentState;
//     if (form!.validate()) {
//       form.save();
//       return true;
//     }
//     return false;
//   }
// }
