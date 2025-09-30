import 'package:emt7any/core/extensions/navigation.dart';
import 'package:emt7any/core/ui/button.dart';
import 'package:emt7any/core/ui/inputs.dart';
import 'package:emt7any/core/ui/toast.dart';
import 'package:emt7any/core/validator/input.dart';
import 'package:emt7any/feature/auth/cubit/student_cubit.dart';
import 'package:emt7any/feature/auth/cubit/student_state.dart';
import 'package:emt7any/feature/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late final TextEditingController _password, _id;
  @override
  void initState() {
    super.initState();
    _id = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _id.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<StudentCubit, StudentState>(
        listener: (context, state) {
          if (state.error.isNotEmpty) {
            Toaster.error(state.error);
          } else if (state.isAuthenticated) {
            context.pushReplacement(const HomeScreen());
          }
        },
        builder: (context, state) => Form(
          key: _formKey,
          child: Column(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "تسجيل الدخول",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              TextInputField(
                controller: _id,
                icon: Icons.person,
                label: "الرقم القومي",
                maxLength: 14,
                keyboardType: TextInputType.phone,
                validator: InputValidator.validateId,
              ),

              PasswordInputField(
                label: "كلمة المرور",
                controller: _password,
                validator: InputValidator.validatePassword,
              ),

              const SizedBox(height: 10),

              !state.loading
                  ? FractionallySizedBox(
                      widthFactor: .4,
                      child: InkWell(
                        onTap: () {},
                        onLongPress: () {
                          _id.text = "12345678909998";
                          _password.text = "12345678";
                        },
                        child: Button.filled(
                          label: "تسجيل الدخول",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<StudentCubit>().login(
                                id: _id.text,
                                password: _password.text,
                              );
                            } else {
                              _id.text = "12345678909998";
                              _password.text = "12345678";
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(0, 32, 96, 1),
                          ),
                        ),
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      );
}
