import 'package:flutter/material.dart';
import 'package:itrip/data/enum/person_status_enum.dart';
import 'package:itrip/utils/colors_app.dart';

class PersonStatusSelector extends StatelessWidget {
  const PersonStatusSelector({
    super.key,
    required this.personStatus,
    required this.isSelected,
  });
  final PersonStatusEnum personStatus;
  final bool isSelected;

  String imageAssetByPersonStatus() {
    String label = "";
    switch (personStatus) {
      case PersonStatusEnum.individual:
        label = "assets/img/alone.png";
        break;
      case PersonStatusEnum.companied:
        label = "assets/img/companied.png";
        break;
    }
    return label;
  }

  String labelByPersonStatus() {
    String label = "";
    switch (personStatus) {
      case PersonStatusEnum.individual:
        label = "Individual";
        break;
      case PersonStatusEnum.companied:
        label = "Acompañado";
        break;
    }
    return label;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(12.0),
        side: BorderSide(
          color: isSelected ? ColorsApp.primaryDarkColor : Colors.transparent,
          width: 2.0
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
              Image.asset(imageAssetByPersonStatus()),
              const SizedBox(height: 10.0,),
              Text(labelByPersonStatus()),
          ],
        ),
      )
    );
  }
}
