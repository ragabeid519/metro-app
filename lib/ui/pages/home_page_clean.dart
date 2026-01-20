import 'package:dapi_game/constants/metro_constants.dart';
import 'package:dapi_game/constants/metro_stations.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controllers/home_controller.dart';
import '../widgets/station_dropdown.dart';
import '../widgets/route_card.dart';
import '../widgets/custom_error_widget.dart';

/// الصفحة الرئيسية لتطبيق مخطط رحلات المترو
class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.put(HomeController()); //////////////////////////

  @override
  Widget build(BuildContext context) {
    getLocation();
    return Scaffold(appBar: _buildAppBar(), body: _buildBody(context));
  }

  /// بناء شريط التطبيق
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text(
        'مخطط رحلات المترو',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
      elevation: 4,
    );
  }

  /// بناء محتوى الصفحة
  Widget _buildBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('images/metro2.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildInputSection(context),
          const SizedBox(height: 24),
          Obx(
            () => homeController.hasError.value
                ? CustomErrorWidget(
                    message: homeController.errorMessage.value,
                    onRetry: () => homeController.clearData(),
                  )
                : homeController.isLoading.value
                ? _buildLoadingState()
                : homeController.routes.isEmpty
                ? _buildEmptyState()
                : _buildRoutesListSection(),
          ),
        ],
      ),
    );
  }

  /// بناء قسم الإدخال
  Widget _buildInputSection(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // عنوان القسم
            const Text(
              'اختر محطات الرحلة',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),

            // محطة البداية
            const Text(
              'محطة البداية',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _openMap(
                      ControllerStart:
                          homeController.startStationController.text,
                    );
                  },
                  child: Text("Map"),
                ),
                StationDropdown(
                  hintText: 'اختر محطة البداية',
                  controller: homeController.startStationController,
                  stations: homeController.getAllStations(),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // محطة النهاية
            const Text(
              'محطة النهاية',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                StationDropdown(
                  hintText: 'اختر محطة النهاية',
                  controller: homeController.endStationController,
                  stations: homeController.getAllStations(),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // زر البحث
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Obx(
                () => ElevatedButton.icon(
                  onPressed: homeController.isLoading.value
                      ? null
                      : () => homeController.planTrip(),
                  icon: homeController.isLoading.value
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        )
                      : const Icon(Icons.search),
                  label: Text(
                    homeController.isLoading.value
                        ? 'جاري البحث...'
                        : 'ابحث عن رحلة',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 223, 221, 227),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _getNearestStation();
              },
              child: Text("nearest start station"),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: homeController.arrivalController,
                    decoration: InputDecoration(labelText: 'enter place'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _getNearestArrival();
                  },
                  child: Text("nearest station to place"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _getNearestArrival() async {
    String place = homeController.arrivalController.text;
    try {
      List<Location> locations = await locationFromAddress(place);
      print('locations: $locations =============================');
      if (locations.isEmpty) {
        print('No locations found for the given place.');
        return;
      }
      print('Locations found: ${locations.first}');
      Location location = locations.first;
      print('Location of $place: ${location.latitude}, ${location.longitude}');

      double minDistance = double.infinity;
      MetroStation? nearestStation;
      for (var station in MetroConstants.cairoMetroStations) {
        double distance = Geolocator.distanceBetween(
          location.latitude,
          location.longitude,
          station.lat,
          station.lng,
        );
        if (distance < minDistance) {
          minDistance = distance;
          nearestStation = station;
        }
      }
      homeController.endStationController.text = nearestStation!.name;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch location for the place.',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      print('Error occurred while fetching location: $e');
      return;
    }
  }

  _getNearestStation() async {
    Position position = await Geolocator.getCurrentPosition();
    print('latitude: ${position.latitude} longitude: ${position.longitude}');
    double minDistance = double.infinity;
    MetroStation? nearestStation;
    for (var station in MetroConstants.cairoMetroStations) {
      double distance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        station.lat,
        station.lng,
      );
      if (distance < minDistance) {
        minDistance = distance;
        nearestStation = station;
      }
    }
    homeController.startStationController.text = nearestStation!.name;
  }

  /// فتح الخريطة
  void _openMap({required String ControllerStart}) {
    print(ControllerStart);
    final station = MetroConstants.cairoMetroStations.firstWhereOrNull(
      (it) => it.name == ControllerStart,
    );
    if (station == null) {
      Get.snackbar(
        'Error',
        'Station not found.',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      print('Station not found =============================');
      return;
    } else {
      print('Station found =============================');
      print(
        ' station: ${station.lat} ${station.lng}  =============================',
      );
      final uri = Uri.parse(
        "geo:0,0?q=${station.lat},${station.lng}(${station.name})",
      );
      print(' uri: $uri =============================');
      launchUrl(uri);
    }
  }

  Future<void> getLocation() async {
    bool serviceEnabled = false;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print('serviceEnabled: $serviceEnabled==================================');

    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Get.snackbar('Error', 'Location services are disabled.');
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        Get.snackbar('Error', 'Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Get.snackbar(
        'Error',
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();
    print('latitude: ${position.latitude} longitude: ${position.longitude}');
    // final uri = Uri.parse(
    //   "geo:0,0?q=${position.latitude},${position.longitude}",
    // );
    // launchUrl(uri);
    final places = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    print(
      'places: ${places.first.name} -- ${places.first.locality} -- ${places.first.country} -- ${places.first.street}',
    );
  }

  /// بناء حالة التحميل
  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.deepPurple),
          ),
          const SizedBox(height: 16),
          const Text(
            'جاري البحث عن الرحلات المتاحة...',
            style: TextStyle(
              fontSize: 16,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  /// بناء حالة الصفحة الفارغة
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.train, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            'اختر محطة البداية والنهاية ثم اضغط على البحث',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  /// بناء قسم قائمة الرحلات
  Widget _buildRoutesListSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'الرحلات المتاحة (${homeController.routes.length})',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homeController.routes.length,
            itemBuilder: (context, index) {
              return RouteCard(
                route: homeController.routes[index],
                planIndex: index + 1,
              );
            },
          ),
        ),
      ],
    );
  }
}
