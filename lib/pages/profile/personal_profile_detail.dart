import 'package:arator/business/bloc/bloc.dart';
import 'package:arator/business/bloc/user_bloc.dart';
import 'package:arator/components/common/page_body_container.dart';
import 'package:arator/components/elements/button.dart';
import 'package:arator/data/model/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalProfileDetailPage extends StatefulWidget {
  @override
  _PersonalProfileDetailPageState createState() =>
      _PersonalProfileDetailPageState();
}

class _PersonalProfileDetailPageState extends State<PersonalProfileDetailPage> {
  UserBloc _userBloc;

  @override
  void initState() {
    _userBloc = BlocProvider.of<UserBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Profile"),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<UserBloc, UserState>(
            bloc: _userBloc,
            builder: (context, userState) {
              if (userState is UserLoaded) {
                User user = userState.props[0];
                return Column(
                  children: <Widget>[
                    Hero(
                      tag: "user-profile-detail",
                      child: Image.network(user.profileImagePath),
                    ),
                    Card(
                      child: PageBodyContainer(
                          child: Column(
                        children: <Widget>[
                          Text(
                            user.name,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          TextField(
                            decoration: InputDecoration(),
                          ),
                          AppButton(
                            onPressed: () => {},
                            child: Text("test"),
                          ),
                        ],
                      )),
                    ),
                  ],
                );
              } else if (userState is UserLoadFailed) {
                return Text("User could not be loaded");
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
