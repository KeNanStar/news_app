import 'BaseNewsItem.dart';

class ImageNewsItem extends BaseNewsItem {
  String imgUrl;

  ImageNewsItem(String imgUrl, String title, String content, num publishTime)
      : super(title, content, publishTime) {
    this.imgUrl = imgUrl;
  }
}
