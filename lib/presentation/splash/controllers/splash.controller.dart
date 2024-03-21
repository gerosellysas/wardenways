import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wander_ways/presentation/components/components.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  final StorageService _storage = Get.find<StorageService>();
  late AnimationController logoAnimation;

  var _language = 0;

  @override
  void onInit() {
    logoAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
      reverseDuration: const Duration(milliseconds: 3000),
    );
    super.onInit();
  }

  @override
  void onReady() async {
    logoAnimation.forward();
    _language = await _checkPrefLanguage();
    await _checkLoggedUser();
    super.onReady();
  }

  @override
  void onClose() {
    logoAnimation.dispose();
    super.onClose();
  }

  Future<int> _checkPrefLanguage() async {
    return await _storage.loadPrefLanguage();
  }

  Future<void> _checkLoggedUser() async {
    var loggedUser = await _storage.loadLoggedUser();
    if (loggedUser == "") {
      return await Get.offAllNamed(
        "/welcome",
        arguments: _language,
      );
    }
    _storage.listUser.assignAll(await _storage.fetchAllUser());
    var index = _storage.listUser.indexWhere((u) => u.email == loggedUser);
    _storage.user.value = _storage.listUser[index];
    return await Get.offAllNamed(
      "/home",
      arguments: _language,
    );
  }
}
