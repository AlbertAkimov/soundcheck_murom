package net.space.controller;

import net.space.model.Contact;
import net.space.model.User;
import net.space.service.ContactService;
import net.space.service.SecurityServiceImpl;
import net.space.service.UserServiceImpl;
import net.space.utilities.EmailAddress;
import net.space.validators.json.JsonResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author A.Albert
 * @Data 8/31/17
 * @Time 1:31 PM
 * @Version 1.0
 * @Info empty
 */

@RestController
public class ContactController {

    private static final Logger LOGGER = LoggerFactory.getLogger(ContactController.class);

    private JavaMailSender mailSender;

    private SimpleMailMessage templateMessage;

    private ContactService service;

    @Autowired
    private SecurityServiceImpl securityService;

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    @Qualifier(value = "contactService")
    public void setService(ContactService service) {
        this.service = service;
    }

    @Autowired
    @Qualifier("mailSender")
    public void setMailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    @Autowired
    @Qualifier("templateMessage")
    public void setTemplateMessage(SimpleMailMessage templateMessage) {
        this.templateMessage = templateMessage;
    }

    @PostMapping(value = "/contact", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public @ResponseBody
    ResponseEntity<?> sendMessage(@RequestBody Contact contact, Errors error) {

        JsonResponse jr = new JsonResponse();

        if(!error.hasErrors()) {
            String userName = securityService.findLoggedInUsername();
            User user = userService.findByUsername(userName);

            contact.setUserID(user.getId());

            if (contact.getId() == 0)
                service.addContact(contact);

            else
                service.updateContact(contact);

            SimpleMailMessage mailMessage = new SimpleMailMessage(templateMessage);

            mailMessage.setTo(EmailAddress.TO_EMAIL_SOUNDCHECK);
            mailMessage.setText(EmailAddress.buildMessage(contact.getMessage(), contact.getNameAuthor(), contact.getEmail()));

            try {
                mailSender.send(mailMessage);
                jr.setStatus("SUCCESS");
                jr.setResult(contact);
                LOGGER.info("Message successfully send");
            } catch (MailException mailException) {
                LOGGER.info("Message send fail");
                mailException.printStackTrace();
            }
        }

        else {
            jr.setStatus("FAIL");
            jr.setResult(error);
        }


        return ResponseEntity.ok(jr);
    }
}
