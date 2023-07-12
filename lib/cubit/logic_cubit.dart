import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'logic_state.dart';

class LogicCubit extends Cubit<LogicState> {
  LogicCubit():super(RegisterState());
  FirebaseAuth auth =FirebaseAuth.instance;
  GlobalKey<FormState> key1 = GlobalKey<FormState>();
  TextEditingController nameController =TextEditingController();
  TextEditingController passController =TextEditingController();
  void signUp()
  {

   auth.createUserWithEmailAndPassword(email: nameController.text, password: passController.text);
   auth.currentUser!.sendEmailVerification();
   emit(RegisterState());

  }
  void signIn()
  {
    auth.signInWithEmailAndPassword(email: nameController.text, password: passController.text);
    auth.currentUser!.sendEmailVerification();
    emit(Login());
  }
}
