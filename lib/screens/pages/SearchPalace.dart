import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:label_marker/label_marker.dart';

import '../../models/ModelMapMarker.dart';
import '../customWidgets/RoundedSearchField.dart';

enum SampleItem { itemOne, itemTwo, itemThree, itemFour }

class SearchPalace extends StatefulWidget {
  const SearchPalace({super.key});

  @override
  State<SearchPalace> createState() => SearchPalaceState();
}

class SearchPalaceState extends State<SearchPalace> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 12.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  String? _mapStyle;
  RxSet<Marker> markers = <Marker>{}.obs;
  List<ModelMapMarker> markersData = [
    ModelMapMarker(
        id: 1, lat: 37.427961, long: -122.085750, title: 'Microsoft HQ'),
    ModelMapMarker(id: 1, lat: 37.427461, long: -122.045250, title: 'My Place'),
    ModelMapMarker(
        id: 2, lat: 37.440845, long: -122.095985, title: 'Charleston Slough'),
    ModelMapMarker(
        id: 3, lat: 37.410000, long: -122.094036, title: 'Monta Loma'),
    ModelMapMarker(
        id: 4, lat: 37.390237, long: -122.088643, title: 'California'),
    ModelMapMarker(
        id: 5, lat: 37.774929, long: -122.419418, title: 'San Francisco'),
    ModelMapMarker(
        id: 6, lat: 34.052235, long: -118.243683, title: 'Los Angeles'),
  ];
  double _width = 60.0;

  @override
  void initState() {
    super.initState();
    applyTheme();
    setupMarker();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _width = _width = MediaQuery.of(context).size.width;
      });
    });
  }

  void setupMarker() {
    markers.clear();
    for (var element in markersData) {
      final lat = element.lat;
      final lng = element.long;
      final title = element.title;
      markers.addLabelMarker(LabelMarker(
          label: '🏢 $title',
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
          markerId: MarkerId(title),
          position: LatLng(lat, lng),
          backgroundColor: Colors.orange,
          icon: BitmapDescriptor.defaultMarker,
          visible: true,
          onTap: () {}));
    }
  }

  Future<void> applyTheme() async {
    rootBundle.loadString('assets/map/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  final _searchController = TextEditingController();
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          child: Obx(() {
            return Stack(
              children: [
                FadedScaleAnimation(
                  child: GoogleMap(
                    zoomControlsEnabled: false,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                      // controller.setMapStyle(_mapStyle);
                      setupMarker();
                    },
                    style: _mapStyle,
                    zoomGesturesEnabled: true,
                    markers: markers.toSet(),
                  ),
                ),
                Positioned(
                  bottom: 90,
                  right: 20,
                  child: FadedScaleAnimation(
                    scaleDuration: 2000.milliseconds,
                    child: FloatingActionButton.extended(
                      onPressed: _goToTheLake,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      backgroundColor: const Color(0XAA888888),
                      label: const Text(
                        'List of variants',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      icon: const Icon(
                        Icons.notes,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 90,
                  left: 20,
                  child: FadedScaleAnimation(
                    scaleDuration: 2000.milliseconds,
                    child: FloatingActionButton(
                      elevation: 2,
                      onPressed: _goToTheLake,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      backgroundColor: const Color(0XAA888888),
                      isExtended: false,
                      child: const Icon(
                        Icons.share_location,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 155,
                  left: 20,
                  child: FadedScaleAnimation(
                    scaleDuration: 2000.milliseconds,
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        highlightColor: Colors
                            .transparent, // This line removes the highlight color
                      ),
                      child: PopupMenuButton<SampleItem>(
                        initialValue: selectedItem,
                        onSelected: (SampleItem item) {
                          setState(() {
                            selectedItem = item;
                          });
                        },
                        color: const Color(0XEEFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.0),
                        ),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<SampleItem>>[
                          PopupMenuItem<SampleItem>(
                            value: SampleItem.itemOne,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.check_box_outlined,
                                  color: selectedItem == SampleItem.itemOne
                                      ? Colors.orange
                                      : Colors.black54,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Cosy areas',
                                  style: TextStyle(
                                      color: selectedItem == SampleItem.itemOne
                                          ? Colors.orange
                                          : Colors.black54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem<SampleItem>(
                            value: SampleItem.itemTwo,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.account_balance_wallet_outlined,
                                  color: selectedItem == SampleItem.itemTwo
                                      ? Colors.orange
                                      : Colors.black54,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Price',
                                  style: TextStyle(
                                      color: selectedItem == SampleItem.itemTwo
                                          ? Colors.orange
                                          : Colors.black54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem<SampleItem>(
                            value: SampleItem.itemThree,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.coffee_maker_outlined,
                                  color: selectedItem == SampleItem.itemThree
                                      ? Colors.orange
                                      : Colors.black54,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Infrastructure',
                                  style: TextStyle(
                                      color:
                                          selectedItem == SampleItem.itemThree
                                              ? Colors.orange
                                              : Colors.black54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          PopupMenuItem<SampleItem>(
                            value: SampleItem.itemFour,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.layers_outlined,
                                  color: selectedItem == SampleItem.itemFour
                                      ? Colors.orange
                                      : Colors.black54,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Without Any Layer',
                                  style: TextStyle(
                                      color: selectedItem == SampleItem.itemFour
                                          ? Colors.orange
                                          : Colors.black54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ],
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: const BoxDecoration(
                            color: Color(0XAA888888),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.layers_outlined,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: FadedScaleAnimation(
                    scaleDuration: 1400.milliseconds,
                    child: AnimatedContainer(
                      padding: const EdgeInsets.all(36),
                      duration: const Duration(milliseconds: 1200),
                      curve: Curves.easeOut,
                      width: _width,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 9,
                            child: RoundedSearchField(
                              controller: _searchController,
                              onChanged: (value) {
                                // Handle search query changes
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.filter_alt_outlined,
                                  color: Colors.grey,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ));
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
