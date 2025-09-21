import 'package:emt7any/core/extensions/navigation.dart';
import 'package:emt7any/core/ui/button.dart';
import 'package:emt7any/core/ui/inputs.dart';
import 'package:emt7any/core/ui/toast.dart';
import 'package:emt7any/core/validator/input.dart';
import 'package:emt7any/feature/auth/cubit/auth_cubit.dart';
import 'package:emt7any/feature/auth/cubit/auth_state.dart';
import 'package:emt7any/feature/home/presentation/screen/home_screen.dart';
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
  Widget build(BuildContext context) => BlocConsumer<AuthCubit, AuthState>(
    listener: (context, state) {
      if (state.error != null) {
        Toaster.error(state.error!);
      } else if (state.user != null) {
        Toaster.success("تم تسجيل الدخول بنجاح");
        context.push(const HomeScreen());
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
            // keyboardType: TextInputType.phone,
            validator: InputValidator.validateId,
          ),

          PasswordInputField(
            label: "كلمة المرور",
            controller: _password,
            validator: InputValidator.validatePassword,
          ),

          const SizedBox(height: 10),

          state.loading != true
              ? FractionallySizedBox(
                  widthFactor: .4,
                  child: Button.filled(
                    label: "تسجيل الدخول",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                          id: _id.text,
                          password: _password.text,
                        );
                      }
                    },
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        ],
      ),
    ),
  );
}
