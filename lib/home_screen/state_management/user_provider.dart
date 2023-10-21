import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:for_error/home_screen/service/fetch_user_data_json.dart';
import 'package:for_error/home_screen/user_model.dart';
import 'package:provider/provider.dart';

class UserProvider with ChangeNotifier {
  // List<dynamic> _users = [];
  List<UserModel> _users = [];
  List<UserModel> get users => _users;
  List<dynamic> jsonData = [];

  Future<void> fetchUserData() async {
    // final loadingProvider=Pro
    await Future.delayed(Duration(seconds: 3));
    print("delay over");
    jsonData = await fetchUserDataJson().callApi();

    List<UserModel> getUserListFromJson(List<Map<String, dynamic>> jsonList) {
      return jsonList.map((json) => UserModel.fromJson(json)).toList();
    }

    _users = await getUserListFromJson(jsonData as List<Map<String, dynamic>>);
    notifyListeners();
  }

  List<UserModel> getUsersData() {
    return users;
  }

  Map<String, dynamic> transferAmount(
    String senderId,
    String receiverId,
    double amount,
  ) {
    final sender = _users.firstWhere(
      (element) {
        return element.userId == receiverId;
      },
    );

    ///check if sender has enough balance to send money
    if (sender.balance >= amount) {
      final receiver = _users.indexWhere(
        (element) {
          return element.userId == receiverId;
        },
      );
      _users[receiver].balance = _users[receiver].balance + amount;
      print(_users[receiver].balance);
      // receiver.balance = receiver.balance + amount;
      sender.balance = sender.balance - amount;
      notifyListeners();
      return {"message": "Amount transferred successfully", "status": true};
    } else {
      return {"message": "You do not have enough money", "status": false};
    }
  }
}
