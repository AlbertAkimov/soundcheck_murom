package net.space.dao;

import net.space.model.Contact;
import net.space.utilities.date.Queries;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author A.Albert
 * @Data 8/31/17
 * @Time 7:41 PM
 * @Version 1.0
 * @Info Implementation {@link ContactDao} interface
 */

@Repository
public class ContactDaoImpl implements ContactDao {

    private static final Logger LOGGER = LoggerFactory.getLogger(ContactDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    @Override
    public void addContact(Contact contact) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(contact);

        LOGGER.info("Contact successfully added. Details added contact: " + contact);
    }

    @Override
    public void updateContact(Contact contact) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(contact);

        LOGGER.info("Contact successfully update. Details updated contact: " + contact);
    }

    @Override
    public void removeContact(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Contact contact = (Contact) session.load(Contact.class, id);

        if(contact != null)
            session.delete(contact);

        LOGGER.info("Contact successfully deleted. Details deleted contact: " + contact);
    }

    @Override
    public Contact getContactById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Contact contact = (Contact) session.get(Contact.class, id);

        LOGGER.info("Contact successfully loaded. Details loaded contact: " + contact);

        return contact;
    }

    @Override
    public List<Contact> listContact() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Contact> listContact = session.createQuery(Queries.CONTACT_QUERY).list();

        for(Contact contact : listContact)
            LOGGER.info("List contacts: " + contact);

        return listContact;
    }
}
