import 'package:i_news/models/category_model.dart';

List<CategoryModel> getCategories() {
  // ignore: deprecated_member_use
  List<CategoryModel> category = new List<CategoryModel>();
  CategoryModel categoryModel = new CategoryModel();

  // 1
  categoryModel.categoryName = "BUSINESS";
  categoryModel.imageUrl =
      "https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX5219425.jpg";
  category.add(categoryModel);

  // 2
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "ENTERTAINMENT";
  categoryModel.imageUrl =
      "https://image.freepik.com/free-vector/cinema-icon-collection-movie-theatre-entertainment-cartoon-pictures-video-club-popcorn-3d-glasses-camera-popcorn-vector-illustrations_80590-6692.jpg";
  category.add(categoryModel);

  // 3
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "GENERAL";
  categoryModel.imageUrl =
      "https://pi.tedcdn.com/r/talkstar-assets.s3.amazonaws.com/production/playlists/playlist_753/f3a1fc6a-435b-4e08-8b8d-939a53105ee6/common_ground-2000x2000.jpg?";
  category.add(categoryModel);

  // 4
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "HEALTH";
  categoryModel.imageUrl =
      "https://image.freepik.com/free-vector/health-fitness-cartoon_24640-25709.jpg";
  category.add(categoryModel);

  // 5
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "SCIENCE";
  categoryModel.imageUrl =
      "https://i.pinimg.com/originals/02/70/da/0270da641b3a07fb5412adf0b0ca6b47.jpg";
  category.add(categoryModel);

  // 6
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "SPORTS";
  categoryModel.imageUrl =
      "https://i.pinimg.com/736x/16/70/97/167097d34f4eb1b12a90d9d84fe8a59d.jpg";
  category.add(categoryModel);

  // 7
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "TECHNOLOGY";
  categoryModel.imageUrl =
      "https://image.freepik.com/free-vector/hacker-operating-laptop-cartoon-icon-illustration-technology-icon-concept-isolated-flat-cartoon-style_138676-2387.jpg";
  category.add(categoryModel);

  // 8
  categoryModel = new CategoryModel();
  categoryModel.categoryName = "EDUCATION";
  categoryModel.imageUrl =
      "https://images.megapixl.com/5007/50075902.jpg";
  category.add(categoryModel);

  return category;
}
