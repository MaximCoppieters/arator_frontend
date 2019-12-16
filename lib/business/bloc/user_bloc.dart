import 'dart:async';
import 'package:arator/data/User.dart';
import 'package:arator/data/UserCredentials.dart';
import 'package:bloc/bloc.dart';
import 'bloc.dart';
import 'package:arator/data/repo/user_repo.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository = UserRepository();

  @override
  UserState get initialState => InitialUserState();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoginUser) {
      yield* _mapLoginUser(event.userCredentials);
    }
  }

  Stream<UserState> _mapLoginUser(UserCredentials credentials) async* {
    try {
      User user = await this.userRepository.getUserWithCredentials(credentials);
      yield UserLoaded(user);
    } catch (_) {
      yield UserNotLoaded();
    }
  }
}
