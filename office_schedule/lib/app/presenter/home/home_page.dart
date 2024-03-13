import 'package:flutter/material.dart';
import 'package:office_schedule/app/features/profile/infra/models/user_model.dart';

class HomePage extends StatefulWidget {
  final UserProfileModel userProfileModel;
  const HomePage({super.key, required this.userProfileModel});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.userProfileModel.fullName!),
          Text(widget.userProfileModel.email!),
          Text(widget.userProfileModel.phone!),
          Text(widget.userProfileModel.company!),
          Text(widget.userProfileModel.specialty!),
        ],
      ),
    );
  }
}
