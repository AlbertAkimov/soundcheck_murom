package net.space.controller;

import net.space.model.Band;
import net.space.model.User;
import net.space.service.*;
import net.space.validators.BandValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author A.Albert
 * @Data 8/4/17
 * @Time 9:35 AM
 * @Version 1.0
 * @Info empty
 */

@Controller
public class BandController {

    private BandService service;

    @Autowired(required = true)
    @Qualifier(value = "bandService")
    public void setService(BandService service) {
        this.service = service;
    }

    @RequestMapping(value = {"/", "/main"}, method = RequestMethod.GET)
    public String listBand(Model model) {
        model.addAttribute("band", new Band());
        model.addAttribute("listBand", this.service.lists());
        return "main";
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String commonsList(Model model) {
        model.addAttribute("listBand", this.service.getListObject());
        return "fulllist";
    }

    @RequestMapping(value = "/personal-page", method = RequestMethod.GET)
    public String getPersonalPage(Model model) {
        List<Band> bandList = this.service.getPersonalList();
        model.addAttribute("listBand", bandList);

        return "personalPage";
    }

    @RequestMapping(value = "/remove/{id}")
    public String removeBand(@PathVariable("id") int id) {
        this.service.removeBand(id);

        return "redirect:/admin";
    }

    @RequestMapping(value = "edit/{id}")
    public String editBand(@PathVariable("id") int id, Model model) {
        model.addAttribute("band", this.service.getBandById(id));
        model.addAttribute("listBand", this.service.lists());

        return "admin";
    }
}

