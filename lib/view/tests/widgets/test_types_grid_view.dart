import 'package:flutter/material.dart';
import 'package:mindcare_app/view/tests/widgets/test_type_iteam.dart';

class TestTypesGridView extends StatelessWidget {
  const TestTypesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return TestTypeIteam(
            ontap: () {},
            text: "ebraam",
          );
        });
  }
}
