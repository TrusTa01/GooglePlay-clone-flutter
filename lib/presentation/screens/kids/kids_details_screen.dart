import 'package:flutter/material.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/core/utils/url_launcher.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class KidsDetailsScreen extends StatelessWidget {
  const KidsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Constants.sliderMaxContentWidth,
          ),
          child: SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SimpleSliverAppBar(
                  showBackButton: true,
                  showLogo: false,
                  onLeadingPressed: () => Navigator.pop(context),
                ),
                SliverToBoxAdapter(
                  child: Image.asset(
                    'assets/images/kids_tab/kids_details_image1.webp',
                    width: double.infinity,
                    height: screenHeight / 4,
                    fit: BoxFit.cover,
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(22),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Center(
                        child: Text(
                          context.l10n.kidsHeroTitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: Constants.defaultFontWeight,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        context.l10n.kidsHeroSubtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      const SizedBox(height: 24),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/kids_tab/kids_details_image2.webp',
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 32),
                      _buildSectionTitle(context.l10n.kidsSectionLearning),
                      _buildMainText(context.l10n.kidsSectionLearningText),
                      const SizedBox(height: 10),
                      _buildBulletPoint(context.l10n.kidsBullet1),
                      _buildBulletPoint(context.l10n.kidsBullet2),
                      _buildBulletPoint(context.l10n.kidsBullet3),
                      const SizedBox(height: 32),
                      _buildSectionTitle(context.l10n.kidsConsultants),
                      _buildMainText(context.l10n.kidsConsultantsList),
                      const SizedBox(height: 32),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/kids_tab/kids_details_image3.webp',
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 32),
                      _buildSectionTitle(context.l10n.kidsBadgeTitle),
                      _buildMainText(context.l10n.kidsBadgeDescription),
                      _buildLinkButton(
                        context.l10n.detailsMore,
                        () => launchMyUrl(
                          'https://support.google.com/googleplay/',
                        ),
                      ),
                      const SizedBox(height: 32),
                      _buildSectionTitle(context.l10n.kidsServicesTitle),
                      _buildMainText(context.l10n.kidsServicesDescription),
                      _buildLinkButton(
                        context.l10n.detailsMore,
                        () => launchMyUrl(
                          'https://support.google.com/googleplay/',
                        ),
                      ),
                      const SizedBox(height: 40),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 19,
          fontWeight: Constants.defaultFontWeight,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildMainText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          height: 1.4,
          color: Colors.grey.shade900,
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 12),
            child: Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15,
                height: 1.4,
                color: Colors.grey.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkButton(String text, VoidCallback onTap) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Constants.googleBlue,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
