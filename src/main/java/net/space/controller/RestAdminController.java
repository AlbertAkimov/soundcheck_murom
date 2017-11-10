package net.space.controller;

import net.space.model.Band;
import net.space.service.BandService;
import net.space.validators.json.JsonResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

/**
 * @Author A.Albert
 * @Data 21.10.17
 * @Time 11:27
 * @Version 1.0
 * @Info nothing
 */

@RestController
public class RestAdminController {

    private BandService service;

    private HashMap<String, Object> param = new HashMap<>();

    @Autowired(required = true)
    @Qualifier(value = "bandService")
    public void setService(BandService service) {
        this.service = service;
    }

    @PostMapping(value = "/filter", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public @ResponseBody
    ResponseEntity<?> getFilteredData(@RequestBody Band band) {

        JsonResponse js = new JsonResponse();

        if(band.getNameBand() != null)
            param.put("nameBand", band.getNameBand());

        if(band.getDateBand() != null)
            param.put("dateBand", band.getDateBand());

        if(band.getStartTime() != null)
            param.put("startTime", band.getStartTime());

        if(band.getEndTime() != null)
            param.put("endTime", band.getEndTime());

        if(band.getCreateDate() != null)
            param.put("createDate", band.getCreateDate());

        if(band.getComment() != null)
            param.put("comment", band.getComment());

        if(band.getCountHours() != 0)
            param.put("countHours", band.getCountHours());

        if(band.getPrice() != 0)
            param.put("price", band.getPrice());

        List<Band> bands = this.service.getBandByParam(param);

        if(!bands.isEmpty()) {
            js.setStatus("SUCCESS");
            js.setResult(bands);
        }
        else
            js.setStatus("FAIL");

        param.clear();

        return ResponseEntity.ok(js);
    }
}
