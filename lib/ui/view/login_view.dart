import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itrip/ui/view/splash_view.dart';
import 'package:itrip/ui/widget/common/button_primary.dart';
import 'package:itrip/ui/widget/common/colored_safe_area.dart';
import 'package:itrip/ui/widget/login/header_arc.dart';
import 'package:itrip/use_cases/bloc/login_bloc/login_bloc.dart';
import 'package:itrip/utils/colors_app.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

// class _LoginViewState extends State<LoginView> {
//   bool _obscurePassword = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: ColorsApp.primaryColor,
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   height: MediaQuery.sizeOf(context).height / 3,
//                   width: MediaQuery.sizeOf(context).width,
//                   decoration: BoxDecoration(
//                     color: ColorsApp.primaryColor,
//                     borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(50),
//                       bottomRight: Radius.circular(50),
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset("assets/img/logo.png", width: 200),
//                       const SizedBox(height: 64),
//                       Image.asset("assets/img/beach.png", width: 192),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: SizedBox(
//                     width: MediaQuery.sizeOf(context).width,
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           width: MediaQuery.sizeOf(context).width,
//                           child: Text(
//                             "Bienvenido(a) ingresa tus datos",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 30),
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 16.0),
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(color: Colors.grey, width: 1),
//                             ),
//                             child: TextField(
//                               decoration: const InputDecoration(
//                                 border: InputBorder.none,
//                                 hintText: "Correo Electrónico",
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(bottom: 16.0),
//                           child: Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 16),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(color: Colors.grey, width: 1),
//                             ),
//                             child: TextField(
//                               obscureText: _obscurePassword,
//                               decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 hintText: "Contraseña",
//                                 suffixIcon: IconButton(
//                                   icon: Icon(
//                                     _obscurePassword
//                                         ? Icons.visibility_off
//                                         : Icons.visibility,
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       _obscurePassword = !_obscurePassword;
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: MediaQuery.sizeOf(context).width,
//                           child: GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const SplashView(),
//                                 ),
//                               );
//                             },
//                             child: const Text(
//                               "Olvidé mi contraseña",
//                               style: TextStyle(
//                                 color: Color(0xFF008FC8),
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 30),
//                         SizedBox(
//                           width: MediaQuery.sizeOf(context).width,
//                           child: ElevatedButton(
//                             style: ButtonStyle(
//                               backgroundColor: WidgetStatePropertyAll(
//                                 Color(0xFF008FC8),
//                               ),
//                               shape: WidgetStatePropertyAll(
//                                 RoundedRectangleBorder(
//                                   borderRadius: BorderRadiusGeometry.circular(10),
//                                 ),
//                               ),
//                             ),
//                             onPressed: () async {
//                               String url =
//                                   "https://api.escuelajs.co/api/v1/auth/login";
//                               Map<String, String> headers = {
//                                 "Content-Type": "application/json",
//                               };
//                               Map<String, String> body = {
//                                 "email": "john@mail.com",
//                                 "password": "changeme",
//                               };
//                               http.Response response = await http.post(
//                                 Uri.parse(url),
//                                 headers: headers,
//                                 body: jsonEncode(body),
//                               );
//                               print(response.statusCode);
//                               print(response.body);
//                             },
//                             child: Text(
//                               "Iniciar Sesión",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class _LoginViewState extends State<LoginView> {
  bool _obscurePassword = true;
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is SuccesLoginState) {
            Navigator.of(context).pushReplacementNamed("/home");
          }
        },
        child: ColoredSafeArea(
          color: ColorsApp.primaryColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderArc(
                  child: Container(
                    color: ColorsApp.primaryColor,
                    height: MediaQuery.sizeOf(context).height / 3,
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/img/logo.png", width: 200),
                        const SizedBox(height: 32),
                        Image.asset("assets/img/beach.png", width: 192),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Form(
                      key: _keyForm,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bienvenido(a) ingresa tus datos",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _ctrlEmail,
                            autofillHints: [AutofillHints.newUsername],
                            decoration: InputDecoration(
                              labelText: "Correo Electrónico",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: (v) {
                              if (v != null && v.isNotEmpty) {
                                if (v.contains("@")) {
                                  return null;
                                } else {
                                  return "Debes de ingresar un correo electrónico válido";
                                }
                              } else {
                                return "Debes ingresar un correo electrónico";
                              }
                            },
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: _ctrlPassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              labelText: "Contraseña",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                            ),
                            obscureText: _obscurePassword,
                            autofillHints: [AutofillHints.newPassword],
                            textInputAction: TextInputAction.done,
                            validator: (v) {
                              if (v != null && v.isNotEmpty) {
                                return null;
                              } else {
                                return "Debes ingresar un correo electrónico";
                              }
                            },
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SplashView(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Olvidé mi contraseña",
                                style: TextStyle(
                                  color: Color(0xFF008FC8),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: ButtonPrimary(
                              onClick: () async {
                                if (_keyForm.currentState!.validate()) {
                                  BlocProvider.of<LoginBloc>(context).add(
                                    DoLoginEvent(
                                      email: _ctrlEmail.text,
                                      password: _ctrlPassword.text,
                                    ),
                                  );
                                }
                              },
                              text: "Iniciar Sesión",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
