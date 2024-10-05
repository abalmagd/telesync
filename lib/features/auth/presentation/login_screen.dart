import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:telesync/core/domain/constants/assets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:telesync/features/auth/presentation/riverpod/auth_controller.dart';

import 'widgets/auth_text_field.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final authController = ref.watch(authControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Image.asset(Assets.logo, height: size.height * 0.15),
            const Text('Welcome back', textAlign: TextAlign.center),
            const SizedBox(height: 8),
            const Text('Login to continue', textAlign: TextAlign.center),
            const SizedBox(height: 24),
            Form(
              child: Builder(builder: (context) {
                return Column(
                  children: [
                    AuthTextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      title: 'Email Address',
                      enabled: !authController.isLoading,
                      validator: (value) {
                        return value.contains('@') ? null : 'Email is wrong';
                      },
                      required: true,
                    ),
                    const SizedBox(height: 24),
                    AuthTextField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      title: 'Password',
                      enabled: !authController.isLoading,
                      required: true,
                      validator: (value) {
                        return value.length > 6 ? null : 'Password must be > 6';
                      },
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: authController.isLoading
                            ? null
                            : () {
                                if (Form.of(context).validate()) {
                                  ref
                                      .read(authControllerProvider.notifier)
                                      .login(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                }
                              },
                        child: authController.isLoading
                            ? const CircularProgressIndicator()
                            : const Text('Login'),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
