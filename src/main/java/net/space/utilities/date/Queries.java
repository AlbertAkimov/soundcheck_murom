package net.space.utilities.date;

/**
 * @Author A.Albert
 * @Data 8/3/17
 * @Time 10:34 AM
 * @Version 1.0
 * @Info empty
 */

public class Queries {

    public static final String band = "from Band";

    public static final String CONTACT_QUERY = "from Contact";

    public static final String ACTUAL_DATE_OF_BAND = "SELECT * FROM band WHERE DATE_BAND >= curdate()";

    public static final String GET_BAND_BY_NAME = "SELECT";
}
