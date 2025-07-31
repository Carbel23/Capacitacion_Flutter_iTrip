import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:itrip/data/model/trip.dart';
import 'package:itrip/ui/widget/common/app_bar_primary.dart';
import 'package:itrip/ui/widget/common/button_link.dart';
import 'package:itrip/use_cases/bloc/trip_bloc/trip_bloc.dart';

class DetailTripView extends StatefulWidget {
  final Trip trip;
  const DetailTripView({super.key, required this.trip});

  @override
  State<DetailTripView> createState() => _DetailTripViewState();
}

class _DetailTripViewState extends State<DetailTripView> {
  final ValueNotifier<Set<Marker>> _markers = ValueNotifier({});

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(13.7012837, -89.2244333),
    zoom: 15.0,
  );

  void addTripMarker() {
    _markers.value.add(
    Marker(
        markerId: MarkerId(widget.trip.id.toString()),
        position: LatLng(widget.trip.latitude ?? 0, widget.trip.longitude ?? 0),
      ),
    );
  }

  Future<void> moveCameraToMarker() async {
    GoogleMapController gMapCtrl = await _controller.future;
    gMapCtrl.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(widget.trip.latitude ?? 0, widget.trip.longitude ?? 0),
          zoom: 15.0,
        ),
      ),
    );
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      addTripMarker();
      moveCameraToMarker();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(context: context),
      body: SafeArea(
        child: BlocListener<TripBloc, TripState>(
          listener: (context, state) {
            if (state is TripUpdatedState) {
              Navigator.pop(context);
            }
          },
          child: ValueListenableBuilder(
            valueListenable: _markers,
            builder: (context, value, child) {
              return Column(
                children: [
                  Expanded(
                    child: GoogleMap(
                      initialCameraPosition: _initialPosition,
                      myLocationEnabled: true,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      markers: {
                        Marker(
                          markerId: MarkerId(widget.trip.id.toString()),
                          position: LatLng(widget.trip.latitude ?? 0, widget.trip.longitude ?? 0),
                          infoWindow: InfoWindow(
                            title: widget.trip.name,
                            snippet: "Recuerdo"
                          ),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueBlue
                          ),
                        ),
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.trip.name,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                height: 52,
                                child: ButtonLink(
                                  onClick: () {
                                    Navigator.pop(context);
                                  },
                                  text: "Volver",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
