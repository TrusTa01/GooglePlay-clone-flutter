import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class KidsDetailsScreen extends StatelessWidget {
  const KidsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBars(
        type: AppBarType.transparent,
        showBackButton: true,
        onLeadingPressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/kids_tab/kids_details_image1.webp',
              width: double.infinity,
              height: screenHeight / 4,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Детям - всё лучшее',
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
                    'Все приложения на вкладке для детей - как обучающие, так и развлекательные - получили одобрение преподавателей и отмечены специаным знаком.',
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
                  _buildSectionTitle('Для учебы и не только'),
                  _buildMainText(
                    'Вместе с учителями, специалистами в области образования и специалистами по работе с мультимедийными технологиями мы выбираем лучшие приложения для детей в Google Play. Эксперты оценивают приложения и одобряют только те из них, которые:',
                  ),

                  const SizedBox(height: 10),
                  _buildBulletPoint('дарят позитивные эмоции и вдохновение;'),
                  _buildBulletPoint(
                    'соответствуют указанной возрастной группе;',
                  ),
                  _buildBulletPoint('тщательно продуманы.'),

                  const SizedBox(height: 32),
                  _buildSectionTitle('Наши ведущие консультанты:'),
                  _buildMainText(
                    'Джо Блатт, Гарвардская высшая школа педагогических наук;\n'
                    'доктор Сандра Калверт, Джорджтаунский университет.',
                  ),

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
                  _buildSectionTitle('Значок "Одобрено преподавателями"'),
                  _buildMainText(
                    'Если приложению присвоен значок "Одобрено преподавателями", вы увидите его в верхней части страницы сведений. Ниже вы найдете отзывы преподавателей и экспертов. Из них вы сможете узнать, к примеру, способствует ли приложение развитию воображения и любознательности.',
                  ),

                  _buildLinkButton(
                    'Подробнее об оценках преподавателей...',
                    () {},
                  ),

                  const SizedBox(height: 32),
                  _buildSectionTitle('Сервисы и приложения для учащихся'),
                  _buildMainText(
                    'Приложения из Google Play (в том числе одобренные преподавателями) могут быть недоступны для учебных аккаунтов G Suite for Education. Совет для преподавателей: выясните у системного администратора, какие приложения и сервисы можно использовать в вашем учебном заведении. Узнайте больше о приложениях для учебных заведений на портале Chromebook App Hub.',
                  ),
                  _buildLinkButton('Подробнее...', () {}),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
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
