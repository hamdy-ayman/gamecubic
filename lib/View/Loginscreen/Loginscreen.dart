import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/logic_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogicCubit, LogicState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Form(
                key: BlocProvider.of<LogicCubit>(context).key1,
                child: Column(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: TextFormField(
                        controller:
                            BlocProvider.of<LogicCubit>(context).nameController,
                        decoration: const InputDecoration(
                            label: Text('email'),
                            hintText: 'enter email',
                            prefixIcon: Icon(Icons.email)),
                        validator: (value) {
                          if (!value!.contains('@gmail.com') && value.isNotEmpty) {
                            return 'incorrect email';
                          } else if (value.isEmpty) {
                            return 'please enter email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: TextFormField(
                        controller:
                            BlocProvider.of<LogicCubit>(context).passController,
                        decoration: const InputDecoration(
                            label: Text('password'),
                            hintText: 'enter password',
                            prefixIcon: Icon(Icons.lock)),
                        validator: (value) {
                          if (value!.length < 6 && value.isNotEmpty) {
                            return 'password should have 6 or more';
                          } else if (value.isEmpty) {
                            return 'please enter password again';
                          }
                          return null;
                        },
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<LogicCubit>(context).key1.currentState!.validate();
                        BlocProvider.of<LogicCubit>(context).signIn();
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('Signing'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<LogicCubit>(context).key1.currentState!.validate();
                        BlocProvider.of<LogicCubit>(context).signUp();
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text('Sign up'),
                    ),
                    const Spacer(),
                  ],
                ),
              )),
        );
      },
    );
  }
}
