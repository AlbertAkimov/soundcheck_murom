package util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * @Author A.Albert
 * @Data 06.10.17
 * @Time 19:17
 * @Version 1.0
 * @Info empty
 */
public class HibernateUtil {

    private static SessionFactory sessionFactory;

    static {
        try {
            Configuration configuration = new Configuration();
            configuration.configure("hibernate.xml");

            sessionFactory = configuration.buildSessionFactory();


        }catch (Throwable tr) {
            throw new ExceptionInInitializerError(tr);
        }
    }

    public static Session getSession() {
        return sessionFactory.openSession();
    }

}
