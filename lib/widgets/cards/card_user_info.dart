import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_care_mobile/configs/basic_ui/snackbar.dart';
import 'package:my_care_mobile/configs/constaints/api_response_constants.dart';
import 'package:my_care_mobile/features/user/user_feature.dart';
import 'package:my_care_mobile/models/user_model.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/themes/typography.dart';
import 'package:get/get.dart';
import 'package:my_care_mobile/widgets/user/circle_avatar.dart';
import 'package:my_care_mobile/widgets/user/edit_user_profile.dart';

class CardUserInfo extends StatefulWidget {
  const CardUserInfo({
    super.key,
  });

  @override
  State<CardUserInfo> createState() => _CardUserInfoState();
}

class _CardUserInfoState extends State<CardUserInfo> {
  bool isLoading = false;
  User? _user;
  @override
  void initState() {
    _loadUserINnfos();
    super.initState();
  }

  Future<void> _loadUserINnfos() async {
    ApiResponse apiResponse = await getUserDetail();
    if (apiResponse.error == null) {
      setState(() {
        _user = apiResponse.data as User;
      });
    } else {
      // ignore: use_build_context_synchronously
      showSnackBar(context, '${apiResponse.error}');
      setState(() {
        isLoading = !isLoading;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator.adaptive(),
          )
        : Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: BoxDecoration(
                    color: AppTheme.colors.bgPrimaryGreen,
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.only(top: 35),
                child: Container(
                  margin: const EdgeInsets.only(top: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: AppTheme.colors.labelCard2,
                          ),
                          Text(
                            'Name: ${_user?.name}',
                            style: subTitle.copyWith(
                                color: AppTheme.colors.labelCard2,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: AppTheme.colors.labelCard2,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Email: ${_user?.email}',
                            style: subTitle.copyWith(
                                color: AppTheme.colors.labelCard2,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: AppTheme.colors.labelCard2,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Phone: +243 ${_user?.phone ?? ''}',
                            style: subTitle.copyWith(
                                color: AppTheme.colors.labelCard2,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                top: 0,
                left: 130,
                child: CircleAvatarWidget(
                    width: 80, heigth: 80, imageUrl: 'assets/images/u.jpg'),
              ),
              Positioned(
                top: 40,
                right: 10,
                child: IconButton(
                  onPressed: () {
                    Get.to(() => const EditUserProfile(),
                        transition: Transition.leftToRight,
                        duration: const Duration(seconds: 1));
                  },
                  icon: Icon(
                    FontAwesomeIcons.userPen,
                    color: AppTheme.colors.white,
                  ),
                ),
              ),
            ],
          );
  }
}
