// widgets/google_play_tabs.dart

import 'package:flutter/material.dart';

class GooglePlayTabs extends StatefulWidget {
  final List<String> tabs;
  final TabController controller;
  final Color indicatorColor;
  final Color activeColor;
  final Color inactiveColor;

  const GooglePlayTabs({
    super.key,
    required this.tabs,
    required this.controller,
    this.indicatorColor = const Color(0xFF4285F4),
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.grey,
  });

  @override
  State<GooglePlayTabs> createState() => _GooglePlayTabsState();
}

class _GooglePlayTabsState extends State<GooglePlayTabs> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTabChanged);
    _scrollController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    _scrollToCurrentTab();
  }

  void _scrollToCurrentTab() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final index = widget.controller.index;
      
      final scrollPosition = index * 120.0; 
      _scrollController.animateTo(
        scrollPosition,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: Colors.white,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        itemCount: widget.tabs.length,
        itemBuilder: (context, index) {
          return _buildTabItem(index);
        },
      ),
    );
  }

  Widget _buildTabItem(int index) {
    final isSelected = widget.controller.index == index;
    
    return GestureDetector(
      onTap: () => widget.controller.animateTo(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? widget.indicatorColor : Colors.transparent,
              width: 3.0,
            ),
          ),
        ),
        child: Center(
          child: Text(
            widget.tabs[index],
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              color: isSelected ? widget.activeColor : widget.inactiveColor,
            ),
          ),
        ),
      ),
    );
  }
}