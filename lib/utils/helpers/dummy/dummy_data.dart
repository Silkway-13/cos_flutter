import 'package:cos_work_store/features/authentication/models/user_model.dart';
import 'package:cos_work_store/features/work_shop/models/category_model.dart';
import 'package:cos_work_store/utils/constants/image_strings.dart';
import 'package:cos_work_store/utils/helpers/dummy/banner_model.dart';
import 'package:cos_work_store/utils/helpers/dummy/route.dart';

class CosDummyData {
  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: CosImages.promoBanner1,
      targetScreen: CosRoutes.order,
      active: false,
    ),
    BannerModel(
      imageUrl: CosImages.promoBanner2,
      targetScreen: CosRoutes.order,
      active: false,
    ),
  ];

  /// -- User
  static final UserModel user = UserModel(
    id: '1',
    firstName: "firstName",
    lastName: "lastName",
    username: "username",
    email: "email",
    phoneNumber: "phoneNumber",
    profilePicture: "",
  );

  static final List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      image: CosImages.shawarIcon,
      name: 'Шавар',
      isFeatured: false,
    ),
    CategoryModel(
      id: '2',
      image: CosImages.shawarIcon,
      name: 'Өрлөг',
      isFeatured: false,
    ),
    CategoryModel(
      id: '3',
      image: CosImages.shawarIcon,
      name: 'Шал',
      isFeatured: false,
    ),
    CategoryModel(
      id: '4',
      image: CosImages.shawarIcon,
      name: 'Зам',
      isFeatured: false,
    ),
    CategoryModel(
      id: '5',
      image: CosImages.shawarIcon,
      name: 'Пилта',
      isFeatured: false,
    ),
    // Add more categories as needed
  ];
}
