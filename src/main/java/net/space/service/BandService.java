package net.space.service;

import net.space.model.Band;

import java.util.HashMap;
import java.util.List;

/**
 * @Author A.Albert
 * @Data 8/3/17
 * @Time 10:36 AM
 * @Version 1.0
 * @Info empty
 */

public interface BandService {

    void addBand(Band band);

    void updateBand(Band band);

    void removeBand(int id);

    Band getBandById(int id);

    List<Band> getBandByNameBand(String nameBand);

    List<List<Band>> lists();

    List<Band> getListObject();

    List<Band> getPersonalList();

    List<Band> getBandByParam(HashMap<String, Object> param);
}
