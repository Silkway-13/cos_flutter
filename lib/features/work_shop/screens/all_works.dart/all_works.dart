import 'package:cos_work_store/common/widgets/appbar/appbar.dart';
import 'package:cos_work_store/common/widgets/works/sortable/sortable_works.dart';
import 'package:cos_work_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AllWorks extends StatelessWidget {
  const AllWorks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CosAppBar(
        title: Text('Санал болгох ажлууд'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(CosSizes.defaultSpace),
        child: CosSortableWorks(),
      ),
    );
  }
}
