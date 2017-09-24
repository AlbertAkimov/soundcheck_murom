package net.space.utilities.date;

import net.space.model.Band;

import java.util.List;

/**
 * @Author A.Albert
 * @Data 06.09.17
 * @Time 13:10
 * @Version 1.0
 * @Info empty
 */

public class TimeUtils {

    private List<Band> bands;

    public TimeUtils(List<Band> bands) {
        this.bands = bands;
    }

    public List<Band> convertTimeOfList() {

        for(Band band : bands) {
            String startTime = band.getStartTime().substring(0, 5);
            String endTime = band.getEndTime().substring(0, 5);

            band.setStartTime(startTime);
            band.setEndTime(endTime);
        }
        return bands;
    }
}
