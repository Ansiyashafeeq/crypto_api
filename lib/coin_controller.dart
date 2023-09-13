import 'package:crypto_api/models/coin_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CoinController extends GetxController{
  RxBool isLoading = true.obs;
  RxList< Welcome> coinList = < Welcome>[].obs;

  @override
  onInit(){
    super.onInit();
    fetchCoins();
  }

  fetchCoins() async{
    try{
      isLoading(true);
      var response = await http.get(
          Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
      List< Welcome> coins =  welcomeFromJson(response.body);
      coinList.value = coins;
    }finally{
      isLoading(false);
    }

  }

}