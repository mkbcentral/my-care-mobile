import 'package:flutter/material.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/themes/typography.dart';

class CardClinicList extends StatelessWidget {
  final String name;
  final String country;
  final String logo;
  final VoidCallback onTap;
  const CardClinicList(
      {super.key,
      required this.name,
      required this.country,
      required this.logo,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppTheme.colors.bgPrimaryGreen,
                    borderRadius: BorderRadius.circular(50)),
                width: 80,
                height: 80,
                child: CircleAvatar(backgroundImage: NetworkImage(logo)),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: subTitle.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          country,
                          style: paragraph,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
