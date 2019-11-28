import 'package:arator/components/common/tab_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfilePicture extends StatelessWidget {
  final String imageUrl;
  final num size;
  final Model stateModel;
  final bool shouldNavigate;

  ProfilePicture(this.imageUrl, this.size, this.stateModel,
      {this.shouldNavigate = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (shouldNavigate)
          {
            TabNavigator.push(context, TabNavigatorRoutes.sellerUserProfile),
          }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: Container(width: size, child: Image.asset(imageUrl)),
      ),
    );
  }
}
