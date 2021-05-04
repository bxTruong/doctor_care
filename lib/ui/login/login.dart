import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:logger/logger.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Đăng nhập với Facebook'),
          onPressed: () async {
            print('hello <3');
            FacebookAuth.instance
                .login(permissions: ['public_profile', 'email']).then((value) {
              Logger().d('status', value.message);
              FacebookAuth.instance.getUserData().then((userData) {
                Logger().d('status', userData["email"].toString());
              });
            });
          },
        ),
      ),
    );
  }
}
