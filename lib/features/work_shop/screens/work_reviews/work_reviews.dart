import 'package:cos_work_store/common/widgets/appbar/appbar.dart';
import 'package:cos_work_store/common/widgets/works/ratings/rating_indicator.dart';
import 'package:cos_work_store/features/work_shop/screens/work_reviews/widgets/rating_progress_indicator.dart';
import 'package:cos_work_store/features/work_shop/screens/work_reviews/widgets/user_review_card.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WorkReviewsScreen extends StatelessWidget {
  const WorkReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar: const CosAppBar(
        title: Text('Сэтгэгдэл & Үнэлгээ'),
        showBackArrow: true,
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CosSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Үнэлгээ болон сэтгэгдлийг баталгаажуулсан бөгөөд системд ашигладаг бүх хүмүүсээс авсан болно."),
              const SizedBox(
                height: CosSizes.spaceBtwItems,
              ),

              /// Overall Work Ratings
              const CosOverallWorkRating(),
              const CosRatingBarIndicator(
                rating: 3.5,
              ),
              Text(
                '999',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: CosSizes.spaceBtwSections,
              ),

              /// User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
