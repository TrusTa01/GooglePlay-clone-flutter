import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_play/features/auth/data/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginCircleAvatar extends StatefulWidget {
  const LoginCircleAvatar({super.key});

  @override
  State<LoginCircleAvatar> createState() => _LoginCircleAvatarState();
}

class _LoginCircleAvatarState extends State<LoginCircleAvatar> {
  User? _user;
  late final StreamSubscription<AuthState> _authSubscription;
  final _supabase = Supabase.instance.client.auth;

  @override
  void initState() {
    super.initState();
    _user = _supabase.currentUser;

    _authSubscription = _supabase.onAuthStateChange.listen((data) {
      if (mounted) {
        setState(() {
          _user = data.session?.user;
        });
      }
    });
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final avatarUrl = _user!.userMetadata?['avatar_url'];
    return _user == null
        ? GestureDetector(
            onTap: () => AuthService().signInWithGoogle(),
            child: const CircleAvatar(
              radius: 18,
              child: Icon(Icons.account_circle, size: 24),
            ),
          )
        : GestureDetector(
            onTap: () {
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(100, 80, 0, 0),
                items: [
                  const PopupMenuItem(child: Text('Профиль')),
                  PopupMenuItem(
                    onTap: () => Supabase.instance.client.auth.signOut(),
                    child: const Text('Выйти'),
                  ),
                ],
              );
            },
            child: CircleAvatar(
              radius: 18,
              backgroundImage: avatarUrl != null
                  ? NetworkImage(avatarUrl)
                  : null,
              child: avatarUrl == null ? const Icon(Icons.person) : null,
            ),
          );
  }
}
