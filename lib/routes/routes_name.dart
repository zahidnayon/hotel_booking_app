import 'package:flutter/material.dart';
import 'package:hotel_booking_app/models/hotel_list_data.dart';
import 'package:hotel_booking_app/modules/bottom_tab/bottom_tab_screen.dart';
import 'package:hotel_booking_app/modules/hotel_booking/filter_screen/filters_screen.dart';
import 'package:hotel_booking_app/modules/hotel_booking/hotel_home_screen.dart';
import 'package:hotel_booking_app/modules/hotel_details/hotel_detailes.dart';
import 'package:hotel_booking_app/modules/hotel_details/reviews_list_screen.dart';
import 'package:hotel_booking_app/modules/hotel_details/room_booking_screen.dart';
import 'package:hotel_booking_app/modules/hotel_details/search_screen.dart';
import 'package:hotel_booking_app/modules/login/change_password.dart';
import 'package:hotel_booking_app/modules/login/forgot_password.dart';
import 'package:hotel_booking_app/modules/login/login_screen.dart';
import 'package:hotel_booking_app/modules/login/sign_up_screen.dart';
import 'package:hotel_booking_app/modules/profile/country_screen.dart';
import 'package:hotel_booking_app/modules/profile/currency_screen.dart';
import 'package:hotel_booking_app/modules/profile/edit_profile.dart';
import 'package:hotel_booking_app/modules/profile/help_center_screen.dart';
import 'package:hotel_booking_app/modules/profile/how_do_screen.dart';
import 'package:hotel_booking_app/modules/profile/invite_screen.dart';
import 'package:hotel_booking_app/modules/profile/settings_screen.dart';
import 'package:hotel_booking_app/routes/routes.dart';

class NavigationServices {
  NavigationServices(this.context);

  final BuildContext context;

  Future<dynamic> _pushMaterialPageRoute(Widget widget,
      {bool fullscreenDialog = false}) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => widget, fullscreenDialog: fullscreenDialog),
    );
  }

  void gotoSplashScreen() {
    Navigator.pushNamedAndRemoveUntil(
        context, RoutesName.Splash, (Route<dynamic> route) => false);
  }

  void gotoIntroductionScreen() {
    Navigator.pushNamedAndRemoveUntil(context, RoutesName.IntroductionScreen,
            (Route<dynamic> route) => false);
  }

  Future<dynamic> gotoLoginScreen() async {
    return await _pushMaterialPageRoute(LoginScreen());
  }

  Future<dynamic> gotoTabScreen() async {
    return await _pushMaterialPageRoute(BottomTabScreen());
  }

  Future<dynamic> gotoSignScreen() async {
    return await _pushMaterialPageRoute(SignUpScreen());
  }

  Future<dynamic> gotoForgotPassword() async {
    return await _pushMaterialPageRoute(ForgotPasswordScreen());
  }

  Future<dynamic> gotoSearchScreen() async {
    return await _pushMaterialPageRoute(SearchScreen());
  }

  Future<dynamic> gotoHotelHomeScreen() async {
    return await _pushMaterialPageRoute(HotelHomeScreen());
  }

  Future<dynamic> gotoFiltersScreen() async {
    return await _pushMaterialPageRoute(FiltersScreen());
  }

  Future<dynamic> gotoRoomBookingScreen(String hotelname) async {
    return await _pushMaterialPageRoute(
        RoomBookingScreen(hotelName: hotelname));
  }

  Future<dynamic> gotoHotelDetailes(HotelListData hotelData) async {
    return await _pushMaterialPageRoute(HotelDetailes(
      hotelData: hotelData,
    ));
  }

  Future<dynamic> gotoReviewsListScreen() async {
    return await _pushMaterialPageRoute(ReviewsListScreen());
  }

  Future<dynamic> gotoHowDoScreen() async {
    return await _pushMaterialPageRoute(HowDoScreen());
  }

  Future<dynamic> gotoCurrencyScreen() async {
    return await _pushMaterialPageRoute(CurrencyScreen(),
        fullscreenDialog: true);
  }

  Future<dynamic> gotoCountryScreen() async {
    return await _pushMaterialPageRoute(CountryScreen(),
        fullscreenDialog: true);
  }

  Future<dynamic> gotoInviteFriend() async {
    return await _pushMaterialPageRoute(InviteFriend());
  }

  Future<dynamic> gotoChangepasswordScreen() async {
    return await _pushMaterialPageRoute(ChangepasswordScreen());
  }

  Future<dynamic> gotoHelpCenterScreen() async {
    return await _pushMaterialPageRoute(HelpCenterScreen());
  }

  Future<dynamic> gotoSettingsScreen() async {
    return await _pushMaterialPageRoute(SettingsScreen());
  }

  Future<dynamic> gotoEditProfile() async {
    return await _pushMaterialPageRoute(EditProfile());
  }
}