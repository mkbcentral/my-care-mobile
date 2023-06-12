import 'package:flutter/material.dart';
import 'package:my_care_mobile/formatter/text_formatter.dart';
import 'package:my_care_mobile/themes/app_theme.dart';
import 'package:my_care_mobile/themes/typography.dart';
import 'package:my_care_mobile/widgets/user/circle_avatar.dart';

class BuilCardCabinetInfos extends StatelessWidget {
  final String drName;
  final String imageUrl;
  final String labelDesc;
  final String countryDesc;
  final String adresseDesc;
  final Color bgColor;
  final VoidCallback onPress;
  const BuilCardCabinetInfos({
    super.key,
    required this.drName,
    required this.imageUrl,
    required this.labelDesc,
    required this.countryDesc,
    required this.adresseDesc,
    required this.bgColor,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 280.0,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        elevation: 10,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  padding: const EdgeInsets.only(left: 120),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    drName,
                    style: subTitle.copyWith(fontSize: 30, color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.transparent,
                            alignment: Alignment.topRight,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        side: BorderSide(
                                            color: AppTheme
                                                .colors.inputBorderColor))),
                                onPressed: onPress,
                                child: const Text('Prendre RVS')),
                          ),
                          Text(
                            labelDesc,
                            style: subTitle.copyWith(fontSize: 28),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            countryDesc,
                            style: paragraph.copyWith(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.map),
                              Text(truncateText(adresseDesc, 50),
                                  style: paragraph.copyWith(fontSize: 16))
                            ],
                          )
                        ]),
                  ),
                )
              ],
            ),
            Positioned(
                top: 20,
                left: 10,
                child: CircleAvatarWidget(
                    width: 100, heigth: 100, imageUrl: imageUrl))
          ],
        ),
      ),
    );
  }
}
