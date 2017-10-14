package net.space.dao;

import net.space.model.Band;
import net.space.model.User;
import net.space.service.SecurityService;
import net.space.service.UserService;
import net.space.utilities.converter.ListConverter;
import net.space.utilities.date.Queries;
import net.space.utilities.date.TimeUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * @Author A.Albert
 * @Data 8/3/17
 * @Time 10:05 AM
 * @Version 1.0
 * @Info Implementation {@link BandDao} interface.
 */

@Repository
public class BandDaoImpl implements BandDao {

    private SessionFactory sessionFactory;

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    private static final Logger LOGGER = LoggerFactory.getLogger(BandDaoImpl.class);

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    /**
     * Loading an object 'Band' into the database
     * @param band java bean {@link Band} class
     */
    @Override
    public void addBand(Band band) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(band);

        LOGGER.info("Band successfully saved. Band details: " + band);
    }

    /**
     * Update the object 'Band' in the database
     * @param band java bean {@link Band} class
     */
    @Override
    public void updateBand(Band band) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(band);

        LOGGER.info("Band successfully update. Band details: " + band);
    }

    /**
     * Remove an object from the database
     * @param id of object {@link Band} class.
     */
    @Override
    public void removeBand(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Band band = (Band) session.load(Band.class, id);

        if(band != null)
            session.delete(band);

        LOGGER.info("Band successfully deleted. Band details: " + band);
    }

    /**
     * Get object 'Band' by id
     * @param id of object {@link Band} class.
     * @return java bean {@link Band} class.
     */
    @Override
    public Band getBandById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Band band = (Band) session.get(Band.class, id);

        LOGGER.info("Band successfully loaded");
        return band;
    }

    /**
     * Get objects with a converted structure and time
     * @return converted getListObject of objects {@link Band} class.
     */
    @Override
    @SuppressWarnings("unchecked")
    public List<List<Band>> lists() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Band> listBand = session.createSQLQuery(Queries.ACTUAL_DATE_OF_BAND)
                .addEntity(Band.class).list();

        LOGGER.info("List band successfully loaded.");

        TimeUtils timeUtils = new TimeUtils(listBand);
        listBand = timeUtils.convertTimeOfList();

        return ListConverter.convertContainer(listBand);
    }

    /**
     * Get a getListObject of objects
     * @return java bean {@link Band} class.
     */
    @Override
    @SuppressWarnings("unchecked")
    public List<Band> getListObject() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Band> listBand = session.createQuery(Queries.band).list();

        TimeUtils timeUtils = new TimeUtils(listBand);

        return timeUtils.convertTimeOfList();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Band> getPersonalList() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Band> listBand = session.createQuery(Queries.band).list();

        String userName = this.securityService.findLoggedInUsername();

        if(Objects.equals(userName, "anonymousUser")) {
            return null;
        }

        User loggedUser = userService.findByUsername(userName);

        List<Band> list = new ArrayList<>();

        for(Band band : listBand) {
            if(loggedUser.getId().equals(band.getUserID()))
                list.add(band);
        }

        TimeUtils timeUtils = new TimeUtils(list);

        return timeUtils.convertTimeOfList();
    }
}
