import 'package:google_play/models/section_models/section_config_model.dart';

class TabsConfig {
  final Map<String, TabConfig> tabs;

  TabsConfig({required this.tabs});

  factory TabsConfig.fromJson(Map<String, dynamic> json) {
    final tabsJson = json['tabs'] as Map<String, dynamic>;
    final tabs = <String, TabConfig>{};

    tabsJson.forEach((key, value) {
      tabs[key] = TabConfig.fromJson(value as Map<String, dynamic>);
    });

    return TabsConfig(tabs: tabs);
  }
}

class TabConfig {
  final String tabKey;
  final String displayName;
  final List<SectionConfig> sections;

  TabConfig({
    required this.tabKey,
    required this.displayName,
    required this.sections,
  });

  factory TabConfig.fromJson(Map<String, dynamic> json) {
    return TabConfig(
      tabKey: json['tabKey'] as String,
      displayName: json['displayName'] as String? ?? '',
      sections: (json['sections'] as List<dynamic>)
          .map((s) => SectionConfig.fromJson(s as Map<String, dynamic>))
          .toList(),
    );
  }
}
