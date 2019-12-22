import 'dart:async';
import 'package:arator/data/model/User.dart';
import 'package:arator/data/repo/user_repo.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository _userRepository = UserRepository();

  @override
  UserState get initialState => InitialUserState();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    try {
      yield InitialUserState();
      User user = await _userRepository.getUserDetails();
      yield UserLoaded(user);
    } catch (error) {
      yield UserLoadFailed(error);
    }
  }
}
