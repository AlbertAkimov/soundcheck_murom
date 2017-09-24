package net.space.service;

import net.space.dao.BandDao;
import net.space.model.Band;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author A.Albert
 * @Data 8/3/17
 * @Time 10:36 AM
 * @Version 1.0
 * @Info Implementation {@link BandService} interface.
 */

@Service
public class BandServiceImpl implements BandService{

    private BandDao bandDao;

    public void setBandDao(BandDao bandDao) {
        this.bandDao = bandDao;
    }

    @Override
    @Transactional
    public void addBand(Band band) {
        this.bandDao.addBand(band);
    }

    @Override
    @Transactional
    public void updateBand(Band band) {
        this.bandDao.updateBand(band);
    }

    @Override
    @Transactional
    public void removeBand(int id) {
        this.bandDao.removeBand(id);
    }

    @Override
    @Transactional
    public Band getBandById(int id) {
        return this.bandDao.getBandById(id);
    }

    @Override
    @Transactional
    public List<List<Band>> lists() {
        return this.bandDao.lists();
    }

    @Override
    @Transactional
    public List<Band> getListObject() {
        return this.bandDao.getListObject();
    }

    @Override
    @Transactional
    public List<Band> getPersonalList() {
        return this.bandDao.getPersonalList();
    }
}
