package net.space.dao;

import net.space.model.Band;
import org.springframework.data.jpa.repository.Query;

import java.util.HashMap;
import java.util.List;

/**
 * @Author A.Albert
 * @Data 8/3/17
 * @Time 10:02 AM
 * @Version 1.0
 * @Info empty
 */

public interface BandDao {

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
