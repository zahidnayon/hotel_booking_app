import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotel_booking_app/language/appLocalizations.dart';
import 'package:hotel_booking_app/modules/bottom_tab/component/tab_button_ui.dart';
import 'package:hotel_booking_app/modules/explore/home_explore_screen.dart';
import 'package:hotel_booking_app/modules/profile/profile_screen.dart';
import 'package:hotel_booking_app/modules/trips/my_trips_screen.dart';
import 'package:hotel_booking_app/providers/theme_provider.dart';
import 'package:hotel_booking_app/utils/themes.dart';
import 'package:hotel_booking_app/widgets/common_card.dart';
import 'package:provider/provider.dart';

class BottomTabScreen extends StatefulWidget {
  const BottomTabScreen({Key? key}) : super(key: key);

  @override
  State<BottomTabScreen> createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  BottomBarType bottomBarType = BottomBarType.Explore;
  bool _isFirstTime = true;
  Widget _indexView = Container();

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
    _indexView = Container();
    WidgetsBinding.instance!.addPostFrameCallback((_) {_startLoadingScreen();});
    super.initState();
  }

  Future _startLoadingScreen() async {
    await Future.delayed(Duration(milliseconds: 480));
    setState(() {
      _isFirstTime = false;
      _indexView = HomeExploreScreen(
        animationController: _animationController,
      );
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (_, provider, child) => Container(
        child: Scaffold(
          bottomNavigationBar: Container(
            height: 60 + MediaQuery.of(context).padding.bottom,
            child: getBottomBarUI(bottomBarType),
          ),
          body: _isFirstTime ? Center(
            child: CircularProgressIndicator(strokeAlign: 2,),
          ) : _indexView
        ),
      ),
    );
  }

  getBottomBarUI(BottomBarType bottomBarType) {
    return CommonCard(
      color: AppTheme.backgroundColor,
      radius: 0,
      child: Column(
        children: [
          Row(
            children: [
              TabButtonUI(
                icon: Icons.search,
                isSelected: bottomBarType == BottomBarType.Explore,
                text: AppLocalizations(context).of("explore"),
                onTap: () {
                  tabClick(BottomBarType.Explore);
                },
              ),
              TabButtonUI(
                icon: FontAwesomeIcons.heart,
                isSelected: bottomBarType == BottomBarType.Trips,
                text: AppLocalizations(context).of("trips"),
                onTap: () {
                  tabClick(BottomBarType.Trips);
                },
              ),
              TabButtonUI(
                icon: FontAwesomeIcons.user,
                isSelected: bottomBarType == BottomBarType.Profile,
                text: AppLocalizations(context).of("profile"),
                onTap: () {
                  tabClick(BottomBarType.Profile);
                },
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }

  void tabClick(BottomBarType tabType) {
    if (tabType != bottomBarType) {
      bottomBarType = tabType;
      _animationController.reverse().then((value) => {
            if (tabType == BottomBarType.Explore)
              {
                setState((){
                  _indexView = HomeExploreScreen(
                      animationController: _animationController);
                }),
              }
            else if (tabType == BottomBarType.Trips)
              {
                setState((){
                  _indexView = MyTripsScreen(
                      animationController: _animationController);
                }),
              }
            else if (tabType == BottomBarType.Profile)
              {
                setState((){
                  _indexView = ProfileScreen(
                      animationController: _animationController);
                }),
              }
          },
      );
    }
  }
}

enum BottomBarType { Explore, Trips, Profile }
