import 'quota.dart';
import 'user.dart';

final class Auth {
  final User user;
  final Quota quota;

  const Auth({
    required this.user,
    required this.quota,
  });
}
