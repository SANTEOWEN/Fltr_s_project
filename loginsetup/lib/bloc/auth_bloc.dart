import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  // @override
  // void onChange(Change<AuthState> change) {
  //   super.onChange(change);
  //   print('AuthBloc - Change - $change');
  // }

  // @override
  // void onTransition(Transition<AuthEvent, AuthState> transition) {
  //   super.onTransition(transition);
  //   print('AuthBloc - Transition - $transition');
  // }

  //To make the code much cleaner we need to put it on private function
  void _onAuthLoginRequested(
    //Always set the constructors by its event type and its state emitter.
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final email = event.email;
      final password = event.password;
      // Email validation using Regex

      if (password.length < 6) {
        return emit(
          AuthFailure('Password cannot be less than 6 characters!'),
        );
      }

      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthSuccess(uid: '$email-$password'));
      });
    } catch (e) {
      return emit(AuthFailure(e.toString()));
    }
  }

  void _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}


// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'auth_event.dart';
// part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc() : super(AuthInitial()) {
//     on<AuthLoginRequested>((event, emit) async {
//       emit(AuthLoading());
//       try {
//         final email = event.email;
//         final password = event.password;

//         //Email validation
//         if (password.length < 6) {
//           return emit(
//             AuthFailure('Password cannot be less than 6 characters!'),
//           );
//         }

//         await Future.delayed(const Duration(seconds: 1), () {
//           return emit(AuthSuccess(uid: '$email-$password'));
//         });
//       } catch (e) {
//         return emit(AuthFailure(e.toString()));
//       }
//     });

//     on(<AuthLogoutRequested>(event, emit) async {
//       emit(AuthLoading());
//       try {
//         await Future.delayed(const Duration(seconds: 1), () {
//           return emit(AuthInitial());
//         });
//       } catch (e) {
//         emit(AuthFailure(e.toString()));
//       }
//     });
//   }
// }
