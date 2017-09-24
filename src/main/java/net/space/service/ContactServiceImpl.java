package net.space.service;

import net.space.dao.ContactDao;
import net.space.model.Contact;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author A.Albert
 * @Data 8/31/17
 * @Time 8:18 PM
 * @Version 1.0
 * @Info Implementation {@link ContactService} interface.
 */

@Service
public class ContactServiceImpl implements ContactService {

    private ContactDao contactDao;

    public void setContactDao(ContactDao contactDao) {
        this.contactDao = contactDao;
    }

    @Override
    @Transactional
    public void addContact(Contact contact) {
        this.contactDao.addContact(contact);
    }

    @Override
    @Transactional
    public void updateContact(Contact contact) {
        this.contactDao.updateContact(contact);
    }

    @Override
    @Transactional
    public void removeContact(int id) {
        this.contactDao.removeContact(id);
    }

    @Override
    @Transactional
    public Contact getContactById(int id) {
        return this.contactDao.getContactById(id);
    }

    @Override
    @Transactional
    public List<Contact> listContact() {
        return this.contactDao.listContact();
    }
}
