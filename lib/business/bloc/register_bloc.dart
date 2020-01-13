import 'dart:async';
import 'package:arator/data/repo/user_repo.dart';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository = new UserRepository();
  String nameError;
  String emailError;
  String passwordError;
  String confirmPasswordError;

  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterLoading();
      try {
        await userRepository.register(
          userCredentials: event.userCredentials,
        );
        yield RegisterComplete();
      } catch (error) {
        yield RegisterFailure(error: error);
      }
    }
  }
}
