package net.space.service;

import net.space.model.Contact;

import java.util.List;

/**
 * @Author A.Albert
 * @Data 8/31/17
 * @Time 8:14 PM
 * @Version 1.0
 * @Info empty
 */

public interface ContactService {

    public void addContact(Contact contact);

    public void updateContact(Contact contact);

    public void removeContact(int id);

    public Contact getContactById(int id);

    public List<Contact> listContact();
}
