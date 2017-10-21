package net.space.controller;

import net.space.model.Band;
import net.space.model.User;
import net.space.service.BandService;
import net.space.service.SecurityService;
import net.space.service.UserService;
import net.space.utilities.date.BandDateUtils;
import net.space.validators.AdminValidator;
import net.space.validators.BandValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Author A.Albert
 * @Data 19.10.17
 * @Time 20:32
 * @Version 1.0
 * @Info empty
 */

@Controller
public class AdminController {

    private BandService service;

    @Autowired
    private AdminValidator adminValidator;

    @Autowired
    private UserService userService;

    @Autowired(required = true)
    @Qualifier(value = "bandService")
    public void setService(BandService service) {
        this.service = service;
    }

    /**
     * @param model {@link Band} class.
     * @return jsp page admin.
     */

    @RequestMapping(value = "admin", method = RequestMethod.GET)
    public String adminList(Model model) {

        model.addAttribute("band", new Band());
        model.addAttribute("listBand", this.service.getListObject());
        return "admin";
    }

    /**
     * @param band Получаем объект {@link Band} из формы
     * @return redirect on admin page.
     */

    @RequestMapping(value = "/band/add", method = RequestMethod.POST)
    public String addBand(@ModelAttribute("band") Band band, BindingResult bindingResult) {

        adminValidator.validate(band, bindingResult);

        if(bindingResult.hasErrors())
            return "admin";

        if(band.getId() == 0) {
            band.setUserID(userService.getIDCurrentLoggedUser(this.userService.getCurrentLoggedUser()));
            this.service.addBand(BandDateUtils.breakADate(band));
        }
        else {
            band.setUserID(userService.getIDCurrentLoggedUser(this.userService.getCurrentLoggedUser()));
            this.service.updateBand(BandDateUtils.breakADate(band));
        }

        return "redirect:/admin";
    }

    /**
     * @param id объекта {@link Band}
     * @return redirect on admin page.
     */

    @RequestMapping(value = "/remove/{id}")
    public String removeBand(@PathVariable("id") int id) {

        this.service.removeBand(id);

        return "redirect:/admin";
    }

    /**
     * @param id объекта {@link Band}
     * @param model {@link Band} class.
     * @return admin page.
     */

    @RequestMapping(value = "edit/{id}")
    public String editBand(@PathVariable("id") int id, Model model) {

        model.addAttribute("band", this.service.getBandById(id));
        model.addAttribute("listBand", this.service.getListObject());

        return "admin";
    }

    /**
     * @return redirect on admin page.
     */

    @RequestMapping(value="/canceled")
    public String canceled() {
        return "admin";
    }
}
