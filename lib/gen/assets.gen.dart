/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Home 01.svg
  String get home01 => 'assets/images/Home 01.svg';

  /// File path: assets/images/account.png
  AssetGenImage get account => const AssetGenImage('assets/images/account.png');

  /// File path: assets/images/airport.png
  AssetGenImage get airport => const AssetGenImage('assets/images/airport.png');

  /// File path: assets/images/community.svg
  String get community => 'assets/images/Moleskine.svg';

  /// File path: assets/images/filter.svg
  String get filter => 'assets/images/filter.svg';

  /// File path: assets/images/google.png
  AssetGenImage get google => const AssetGenImage('assets/images/google.png');

  /// File path: assets/images/marketing.png
  AssetGenImage get marketing =>
      const AssetGenImage('assets/images/marketing.png');

  /// File path: assets/images/notification.svg
  String get notification => 'assets/images/notification.svg';

  /// File path: assets/images/onboarding1.png
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/onboarding1.png');

  /// File path: assets/images/onboarding2.png
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/onboarding2.png');

  /// File path: assets/images/onboarding3.png
  AssetGenImage get onboarding3 =>
      const AssetGenImage('assets/images/onboarding3.png');

  /// File path: assets/images/person.png
  AssetGenImage get person => const AssetGenImage('assets/images/person.png');

  /// File path: assets/images/profile.svg
  String get profile => 'assets/images/profile.svg';

  /// File path: assets/images/university.png
  AssetGenImage get university =>
      const AssetGenImage('assets/images/university.png');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
