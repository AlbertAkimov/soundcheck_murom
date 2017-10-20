package net.space.controller;

import net.space.model.Band;
import net.space.service.BandService;
import net.space.utilities.date.BandDateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    public BandService service;

    @Autowired(required = true)
    @Qualifier(value = "bandService")
    public void setService(BandService service) {
        this.service = service;
    }

    @RequestMapping(value = "admin", method = RequestMethod.GET)
    public String adminList(Model model) {
        model.addAttribute("band", new Band());
        model.addAttribute("listBand", this.service.getListObject());
        return "admin";
    }

    @RequestMapping(value = "/band/add", method = RequestMethod.POST)
    public String addBand(@ModelAttribute("band") Band band) {
        if(band.getId() == 0)
            this.service.addBand(BandDateUtils.breakADate(band));
        else
            this.service.updateBand(BandDateUtils.breakADate(band));

        return "redirect:/admin";
    }

    @RequestMapping(value = "/remove/{id}")
    public String removeBand(@PathVariable("id") int id) {
        this.service.removeBand(id);

        return "redirect:/admin";
    }

    @RequestMapping(value = "edit/{id}")
    public String editBand(@PathVariable("id") int id, Model model) {
        model.addAttribute("band", this.service.getBandById(id));
        model.addAttribute("listBand", this.service.getListObject());

        return "admin";
    }
}
