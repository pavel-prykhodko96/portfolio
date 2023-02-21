import 'package:relax_button/constants/links.dart';
import 'package:relax_button/constants/paths.dart';

class SoundModel {
  final String trackPath;
  final String author;
  final String trackName;
  final String materiallink;
  final String licenseLink;

  const SoundModel({
    required this.trackPath,
    required this.author,
    required this.trackName,
    required this.materiallink,
    required this.licenseLink,
  });

  static const activeSoundsList = <SoundModel>[
    SoundModel(
      trackPath: SoundsPaths.audienceApplause,
      trackName: "Audience Applause",
      author: "Matthiew11",
      materiallink: SoundMaterialLinks.audienceApplause,
      licenseLink: SoundLicenseLinks.attribution_3_0,
    ),
    SoundModel(
      trackPath: SoundsPaths.bellsTibetan,
      trackName: "Bells Tibetan Large",
      author: "Daniel Simion",
      materiallink: SoundMaterialLinks.bellsTibetan,
      licenseLink: SoundLicenseLinks.attribution_3_0,
    ),
    SoundModel(
      trackPath: SoundsPaths.blop,
      trackName: "Blop",
      author: "Mark DiAngelo",
      materiallink: SoundMaterialLinks.blop,
      licenseLink: SoundLicenseLinks.attribution_3_0,
    ),
    SoundModel(
      trackPath: SoundsPaths.chineseGong,
      trackName: "Chinese Gong",
      author: "Daniel Simon",
      materiallink: SoundMaterialLinks.chineseGong,
      licenseLink: SoundLicenseLinks.attribution_3_0,
    ),
    SoundModel(
      trackPath: SoundsPaths.glassPing,
      trackName: "Glass Ping",
      author: "Go445",
      materiallink: SoundMaterialLinks.glassPing,
      licenseLink: SoundLicenseLinks.attributionNonCommercial_3_0,
    ),
    SoundModel(
      trackPath: SoundsPaths.iLoveYou,
      trackName: "Pc Says I Love You",
      author: "Jack",
      materiallink: SoundMaterialLinks.iLoveYou,
      licenseLink: SoundLicenseLinks.publicDomain,
    ),
    SoundModel(
      trackPath: SoundsPaths.iceCubesGlass,
      trackName: "Ice Cubes Glass",
      author: "Daniel Simion",
      materiallink: SoundMaterialLinks.iceCubesGlass,
      licenseLink: SoundLicenseLinks.attribution_3_0,
    ),
    SoundModel(
      trackPath: SoundsPaths.metalGong,
      trackName: "Metal Gong 1",
      author: "Dianakc",
      materiallink: SoundMaterialLinks.metalGong,
      licenseLink: SoundLicenseLinks.attribution_3_0,
    ),
    SoundModel(
      trackPath: SoundsPaths.tick,
      trackName: "Tick",
      author: "DeepFrozenApps",
      materiallink: SoundMaterialLinks.tick,
      licenseLink: SoundLicenseLinks.attribution_3_0,
    ),
    SoundModel(
      trackPath: SoundsPaths.tollingBell,
      trackName: "Tolling Bell",
      author: "Daniel Simion",
      materiallink: SoundMaterialLinks.tollingBell,
      licenseLink: SoundLicenseLinks.attribution_3_0,
    ),
  ];
}
