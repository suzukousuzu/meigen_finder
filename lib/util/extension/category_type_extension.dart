import '../../domain/state/category_type.dart';

extension CategoryTypeExtension on CategoryType {
  String get categoryText {
    return switch (this) {
      CategoryType.like => 'お気に入り',
      CategoryType.life => '人生',
      CategoryType.love => '恋愛',
      CategoryType.work => '仕事',
      CategoryType.time => '時間',
      CategoryType.dream => '夢',
      CategoryType.beYourself => '自分らしさ',
      CategoryType.effort => '努力',
      CategoryType.entrepreneur => '起業',
      CategoryType.funny => '面白い',
      CategoryType.healing => '癒し',
      CategoryType.marriage => '結婚',
      CategoryType.motivation => 'やる気',
      CategoryType.training => 'トレーニング',
      CategoryType.original => 'オリジナル',
      CategoryType.relationship => '人間関係',
      CategoryType.anime => 'アニメ',
      CategoryType.loneliness => '孤独',
    };
  }
}
