import 'package:inlingua/src/constants/api_services_urls.dart';
import 'package:inlingua/src/data/network/http_client.dart';
import 'package:inlingua/src/models/home/product_list_response_model.dart';

class HomeRepository {
  Future<ProductListResponseModel> fetchProductList() async {
    final Map<String, dynamic> resp =
        await HTTPClient().getJSONRequest(url: ApiServiceUrls.signup);
    return ProductListResponseModel.fromJson(resp);
  }
}
