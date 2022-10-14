import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:portfolio/controller/nav_controller.dart';
import 'package:portfolio/controller/wallpaper_controller.dart';
import 'package:portfolio/utils/dimensions.dart';
import 'package:portfolio/widgets/bigtext.dart';
import 'package:portfolio/widgets/loader.dart';
import 'package:portfolio/widgets/searchfield.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  NavController navController = Get.put(NavController());

  var wallpaperController = Get.find<WallpaperController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh: () {
            return wallpaperController.getWallpaper();
          },
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: Dimensions.height10,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    size: Dimensions.iconSize25,
                  ),
                  Expanded(
                    child: SearchTextField(
                        hintText: "Search",
                        icon: Icons.search,
                        ontap: () {
                          print("tapped");
                        }),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: Dimensions.height10),
                padding: EdgeInsets.all(Dimensions.height10),
                alignment: Alignment.centerLeft,
                height: Dimensions.height45 * 1.8,
                child: _builderTab()),
            SizedBox(
              height: Dimensions.height10,
            ),
            Expanded(
              child: Obx(() {
                if (wallpaperController.isLoading.value == true) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width10),
                    child: GridView.custom(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 2,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          pattern: [
                            QuiltedGridTile(2, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                          ]),
                      childrenDelegate: SliverChildBuilderDelegate(
                        childCount: wallpaperController.wallpaper.length,
                        (context, index) {
                          return ClipRRect(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            child: CachedNetworkImage(
                              imageUrl: wallpaperController
                                  .wallpaper[index].urls.small
                                  .toString(),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  const CustomLoader(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              }),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _builderTab() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: navController.nav.length,
      itemBuilder: (context, index) {
        return Obx(
          () => GestureDetector(
            onTap: () {
              navController.selectedIndex.value = index;
            },
            child: AnimatedContainer(
              width: Dimensions.width20 * 5,
              margin: EdgeInsets.fromLTRB(index == 0 ? 15 : 5, 0, 5, 0),
              decoration: BoxDecoration(
                color: index == navController.selectedIndex.value
                    ? Colors.grey[700]
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(Dimensions.radius30),
              ),
              duration: const Duration(milliseconds: 300),
              child: Center(
                child: BigText(
                  text: navController.nav[index],
                  color: index == navController.selectedIndex.value
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
