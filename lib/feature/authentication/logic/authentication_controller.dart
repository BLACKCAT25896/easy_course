import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_course/api_handle/api_checker.dart';
import 'package:easy_course/common/widget/custom_snackbar.dart';
import 'package:easy_course/feature/authentication/domain/model/business_type_model.dart';
import 'package:easy_course/feature/authentication/domain/model/create_account_body.dart';
import 'package:easy_course/feature/authentication/domain/repository/authentication_repository.dart';
import 'package:easy_course/helper/route_helper.dart';

class AuthenticationController extends GetxController implements GetxService{
  final AuthenticationRepository authenticationRepository;
  AuthenticationController({required this.authenticationRepository});


  bool isLoading = false;
  Future<void> login( String email, String password) async {
    isLoading = true;
    update();
    Response? response = await authenticationRepository.login(email: email, password: password);
    if(response!.statusCode == 200){
      isLoading = false;
      setUserToken(response.body['token']);
      Get.offAllNamed(RouteHelper.getDashboardRoute());
    }else{
      isLoading = false;
      ApiChecker.checkApi(response);
    }
    update();

  }




  BusinessTypeModel? selectedBusiness;
  void setSelectedBusinessType(BusinessTypeModel? type){
    selectedBusiness = type;
    update();
  }

  int currentPage = 0;

  void setCurrentPage(int index){
    currentPage = index;
    update();
  }



  List<String> businessTypeList = ["fmcg", "fashion", "pharmacy", "electronics", "ecommerce", "others", ];
  String selectedBusinessType = "fmcg";
  void changeBusinessType(String businessType, {bool notify = true}) {
    selectedBusinessType = businessType;
    if(notify){
      update();
    }

  }
  void setEditedData(String data){
    selectedBusinessType = data;
  }

  List<String> languageList = ["English", "Bangla"];
  String selectedLanguage = "English";
  void changeLanguage(String language,  {bool notify = true}) {
    selectedLanguage = language;
    if(notify){
      update();
    }

  }


  TextEditingController shopNameController = TextEditingController();
  TextEditingController shopAddressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ownerNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();




  Future <void> setUserToken(String token) async{
    authenticationRepository.saveUserToken(token);
  }
  Future <void> setUserId(String id) async{
    authenticationRepository.saveUserId(id);
  }

  bool isLoggedIn() {
    return authenticationRepository.isLoggedIn();
  }

  String getToken() {
    return authenticationRepository.getUserToken();
  }

  String getUserId() {
    return authenticationRepository.getUserId();
  }

  bool isActiveRememberMe = false;
  void toggleRememberMe({bool remember = false, bool notify = true}) {
    isActiveRememberMe = remember;
    if(notify){
      update();
    }

  }

  void saveEmailAndPassword(String number, String password) {
    authenticationRepository.saveEmailAndPassword(number, password);
  }
  Future<bool> clearUserEmailAndPassword() async {
    return authenticationRepository.clearUserNumberAndPassword();
  }
  String getEmail() {
    return authenticationRepository.getEmail();
  }
  String getPassword() {
    return authenticationRepository.getPassword();
  }
  Future <bool> clearSharedData() async {
    return authenticationRepository.clearSharedData();
  }

}