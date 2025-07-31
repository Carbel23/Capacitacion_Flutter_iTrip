import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itrip/data/model/trip.dart';
import 'package:itrip/ui/view/detail_trip_view.dart';
import 'package:itrip/utils/colors_app.dart';

class TripCardPortrait extends StatefulWidget {
  final Trip trip;
  const TripCardPortrait({super.key, required this.trip});

  @override
  State<TripCardPortrait> createState() => _TripCardPortraitState();
}

class _TripCardPortraitState extends State<TripCardPortrait> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => DetailTripView(trip: widget.trip),
          ),
        );
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.cyan,
        ),
        child: SizedBox(
          width: 172,
          height: 206,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            child: Column(
              children: [
                Spacer(),
                Card(
                  color: Color(0xEBEBEBCC),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.trip.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Row(
                          children: [
                            Icon(Icons.tour, color: ColorsApp.primaryDarkColor),
                            Text("1 Recuerdo"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
