
import 'package:newflutter/core/class/crud.dart';
import 'package:newflutter/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id , String userid) async {
    var response = await crud.postData(AppLink.items, {"items_id" : id.toString() , "users_id" : userid});
    return response.fold((l) => l, (r) => r);
  }
}