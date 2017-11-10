package net.space.dao;

import net.space.model.Band;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Author A.Albert
 * @Data 21.10.17
 * @Time 11:27
 * @Version 1.0
 * @Info nothing
 */

@Repository
public interface TestJPA extends JpaRepository<Band, Long> {

    @Query(value = "SELECT * FROM band WHERE NAME_BAND=?", nativeQuery = true)
    List<Band> getBandsByParam(String nameBand);

    @Query(value = "SELECT * FROM band WHERE NAME_BAND = ?1 AND DATE_BAND = ?2", nativeQuery = true)
     List<Band> getBandsByParam(String nameBand, String dateBand);
}
