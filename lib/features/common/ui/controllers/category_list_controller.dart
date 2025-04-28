import 'package:ecommerce_app/features/common/data/models/category%20models/category_pagination_model.dart';
import 'package:ecommerce_app/services/network_caller/network_caller.dart';
import 'package:get/get.dart';
import '../../../../app/urls.dart';

class CategoryListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  bool get initialInProgress => _page == 1 && inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  // CategoryPaginationModel? _categoryPaginationModel;

  final List<CategoryItemModel> _categoryList = [];

  List<CategoryItemModel> get categoryList => _categoryList;

  final int _count = 30;

  int _page = 0;

  int? _lastPage;

  Future<bool> getCategoryList() async {
    _page++;

    if (_lastPage != null && _page >= _lastPage!) return false;

    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String, dynamic> queryParams ={
      'count' : _count,
      'page' : _page,
    };

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      Urls.categoryListUrl,
      queryParams: queryParams,
    );
    if (response.isSuccess) {
      // _categoryPaginationModel =
      //     CategoryPaginationModel.fromJson(response.responseData);
      CategoryPaginationModel paginationModel = CategoryPaginationModel.fromJson(response.responseData);
      _categoryList.addAll(paginationModel.data?.results ?? []);

      if (paginationModel.data?.lastPage != null) {
        _lastPage = paginationModel.data!.lastPage!;
      }

      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<bool> refreshCategoryList() async{
    _page = 0;
    _lastPage = null;
    _categoryList.clear();
    return getCategoryList();
  }
}
