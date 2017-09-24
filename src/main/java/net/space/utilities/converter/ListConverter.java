package net.space.utilities.converter;

import net.space.model.Band;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author A.Albert
 * @Data 06.09.17
 * @Time 16:04
 * @Version 1.0
 * @Info This class is Converter.
 */

public class ListConverter {

    private static final Logger LOGGER = LoggerFactory.getLogger(ListConverter.class);

    @SuppressWarnings("unchecked")
    public static List<List<Band>> convertContainer(List<Band> list) {

        LOGGER.debug("Start convert getListObject objects " + list.getClass());

        List<List<Band>> lists = new ArrayList();

        while (!list.isEmpty()){
            List<Band> res = new ArrayList<>();

            if(list.size() >= 5) {
                List<Band> chunck = list.subList(0, 5);
                res.addAll(chunck);
                lists.add(lists.size(), res);
                chunck.clear();
            }
            else {
                List<Band> chunck = list.subList(0, list.size());
                res.addAll(chunck);
                lists.add(lists.size(), res);
                chunck.clear();
            }

        }

        LOGGER.debug("Convert getListObject successfully");
        return lists;
    }
}
