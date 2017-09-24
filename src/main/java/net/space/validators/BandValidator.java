package net.space.validators;

import net.space.model.Band;
import net.space.service.BandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @Author A.Albert
 * @Data 8/15/17
 * @Time 2:30 PM
 * @Version 1.0
 * @Info Validator for {@link Band} class.
 */

@Component
public class BandValidator implements Validator {

    @Autowired
    private BandService bandService;

    @Override
    public boolean supports(Class<?> clazz) {
        return Band.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {

        Band band = (Band) target;
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        List<List<Band>> lists = bandService.lists();

        for (List<Band> bands : lists) {
            for(Band iBand : bands) {
                if(dateFormat.format(band.getDateBand()).equals(dateFormat.format(iBand.getDateBand()))) {

                    if(band.getStartTime().equals(iBand.getStartTime().substring(0, 5))) {
                        errors.rejectValue("startTime", "Для выбранной даты это время уже используется.");
                    }

                    if(band.getEndTime().equals(iBand.getEndTime().substring(0, 5))){
                        errors.rejectValue("endTime", "Для выбранной даты это время уже используется.");
                    }
                }

                if(errors.hasErrors())
                    break;

            }

            if(errors.hasErrors())
                break;
        }
    }
}
