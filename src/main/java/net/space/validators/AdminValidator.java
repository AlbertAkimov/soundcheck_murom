package net.space.validators;

import net.space.model.Band;
import net.space.service.BandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Author A.Albert
 * @Data 21.10.17
 * @Time 11:27
 * @Version 1.0
 * @Info validator for {@link net.space.model.Band} class on admin page.
 */

@Component
public class AdminValidator implements Validator {


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
        List<Band> lists = bandService.getListObject();

        for(Band iBand : lists) {
            if (iBand.getId() != band.getId() && band.getStartTime() != null && band.getEndTime() != null && band.getDateBand() != null) {
                if (dateFormat.format(band.getDateBand()).equals(dateFormat.format(iBand.getDateBand()))) {

                    if (band.getStartTime().equals(iBand.getStartTime().substring(0, 5))) {
                        errors.rejectValue("startTime", "This.Time.Already.exist");
                    }

                    if (band.getEndTime().equals(iBand.getEndTime().substring(0, 5))) {
                        errors.rejectValue("endTime", "This.Time.Already.exist");
                    }
                }

                if (errors.hasErrors())
                    break;
            }
        }
    }
}
