import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginsetup/bloc/auth_bloc.dart';
import 'package:loginsetup/login_screen.dart';
import 'package:loginsetup/widgets/gradient_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AuthSuccess) {
            final uid = state.uid;

            return Center(
              child: Column(
                children: [
                  Text(uid),
                  GradientButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(AuthLogoutRequested());
                    },
                    title: 'SIGNOUT',
                  ),
                ],
              ),
            );
          } else {
            return const Text('LAMAW');
          }
        },
      ),
    );
  }
}
