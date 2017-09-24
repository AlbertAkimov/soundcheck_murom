package net.space.utilities.date;

import net.space.model.Band;

import java.util.Date;

/**
 * @Author A.Albert
 * @Data 8/9/17
 * @Time 12:50 PM
 * @Version 1.0
 * @Info empty
 */

public class BandDateUtils {

    public static Band breakADate(Band band) {
        band.setCreateDate(new Date());
        band.setCountHours(getDiffTimes(band.getStartTime(), band.getEndTime()));
        band.setPrice(band.getCountHours() * 250); //todo вынести отсюда!
        band.setYear(DateUtils.getYear(band.getDateBand()));
        band.setMonth(DateUtils.getMonthName(band.getDateBand()));
        band.setDay(DateUtils.getDay(band.getDateBand()));

        return band;
    }

    private static int getDiffTimes(String startTime, String endTime) {
        int start = Integer.valueOf(startTime.substring(0,2));
        int end = Integer.valueOf(endTime.substring(0,2));
        int difference = (end - start);

        boolean indicator = false;

        if(difference != 0)
            indicator = true;

        return difference;
    }
}
