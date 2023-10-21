import 'package:flutter/material.dart';
import 'package:for_error/common/provider/is_loading_provider.dart';
import 'package:for_error/home_screen/state_management/user_provider.dart';
import 'package:for_error/home_screen/user_model.dart';
import 'package:provider/provider.dart';

class transfer_money_provider {
  Future<List<UserModel>> fetchData(BuildContext context) async {
    final loading =
        await Provider.of<IsLoadingProvider>(context, listen: false);
    loading.tongalIsLoading(true);

    final user = Provider.of<UserProvider>(context, listen: false);

    final _users = await user.getUsersData();
    loading.tongalIsLoading(false);
    return _users;
  }
}
