import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_care_mobile/configs/basic_ui/snackbar.dart';
import 'package:my_care_mobile/features/user/user_feature.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/themes/typography.dart';
import 'package:my_care_mobile/views/cabinet/list_cabinet_screen.dart';
import 'package:my_care_mobile/views/hospital/list_hospitals.dart';
import 'package:my_care_mobile/views/loading/loading_screen.dart';
import 'package:my_care_mobile/views/patient/patient_id_screen.dart';
import 'package:my_care_mobile/widgets/ui/custom_dialog.dart';
import 'package:my_care_mobile/widgets/user/edit_user_profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colors.bgPrimaryGreen,
          foregroundColor: AppTheme.colors.white,
          title: Text(
            'My care',
            style: appBarTitle,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(() => const EditUserProfile(),
                    transition: Transition.leftToRight,
                    duration: const Duration(seconds: 1));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppTheme.colors.white,
                    borderRadius: BorderRadius.circular(50)),
                width: 30,
                height: 30,
                child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/u.jpg')),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ConfirmationDialog(
                          labelQuestion:
                              "Voulez-vous vraiment vous déconnecter ?",
                          labelCancelBtn: "Annuler",
                          labelConfirmBtn: "Se déconnecter");
                    },
                  ).then((value) {
                    if (value != null && value) {
                      logout();
                      showSnackBar(context, 'Your are logout');
                      Get.to(const LoadingScreen(),transition: Transition.fadeIn);
                    }
                  });
                },
                icon: const Icon(Icons.logout)),
            const SizedBox(
              width: 10,
            ),
          ],
          centerTitle: true,
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: AppTheme.colors.white,
            unselectedLabelColor: AppTheme.colors.white,
            indicator: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(14),
                    topLeft: Radius.circular(14)), // Creates border
                color: AppTheme.colors.bgSecondaryGreen),
            tabs: const [
              Tab(
                text: 'HOPITAL',
              ),
              Tab(
                text: 'CABINET MEDICAL',
              ),
              Tab(
                text: 'MON ID',
              ),
            ],
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg2.png'), fit: BoxFit.cover),
          ),
          child: const TabBarView(
            children: [
              ListHospitalView(),
              ListCabinetScreen(),
              PatientIdScreen()
            ],
          ),
        ),
        drawer: const Drawer(),
      ),
    );
  }
}
