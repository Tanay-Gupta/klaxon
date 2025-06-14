import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  /// Launches a generic URL in the browser 
  Future<void> launchUrlInBrowser(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  /// Launches an email client with prefilled details 
  Future<void> launchEmail({
    required String toEmail,
    String subject = '',
    String body = '',
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: toEmail,
      query: _encodeQueryParameters({
        'subject': subject,
        'body': body,
      }),
    );
    await launchUrl(emailUri);
  }

  /// Helper: Encodes subject & body for the email URI.
  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
