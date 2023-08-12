import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../res/color.dart';
import '../res/components/round_botton.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode =FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height *1;

    return Container(
      decoration:const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/register.png'),fit:BoxFit.cover)),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: AppColors.appbarColor,
            title: const Text("Traveller",style: TextStyle(fontWeight: FontWeight.bold)),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Stack(
              children: [
                Container(
                  padding:const EdgeInsets.only(top: 80,left: 115) ,
                  child: const Text("REGISTER",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight:FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        focusNode: emailFocusNode,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            labelText: "Email",
                            hintText: "Enter your email",
                            prefixIcon: const Icon(Icons.email_outlined,color: Colors.white,),

                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            )
                        ),
                        onFieldSubmitted: (value){
                          Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
                        },
                      ),
                      const SizedBox(height: 35,),
                      ValueListenableBuilder(
                          valueListenable: _obsecurePassword,
                          builder: (context, value, child){
                            return TextFormField(
                              controller: _passwordController,
                              focusNode: passwordFocusNode,
                              obscureText: _obsecurePassword.value,
                              obscuringCharacter: '*',
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                hintText:'Enter your password',
                                labelText: "Password",
                                labelStyle: const TextStyle(color: Colors.white),
                                hintStyle: const TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                prefixIcon: const Icon(Icons.lock_open_outlined,color: Colors.white,),
                                suffixIcon: InkWell(
                                    onTap: (){
                                      _obsecurePassword.value = !_obsecurePassword.value;
                                    },
                                    child: Icon(
                                      _obsecurePassword.value ? Icons.visibility_off_outlined :
                                      Icons.visibility,color: Colors.white,
                                    )),
                              ),
                            );
                          }
                      ),
                      SizedBox(height: height * .06,),
                      RoundButton(
                        title: 'Sign Up',
                        loading: authViewModel.signUploading,
                        onPress: (){
                          if(_emailController.text.isEmpty){
                            Utils.flushBarErrorMessage("Please enter email", context);
                          }else if(_passwordController.text.isEmpty){
                            Utils.flushBarErrorMessage("Please enter password", context);
                          }else if(_passwordController.text.length<6){
                            Utils.flushBarErrorMessage("Please enter 6 digit password", context);
                          }else{
                            Map data = {
                              'email' : _emailController.text.toString(),
                              'password' : _passwordController.text.toString(),
                            };
                            authViewModel.signUpApi(data, context);
                            print('api hit');
                          }
                        },),
                      SizedBox(height: height *.04,),
                      InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, RoutesName.login);
                            },
                          child: const Text("Already have an account? Login",style: TextStyle(color: Colors.white),)),
                    ],
                  ),
                ),
              ]
          )
      ),
    );
  }
}