import org.junit.Assert;
import org.junit.Test;

import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 * @Author A.Albert
 * @Data 8/11/17
 * @Time 8:10 PM
 * @Version 1.0
 * @Info test convert string with times to java object {@link java.sql.Time} class.
 */

public class TestTime {

    public static void main(String[] args) {

    }

    @Test
    public void testDiffTime() throws ParseException { // todo this method is bad. I'm testing convert 'String' to 'Time' and 'Calendar'
        DateFormat formatter = new SimpleDateFormat("HH:mm");

        String start = "11:00";
        String end = "13:00";

        Time startTime = new Time(formatter.parse(start).getTime());
        Time endTime = new Time(formatter.parse(end).getTime());

        Calendar cal1 = Calendar.getInstance();
        Calendar cal2 = Calendar.getInstance();

        cal1.setTime(startTime);
        cal2.setTime(endTime);


        System.out.println(cal1.get(Calendar.HOUR) - cal2.get(Calendar.HOUR));
        System.out.println(startTime);

    }

    @Test
    public void testDiffTime2() {
        int start = Integer.valueOf("11:00".substring(0, 2));
        int end = Integer.valueOf("13:00".substring(0, 2));
        int difference = (end - start);
        boolean indicator = false;

        Assert.assertNotEquals(start, end);

        if (difference != 0) indicator = true;

        Assert.assertTrue(indicator);

        System.out.println("Difference time: " + (end - start));
    }

    @Test
    public void testClearMilliSec() {
        String start = "12:00:00";
        String end = "13:00:00";

        String newStart = start.substring(0,5);
        String newEnd = end.substring(0,5);

        System.out.println("Convert milliseconds: " + newStart + " and " + newEnd);
    }
}
