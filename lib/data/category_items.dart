import 'package:fileexplorer/enums/categories.dart';
import 'package:fileexplorer/models/category_item_data.dart';
import 'package:fileexplorer/theme/app_colors.dart';

class CategoryItems {
  static const CategoryItemData Music = CategoryItemData(
    category: Categories.Music,
    text: "Music",
    imgPath: "assets/images/category/music.png",
    color: AppColors.MusicColor,
  );

  static const CategoryItemData Images = CategoryItemData(
    category: Categories.Images,
    text: "Images",
    imgPath: "assets/images/category/images.png",
    color: AppColors.ImagesColor,
  );

  static const CategoryItemData Docs = CategoryItemData(
    category: Categories.Docs,
    text: "Docs",
    imgPath: "assets/images/category/docs.png",
    color: AppColors.DocsColor,
  );

  static const CategoryItemData APKs = CategoryItemData(
    category: Categories.APKs,
    text: "APKs",
    imgPath: "assets/images/category/apks.png",
    color: AppColors.APKColor,
  );

  static const CategoryItemData Downloads = CategoryItemData(
    category: Categories.Downloads,
    text: "Downloads",
    imgPath: "assets/images/category/downloads.png",
    color: AppColors.DownloadsColor,
  );

  static const CategoryItemData Archives = CategoryItemData(
    category: Categories.Archives,
    text: "Archives",
    imgPath: "assets/images/category/archive.png",
    color: AppColors.ArchivesColor,
  );

  static const CategoryItemData Screenshots = CategoryItemData(
    category: Categories.Screenshots,
    text: "Screenshots",
    imgPath: "assets/images/category/screenshots.png",
    color: AppColors.ScreenshotsColor,
  );

  static const CategoryItemData Videos = CategoryItemData(
    category: Categories.Videos,
    text: "Videos",
    imgPath: "assets/images/category/videos.png",
    color: AppColors.VideoColor,
  );
}
