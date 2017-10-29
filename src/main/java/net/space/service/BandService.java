package net.space.service;

import net.space.model.Band;

import java.util.List;

/**
 * @Author A.Albert
 * @Data 8/3/17
 * @Time 10:36 AM
 * @Version 1.0
 * @Info empty
 */

public interface BandService {

    public void addBand(Band band);

    public void updateBand(Band band);

    public void removeBand(int id);

    public Band getBandById(int id);

    public List<Band> getBandByNameBand(String nameBand);

    public List<List<Band>> lists();

    public List<Band> getListObject();

    public List<Band> getPersonalList();
}
