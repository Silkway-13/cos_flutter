import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cos_work_store/utils/popups/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;
    if (_connectionStatus.value == ConnectivityResult.none) {
      CosLoaders.customToast(message: 'Сүлжээний алдаа!');
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }

  /// Dispose
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}

// import 'dart:async';

// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:cos_work_store/utils/popups/loaders.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class NetworkManager extends GetxController {
//   static NetworkManager get instance => Get.find();

//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
//   final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

//   void init() {
//     super.onInit();
//     _connectivitySubscription =
//         _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }

//   void _updateConnectionStatus(List<ConnectivityResult> results) {
//     // Check if ConnectivityResult.none is present in the results list
//     bool hasNoConnectivity = results.contains(ConnectivityResult.none);

//     // Update _connectionStatus with the latest connectivity result
//     if (!hasNoConnectivity) {
//       _connectionStatus.value = ConnectivityResult
//           .mobile; // or ConnectivityResult.wifi, depending on your priority
//     } else {
//       _connectionStatus.value = ConnectivityResult.none;
//     }

//     // You can also perform other actions based on the updated status if needed
//     if (_connectionStatus.value == ConnectivityResult.none) {
//       CosLoaders.customToast(message: 'Сүлжээний алдаа!');
//     }
//   }

//   Future<bool> isConnected() async {
//     try {
//       final result = await _connectivity.checkConnectivity();
//       return result != ConnectivityResult.none;
//     } on PlatformException catch (_) {
//       return false;
//     }
//   }

//   /// Dispose
//   @override
//   void onClose() {
//     super.onClose();
//     _connectivitySubscription.cancel();
//   }
// }
