import net.space.model.Band;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Assert;
import org.junit.Test;
import util.HibernateUtil;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

/**
 * @Author A.Albert
 * @Data 06.10.17
 * @Time 17:57
 * @Version 1.0
 * @Info empty
 */

public class TestGetActualData {

    @Test
    @SuppressWarnings("unchecked")
    public void getActulDataFromBand() {
        Session session = HibernateUtil.getSession();
        Transaction transaction = session.beginTransaction();

        try {
            List<Band> bands = session.createSQLQuery("SELECT * FROM band WHERE DATE_BAND = curdate()")
                    .addEntity(Band.class).list();

            Date currentDate = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            for(Band band : bands) {
                Assert.assertEquals(sdf.format(currentDate), String.valueOf(band.getDateBand()));
            }


        } finally {
            session.clear();
            session.close();
        }
    }
}
