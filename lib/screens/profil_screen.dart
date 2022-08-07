import 'package:borong/models/category_item.dart';
import 'package:borong/models/shop_item.dart';
import 'package:borong/screens/detail_screen.dart';
import 'package:borong/screens/products/add_product_screen.dart';
import 'package:borong/screens/settings/setting_screen.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:borong/widgets/contra/shop_grid_item.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class _KeyVal {
  String label;
  String value;

  _KeyVal({
    required this.label,
    required this.value,
  });
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({foundation.Key? key}) : super(key: key);

  static String routeName = "/profile-page";

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var uuid = const Uuid();
  final List<ShopItem> _items = <ShopItem>[];
  final List<Category> _categories = <Category>[];

  @override
  void initState() {
    super.initState();
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/coat_fur.svg",
        name: "Flash tee",
        price: "189",
        bgColor: ContraColors.flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/shirt_and_coat.svg",
        name: "Flash tee",
        price: "189",
        bgColor: ContraColors.caribbeanGreen,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/striped_tee.svg",
        name: "Flash tee",
        price: "189",
        bgColor: ContraColors.lighteningYellow,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/thunder_tshirt.svg",
        name: "Flash tee",
        price: "189",
        bgColor: ContraColors.pinkSalmon,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/coat_fur.svg",
        name: "Flash tee",
        price: "189",
        bgColor: ContraColors.flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/shirt_and_coat.svg",
        name: "Flash tee",
        price: "189",
        bgColor: ContraColors.flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/striped_tee.svg",
        name: "Flash tee",
        price: "189",
        bgColor: ContraColors.flamingo,
        by: "Company name"));
    _items.add(ShopItem(
        id: uuid.v1(),
        image: "assets/images/shopping/thunder_tshirt.svg",
        name: "Flash tee",
        price: "189",
        bgColor: ContraColors.flamingo,
        by: "Company name"));

    _categories.add(const Category(
        bgColor: ContraColors.bareleyWhite,
        startColor: ContraColors.woodSmoke,
        name: "Men"));
    _categories.add(const Category(
        bgColor: ContraColors.fairPink,
        startColor: ContraColors.woodSmoke,
        name: "Woman"));
    _categories.add(const Category(
        bgColor: ContraColors.foam,
        startColor: ContraColors.woodSmoke,
        name: "Kid"));
    _categories.add(const Category(
        bgColor: ContraColors.bareleyWhite,
        startColor: ContraColors.woodSmoke,
        name: "Adult"));
    _categories.add(const Category(
        bgColor: ContraColors.fairPink,
        startColor: ContraColors.woodSmoke,
        name: "Men"));
    _categories.add(const Category(
        bgColor: ContraColors.foam,
        startColor: ContraColors.woodSmoke,
        name: "Men"));
  }

  @override
  Widget build(BuildContext context) {
    List<_KeyVal> profileStats = [
      _KeyVal(label: "Product Sold", value: "${(10).toString()}k"),
      _KeyVal(label: "Products", value: (125).toString()),
      _KeyVal(label: "Rate", value: (5.0).toString()),
    ];
    return Scaffold(
      backgroundColor: ContraColors.white,
      appBar: CustomAppBar(
        height: 72,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AddProductScreen.routeName);
                    },
                    icon: const Icon(
                      Icons.add_box_outlined,
                      color: ContraColors.woodSmoke,
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: ContraText(
                      size: 27,
                      alignment: Alignment.bottomCenter,
                      text: "Profile",
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SettingsScreen.routeName);
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: ContraColors.woodSmoke,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.orange.shade700,
                      Colors.yellow.shade300,
                    ],
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Colors.grey.shade700,
                        Colors.grey.shade900,
                      ],
                    ),
                    border: Border.all(color: Colors.black, width: 2),
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.network(
                      "https://i.pravatar.cc/300?u=fake@pravatar.com",
                      width: 128,
                      height: 128,
                      // loadingBuilder: (context, child, loadingProgress) {
                      //   int expectedTotalBytes = 0;
                      //   int cumulativeBytesLoaded = 0;
                      //   double? value = 0;
                      //   if (loadingProgress != null &&
                      //       loadingProgress.expectedTotalBytes != null) {
                      //     expectedTotalBytes =
                      //         loadingProgress.expectedTotalBytes!;
                      //     cumulativeBytesLoaded =
                      //         loadingProgress.cumulativeBytesLoaded;
                      //     value = cumulativeBytesLoaded / expectedTotalBytes;
                      //   }
                      //   return SizedBox(
                      //     height: 128,
                      //     width: 128,
                      //     child: Center(
                      //       child: CircularProgressIndicator(
                      //         value: value,
                      //       ),
                      //     ),
                      //   );
                      // },
                      errorBuilder: (context, exception, stackTrace) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Text("Error loading image"),
                        //     ),
                        //   );
                        // );
                        return SizedBox(
                          width: 128,
                          height: 128,
                          child: Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 64,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                "@ilomon10",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  profileStats.length,
                  (index) => Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            profileStats[index].value,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(profileStats[index].label),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GridView.builder(
                padding: const EdgeInsets.all(24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  childAspectRatio: (1 / 1.7),
                ),
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: _items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ShopGridItemWidget(
                    shopItem: _items[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoppingDetailPage(
                            item: _items[index],
                          ),
                        ),
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
