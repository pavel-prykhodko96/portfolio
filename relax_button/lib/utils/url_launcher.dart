import 'package:relax_button/constants/links.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncher {
  static launchHelpUkraine() async {
    final url = Uri.parse(UrlLaunncherLinks.supportUkraine);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
