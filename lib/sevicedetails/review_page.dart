import 'package:famous_steam_staff/bloc/rating_review_list_bloc.dart';
import 'package:famous_steam_staff/bottombar/homePage2.dart';
import 'package:famous_steam_staff/bottombar/setting_page.dart';
import 'package:famous_steam_staff/common/custom_appbar.dart';
import 'package:famous_steam_staff/model/rating_review_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../model/customer_rating_model.dart';
class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  void initState() {
    super.initState();

    ratingreviewlistbloc.ratingreviewstreamsink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: WidgetAppBar(

        ),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 18.w, right: 18.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  serviceList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> serviceChildList( List<Data> ratingreviewlistsnapshot) {
    List<Widget> widgets = [];
    for (Data data in ratingreviewlistsnapshot!) {
      widgets.add(

          Container(
margin: EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0.0, 2.0),
                  spreadRadius: 0.0,
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10,right: 10),
                  child: Text(
                    " ${data.review}",
                    style: GoogleFonts.montserrat(
                      fontSize: 16.0,
                      color: const Color(0xff004471),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(padding:  const EdgeInsets.only(left: 15, top: 10,right: 10),
                child:  RatingBarIndicator(
                  itemSize: 20.w,
                  rating: data!.rating == null? 0: parseAmount(data!.rating),
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  itemCount: 5,
                  direction: Axis.horizontal,
                ),
                ),

                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          )

      );
    }
    return widgets;
  }

  Widget serviceList() {
    return StreamBuilder<CustomerRatingModel>(
        stream: ratingreviewlistbloc.ratingreviewstream,
        builder: (context,
            AsyncSnapshot<CustomerRatingModel> ratingreviewlistsnapshot) {
          if (!ratingreviewlistsnapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          {
            return ratingreviewlistsnapshot.data!.data!.isEmpty
                ? Center(
                    child: Text(
                      'No Data Found',
                      style: GoogleFonts.montserrat(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: serviceChildList(ratingreviewlistsnapshot.data!.data!)
            );
          }
        });
  }

  double parseAmount(dynamic dAmount){

    double returnAmount = 0.00;
    String strAmount;

    try {

      if (dAmount == null || dAmount == 0) return 0.0;

      strAmount = dAmount.toString();

      if (strAmount.contains('.')) {
        returnAmount = double.parse(strAmount);
      }else{
        returnAmount = double.parse(strAmount);
        // Didn't need else since the input was either 0, an integer or a double
      }
    } catch (e) {
      return 0.0;
    }

    return returnAmount;
  }
}
