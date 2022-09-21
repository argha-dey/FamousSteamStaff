import 'package:famous_steam_staff/provider/accept_reject_provider.dart';
import 'package:famous_steam_staff/provider/dashboard_provider.dart';
import 'package:famous_steam_staff/provider/get_staff_provider.dart';
import 'package:famous_steam_staff/provider/get_status_provider.dart';
import 'package:famous_steam_staff/provider/getrating_provider.dart';
import 'package:famous_steam_staff/provider/rating_review_list_provider.dart';
import 'package:famous_steam_staff/provider/reset_paswword_provider.dart';
import 'package:famous_steam_staff/provider/login_provider.dart';
import 'package:famous_steam_staff/provider/service_list_provider.dart';
import 'package:famous_steam_staff/provider/servicedetail_provider.dart';
import 'package:famous_steam_staff/provider/status_complete_provider.dart';
import 'package:famous_steam_staff/provider/waiting_list_provider.dart';

import '../provider/customer_rating_provider.dart';
import '../provider/forgot_password_provider.dart';

class Repository {
  final LoginApi login = LoginApi();
  final ResetPasswordApi resetpassword = ResetPasswordApi();
  final ForgotPasswordApi forgotpassword = ForgotPasswordApi();
  final GetStatusApi getstatus = GetStatusApi();
  final DashboardAPI dashboard = DashboardAPI();
  final WaitingListAPI waitinglist = WaitingListAPI();
  final GetratingApi getratingApi = GetratingApi();
  final ServicedetailApi servicedetail = ServicedetailApi();
  final AcceptRejectApi acceptreject = AcceptRejectApi();
  final GetstaffAPI getstaffAPI = GetstaffAPI();
  final ServicelistApi servicelistApi = ServicelistApi();
  final RatingreviewlistApi ratingreviewlistApi = RatingreviewlistApi();
  final StatusCompleteApi statusCompleteApi = StatusCompleteApi();
  final RatingreviewlistApi reviewApi = RatingreviewlistApi();

  Future<dynamic> onratingreviewlistApi() => reviewApi.onratingreviewlistApi();




  //=================== login ===================//

  Future<dynamic> onlogin(String mobile, String password) =>
      login.onLoginAPI(mobile, password);

  //=================== forgot password ===================//

  Future<dynamic> onForgotPassword(
      int mobileNumber) =>
      forgotpassword.onForgotPasswordApi(
         mobileNumber);

  //=================== reset password ===================//

  Future<dynamic> onResetPassword(
          String oldpassword, String newpassword, String confirmpassword) =>
      resetpassword.onResetPasswordApi(
          oldpassword, newpassword, confirmpassword);

  //=================== GetStatus ===================//

  Future<dynamic> onGetStatus(String lang, String orderid) =>
      getstatus.onGetStatusApi(lang, orderid);

  //=================== Dashboard ===================//

  Future<dynamic> ondashboard() => dashboard.onDashboardAPI();

  //=================== SERVICE DETAIL API ===================

  Future<dynamic> onservicedetail(String orderid, String lang) =>
      servicedetail.onservicedetailApi(orderid, lang);

  //=================== GET RATING API  ===================

  Future<dynamic> getrating(String author_id,String model_id,String order_id,String review,String rating) =>
      getratingApi.onRatingAPI(author_id, model_id, order_id, review, rating);

  //=================== Waiting List ===================//

  Future<dynamic> onWaitingList() => waitinglist.onWaitingListAPI();

  //=================== ACCEPT REJECT API ===================

  Future<dynamic> onacceptReject(String orderid, String status) =>
      acceptreject.onacceptRejectApi(orderid, status);

  //=================== GET STAFF API ===================//

  Future<dynamic> ongetstaff() => getstaffAPI.onGetstaffAPI();

  //=================== SERVICE LIST API ===================

  Future<dynamic> onservicelist(String lang, String filterdate) =>
      servicelistApi.onservicelistApi(lang, filterdate);

  //=================== RATING REVIEW LIST API ===================//

  Future<dynamic> getratingreviewlist() =>
      ratingreviewlistApi.onratingreviewlistApi();

  //=================== STATUS COMPLETE ===================//

  Future<dynamic> statuscomplete(String orderid, String statusid) =>
      statusCompleteApi.onstatuscompleteAPI(orderid, statusid);
}
