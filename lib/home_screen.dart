import 'package:auto_size_text/auto_size_text.dart';
import 'package:cyber_ded_flutter/models/lesson.dart';
import 'package:cyber_ded_flutter/models/review.dart';
import 'package:flutter/material.dart';

import 'models/user.dart';

const List<double>? presetFontSizesNumbers = [60, 48, 30, 16];
const List<double>? presetFontSizesText = [30, 24, 16];
const List<double>? presetFontSizesSRSStatus = [18, 16];

class HomeScreen extends StatelessWidget {
  final User userModel;
  const HomeScreen({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Spacer(
            flex: 5,
          ),
          AutoSizeText(
              userModel.lessons
                  .where((lesson) => lesson.status == LessonStatus.completed)
                  .length
                  .toString(),
              presetFontSizes: presetFontSizesNumbers,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const AutoSizeText('Уроков пройдено',
              presetFontSizes: presetFontSizesText,
              style: TextStyle(fontWeight: FontWeight.normal)),
          const Spacer(
            flex: 5,
          ),
          AutoSizeText(getReviewAccuracy(),
              presetFontSizes: presetFontSizesNumbers,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const AutoSizeText('Точность повторений',
              maxLines: 1,
              presetFontSizes: presetFontSizesText,
              style: TextStyle(fontWeight: FontWeight.normal)),
          const Spacer(
            flex: 5,
          ),
          const AutoSizeText('Повторения',
              maxLines: 1,
              presetFontSizes: presetFontSizesText,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.underline)),
          const Spacer(
            flex: 1,
          ),
          Row(
            children: [
              const Spacer(
                flex: 5,
              ),
              Column(
                children: [
                  AutoSizeText(
                      userModel.reviews
                          .where(
                              (review) => review.status == SRSStatus.apprentice)
                          .length
                          .toString(),
                      maxLines: 1,
                      presetFontSizes: presetFontSizesNumbers,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const AutoSizeText('ученик',
                      maxLines: 1,
                      presetFontSizes: presetFontSizesSRSStatus,
                      style: TextStyle(fontWeight: FontWeight.normal)),
                ],
              ),
              const Spacer(
                flex: 5,
              ),
              Column(
                children: [
                  AutoSizeText(
                      userModel.reviews
                          .where((review) => review.status == SRSStatus.guru)
                          .length
                          .toString(),
                      maxLines: 1,
                      presetFontSizes: presetFontSizesNumbers,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const AutoSizeText('гуру',
                      maxLines: 1,
                      presetFontSizes: presetFontSizesSRSStatus,
                      style: TextStyle(fontWeight: FontWeight.normal)),
                ],
              ),
              const Spacer(
                flex: 5,
              ),
              Column(
                children: [
                  AutoSizeText(
                      userModel.reviews
                          .where((review) =>
                              review.status == SRSStatus.enlightened)
                          .length
                          .toString(),
                      maxLines: 1,
                      presetFontSizes: presetFontSizesNumbers,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const AutoSizeText('мастер',
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      presetFontSizes: presetFontSizesSRSStatus,
                      style: TextStyle(fontWeight: FontWeight.normal)),
                ],
              ),
              const Spacer(
                flex: 5,
              ),
              Column(
                children: [
                  AutoSizeText(
                      userModel.reviews
                          .where((review) => review.status == SRSStatus.burned)
                          .length
                          .toString(),
                      maxLines: 1,
                      presetFontSizes: presetFontSizesNumbers,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const AutoSizeText('готово',
                      maxLines: 1,
                      presetFontSizes: presetFontSizesSRSStatus,
                      style: TextStyle(fontWeight: FontWeight.normal)),
                ],
              ),
              const Spacer(
                flex: 5,
              ),
            ],
          ),
          const Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }

  String getReviewAccuracy() {
    var completed = userModel.stats.reviewStatistics
        .where((element) => element != false)
        .length;

    var all = userModel.stats.reviewStatistics.length;
    var accuracy = completed / all * 100;

    if (!accuracy.isFinite) {
      accuracy = 0;
    }

    var result = accuracy.toStringAsFixed(0) + '%';

    return result;
  }
}
