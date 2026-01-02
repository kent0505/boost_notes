part of 'auth_bloc.dart';

final class AuthState {
  final bool loading;
  final String fullName;
  final String email;

  AuthState({
    this.loading = false,
    this.fullName = 'John Wick',
    this.email = 'rvfvszcvjvnh@privaterek.appleid.com',
  });

  AuthState copyWith({
    bool? loading,
    String? fullName,
    String? email,
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
    );
  }
}
