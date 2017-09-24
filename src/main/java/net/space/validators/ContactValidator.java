package net.space.validators;

import net.space.model.Contact;
import net.space.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

/**
 * @Author A.Albert
 * @Data 9/1/17
 * @Time 12:50 PM
 * @Version 1.0
 * @Info Validator for {@link Contact} class.
 */
@Component
public class ContactValidator implements Validator {

    @Autowired
    @Qualifier("contactServiceImpl")
    private ContactService service;

    @Override
    public boolean supports(Class<?> clazz) {
        return Contact.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {

        Contact contact = (Contact) target;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nameAuthor", "Поле обязательно для заплнения");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "Поле обязательно для заплнения");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "message", "Поле обязательно для заплнения");
    }
}
