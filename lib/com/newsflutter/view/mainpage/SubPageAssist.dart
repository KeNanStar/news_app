import 'package:news_app/com/newsflutter/view/entity/BaseNewsItem.dart';
import 'package:news_app/com/newsflutter/view/entity/ImageNewsItem.dart';

class SubPageAssist {
  List<BaseNewsItem> newsItems;

  List<BaseNewsItem> getNewsItemsFromServer() {
    var items = List<BaseNewsItem>();
    var imgNewsItem = ImageNewsItem(
        'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fp3.ssl.cdn.btime.com%2Ft01b1aab0a2f8b91aa7.jpg&refer=http%3A%2F%2Fp3.ssl.cdn.btime.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1617452672&t=305e20576b830e901741cfa960ac0a6b',
        '欧冠C罗高难凌空斩神球',
        '尤文输了，但C罗的表现很出色。虽然主场1-2输给曼联令尤文图斯球迷感到郁闷，但是他们阵中当家前锋C罗却表现很精彩，他攻入了一粒非常漂亮的进球。',
        12);
    items.add(imgNewsItem);
    return items;
  }
}
