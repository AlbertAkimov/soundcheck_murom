package net.space.controller;

import net.space.model.Band;
import net.space.model.User;
import net.space.service.BandService;
import net.space.service.SecurityServiceImpl;
import net.space.service.UserServiceImpl;
import net.space.utilities.date.BandDateUtils;
import net.space.utilities.message.errors.MessageErrors;
import net.space.validators.BandValidator;
import net.space.validators.json.JsonResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * @Author A.Albert
 * @Data 8/23/17
 * @Time 10:08 PM
 * @Version 1.0
 * @Info empty
 */

@RestController
public class RestBandController {

    private BandService service;

    @Autowired
    private SecurityServiceImpl securityService;

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private BandValidator bandValidator;

    @Autowired(required = true)
    @Qualifier(value = "bandService")
    public void setService(BandService service) {
        this.service = service;
    }

    @PostMapping(value = "/main/add/band", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public @ResponseBody
    ResponseEntity<?> addBand(@RequestBody Band band, Errors errors) {

        bandValidator.validate(band, errors);
        JsonResponse jr = new JsonResponse();

        if(errors.hasErrors()) {
            jr.setStatus("FAIL");
            jr.setResult(errors.getAllErrors());
        }

        else {
            jr.setStatus("SUCCESS");
            jr.setResult(band);

            if(band.getId() == 0) {
                String userName = this.securityService.findLoggedInUsername();
                User loggedUser = this.userService.findByUsername(userName);

                band.setUserID(loggedUser.getId());

                service.addBand(BandDateUtils.breakADate(band));
            }

            else
                service.updateBand(band);
        }

        return ResponseEntity.ok(jr);
    }

    @GetMapping(value = "/personal-list", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public @ResponseBody ResponseEntity<?> getPersonalList() {

        List<Band> listBand = this.service.getPersonalList();
        JsonResponse jr = new JsonResponse();

        if(listBand == null) {
            jr.setStatus("FAIL");
            jr.setResult(MessageErrors.ERROR_AUTHORIZATION);
        }

        else if (listBand.isEmpty()) {
            jr.setStatus("FAIL");
            jr.setResult(MessageErrors.EMPTY_LIST_OBJECT);
        }

        else {
            jr.setStatus("SUCCESS");
            jr.setResult(listBand);
        }

        return ResponseEntity.ok(jr);
    }

    @GetMapping(value = "/refresh", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public @ResponseBody ResponseEntity<?> refreshData() {

        List<List<Band>> lists = this.service.lists();
        JsonResponse jr = new JsonResponse();

        if(!lists.isEmpty()) {
            jr.setStatus("SUCCESS");
            jr.setResult(lists);
        }

        return ResponseEntity.ok(jr);
    }
}
