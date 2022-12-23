import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sport/common/assets.dart';

import '../common/colors.dart';

class BoardCard extends StatelessWidget {
  final String? strLeague;
  final String strStatus;
  final String? strHomeTeam;
  final String? strAwayTeam;
  final String? intHomeScore;
  final String? intAwayScore;
  final String? strEventTime;
  const BoardCard({
    Key? key,
    this.strLeague,
    this.strStatus = 'Live',
    this.strHomeTeam,
    this.strAwayTeam,
    this.intHomeScore,
    this.intAwayScore,
    this.strEventTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat('#');
    return Container(
      height: MediaQuery.of(context).size.height / 3 * 0.7,
      margin: const EdgeInsets.only(
        top: 20,
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
          color: AppColors.cardColor, borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColors.fieldscardColor,
                borderRadius: BorderRadius.circular(3)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  height: 16,
                  width: 16,
                  Assets.cup,
                  color: AppColors.orangeColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  strLeague!,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                        '${strEventTime!.split(':').first}:${strEventTime!.split(':').last}'),
                  ],
                )
              ],
            ),
          ),
          Text(
            strStatus == '2H' ? 'Finished' : 'Live',
            style: GoogleFonts.inter(
                fontStyle: FontStyle.italic,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: strStatus == '2H'
                    ? AppColors.grayColor
                    : AppColors.orangeColor),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Row(
              children: [
                const Spacer(),
                Expanded(
                  child: Text(
                    strHomeTeam!,
                    maxLines: 1,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
                const SizedBox(
                  height: 60,
                  width: 2.0,
                  child: ColoredBox(
                    color: Color(0xff535353),
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: Text(
                    strAwayTeam!,
                    maxLines: 1,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: AppColors.fieldscardColor,
                borderRadius: BorderRadius.circular(3)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  intHomeScore == null ? "-" : intHomeScore!,
                  style: TextStyle(
                      color: intHomeScore == null
                          ? Colors.white
                          : AppColors.orangeColor),
                ),
                Text(
                  intAwayScore == null ? "-" : intAwayScore!,
                  style: TextStyle(
                      color: intAwayScore == null
                          ? Colors.white
                          : AppColors.orangeColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
