import 'package:flutter_stylish/model/color.dart';
import 'package:flutter_stylish/model/product.dart';
import 'package:flutter_stylish/model/product_content.dart';
import 'package:flutter_stylish/model/variants.dart';

class ProductRepository {
  Future<List<ProductContent>> getProduct() {
    List<ProductContent> products = List.empty();
    for(var item =0; item < 15; item++) {
      ProductContent(
        item,
        "men",
        "厚實毛呢格子外套",
        "高抗寒素材選用，保暖也時尚有型",
        2200,
        "棉、聚脂纖維",
        "手洗（水溫40度)",
        "韓國",
        "實品顏色以單品照為主",
        "你絕對不能錯過的超值商品",
        <Color>[Color("334455", "深藍"), Color("FFFFFF", "白色"), Color("00CACA", "青色")],
        <String>["S", "M", "L"],
        <Variants>[Variants("334455", "s", 5), Variants("334455", "M", 10), Variants("FFFFFF", "s", 8)],
        "assets/images/cloth_1.jpg",
        ["assets/images/cloth_1.jpg", "assets/images/cloth_1.jpg", "assets/images/cloth_1.jpg"],
      );
    }
    return Future.value(products);
  }
}