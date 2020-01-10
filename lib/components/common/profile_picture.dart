import 'package:arator/data/model/User.dart';
import 'package:arator/tab_navigator.dart';
import 'package:flutter/cupertino.dart';

class ProfilePicture extends StatelessWidget {
  final User user;
  final num size;
  final bool shouldNavigate;

  ProfilePicture(this.user, this.size, {this.shouldNavigate = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (shouldNavigate)
          {
            TabNavigator.push(context, TabNavigatorRoutes.sellerUserProfile,
                object: user),
          }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child:
            Container(width: size, child: Image.network(user.profileImagePath)),
      ),
    );
  }
}
