import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../data/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repository;

  AuthBloc({required AuthRepository repository})
      : _repository = repository,
        super(AuthState()) {
    on<AuthEvent>(
      (event, emit) => switch (event) {
        LogoutEvent() => _logoutEvent(event, emit),
      },
    );
  }

  void _logoutEvent(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    logger(_repository.hashCode);

    emit(state.copyWith(
      fullName: '',
      email: '',
    ));
  }
}
