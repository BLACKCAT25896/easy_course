import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_course/common/widget/custom_button.dart';
import 'package:easy_course/common/widget/custom_snackbar.dart';
import 'package:easy_course/common/widget/custom_text_field.dart';
import 'package:easy_course/feature/authentication/logic/authentication_controller.dart';
import 'package:easy_course/helper/email_checker.dart';
import 'package:get/get.dart';
import 'package:easy_course/util/images.dart';
import 'package:easy_course/util/styles.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {






  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    emailController.text = Get.find<AuthenticationController>().getEmail();
    passwordController.text = Get.find<AuthenticationController>().getPassword();
    if(Get.find<AuthenticationController>().getEmail().isNotEmpty){
      Get.find<AuthenticationController>().toggleRememberMe(remember: true, notify: false);
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color(0xFF023D45),
      body: GetBuilder<AuthenticationController>(
          builder: (onboardingController) {
            return Stack( children: [




              Positioned(left: Get.width * .30, child: const Shadow()),
              const Positioned(child: Shadow()),



              Positioned(left: - 20, top: Get.height * .25, child: const RevShadow()),
              Positioned(left: Get.width * .30, top: Get.height * .25, child: const RevShadow()),
              Positioned(left: Get.width * .60, top: Get.height * .25, child: const RevShadow()),


              Positioned(top: Get.height * .15,left: 50,right: 50,
                  child: Image.asset(Images.logo)),

              Align(alignment: Alignment.bottomCenter,
                child: Container(height: Get.height * .558, width: Get.width,
                  decoration: BoxDecoration(
                    color: const Color(0xFF012F35),
                    borderRadius: BorderRadius.circular(40),

                  ),

                ),
              ),

              Align(alignment: Alignment.bottomCenter,
                child: Container(height: Get.height * .55, width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF135E6A),
                        Color(0xFF0E5661),
                        Color(0xFF053138),

                      ],
                    ),

                  ),child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
                    child: Column(children: [
                      Text("Sign In", style: textSemiBold.copyWith(fontSize: 30, color: Colors.white)),

                      CustomTextField(title: "Email",hintText: "example@gmail.com",
                      controller: emailController,),
                      CustomTextField(isPassword: true,hintText: "● ● ● ● ● ● ● ● ● ● ● ●",
                        controller: passwordController,
                        title: "Password",),


                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(children: [
                          Transform.translate(
                              offset: const Offset(-14, 0),
                              child: Checkbox(value: onboardingController.isActiveRememberMe,
                                  onChanged: (value) {
                                    onboardingController.toggleRememberMe(remember: value??false);
                                  },
                                  activeColor: Colors.white, checkColor: Theme.of(context).primaryColor,
                                  side: BorderSide(color:  Theme.of(context).hintColor, width: 2))),

                          Expanded(child: Transform.translate(
                              offset: const Offset(-14, 0),
                              child: Text("Remember me",style: textMedium.copyWith(color: Colors.white)))),

                        ]),
                      ),

                      onboardingController.isLoading?
                          const Center(child: CircularProgressIndicator()):
                      CustomButton(onTap: (){
                        String email = emailController.text.trim();
                        String password = passwordController.text.trim();
                        if(email.isEmpty){
                          showCustomSnackBar("Enter email");
                        }
                        else if(EmailChecker.isNotValid(email)){
                          showCustomSnackBar("Invalid email");
                        }

                        else if(password.isEmpty){
                          showCustomSnackBar("Password is empty".tr);
                        }
                        else{
                          if(onboardingController.isActiveRememberMe){
                            onboardingController.saveEmailAndPassword(email, password);
                          }else{
                            onboardingController.clearUserEmailAndPassword();
                          }
                          onboardingController.login(email, password);
                        }
                      }, text: "Login")

                    ],),
                  ),
                ),
              ),



            ],
            );
          }
      ),
    );
  }
}



class Shadow extends StatelessWidget {
  const Shadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 200,height: 200,decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0x00FFFFFF),
            Color(0x00FFFFFF),
            Color(0x10FFFFFF),

          ],
        ),
        borderRadius: BorderRadius.circular(123)
    ),);
  }
}


class RevShadow extends StatelessWidget {
  const RevShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: Get.width/1.75,height: Get.width/1.75,decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [

            Color(0x10FFFFFF),
            Color(0x00FFFFFF),
            Color(0x00FFFFFF),

          ],
        ),
        borderRadius: BorderRadius.circular(123)
    ),);
  }
}

