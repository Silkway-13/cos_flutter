import 'package:cos_work_store/features/work_shop/screens/work_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:flutter/material.dart';

class CosOverallWorkRating extends StatelessWidget {
  const CosOverallWorkRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              CosRatingProgressIndicator(
                text: '5',
                value: 1.0,
              ),
              CosRatingProgressIndicator(
                text: '4',
                value: 0.8,
              ),
              CosRatingProgressIndicator(
                text: '3',
                value: 0.6,
              ),
              CosRatingProgressIndicator(
                text: '2',
                value: 0.4,
              ),
              CosRatingProgressIndicator(
                text: '1',
                value: 0.2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
