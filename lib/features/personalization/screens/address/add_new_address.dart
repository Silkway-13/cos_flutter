import "package:cos_work_store/common/widgets/appbar/appbar.dart";
import "package:cos_work_store/utils/constants/sizes.dart";
import "package:flutter/material.dart";
import "package:iconsax/iconsax.dart";

class AddNewAddessScreen extends StatelessWidget {
  const AddNewAddessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CosAppBar(
        showBackArrow: true,
        title: Text('Хаяг нэмэх'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CosSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.user), labelText: 'Нэр'),
                ),
                const SizedBox(
                  height: CosSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: 'Утасны дугаар'),
                ),
                const SizedBox(
                  height: CosSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building_31),
                            labelText: 'Аймаг/Дүүрэг'),
                      ),
                    ),
                    const SizedBox(
                      width: CosSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.code),
                            labelText: 'Сум/Хороо'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: CosSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.building),
                            labelText: 'Аймаг/Дүүрэг'),
                      ),
                    ),
                    const SizedBox(
                      width: CosSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),
                            labelText: 'Сум/Хороо'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: CosSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.location),
                      labelText: 'Ажиллаж байгаа хаяг'),
                ),
                const SizedBox(
                  height: CosSizes.defaultSpace,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Хадгалах"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
