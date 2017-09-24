package net.space.utilities.date;

import net.space.model.Band;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * @Author A.Albert
 * @Data 8/9/17
 * @Time 9:47 AM
 * @Version 1.0
 * @Info empty
 */

public class DateUtils {

    private static final String[] months = {"Янв", "Феб", "Мрт", "Апр",
                                            "Май", "Июн", "Июл", "Авг",
                                            "Снт", "Окт", "Ноя", "Дек"
                                           };
    /**
     * @param date this param of field 'bandDate' from simple javaBean {@link Band} class.
     * @return format month to string.
     */
    public static String getMonthName(Date date) {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);

        return months[calendar.get(Calendar.MONTH)];
    }

    /**
     * @param date this param of field 'bandDate' from simple javaBean {@link Band} class.
     * @return int year from {@param date}.
     */
    public static int getYear(Date date) {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);

        return calendar.get(Calendar.YEAR);
    }

    /**
     * @param date this param of field 'bandDate' from simple javaBean {@link Band} class.
     * @return int day from param {@param date}.
     */
    public static int getDay(Date date) {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);

        return calendar.get(Calendar.DAY_OF_MONTH);
    }
}
