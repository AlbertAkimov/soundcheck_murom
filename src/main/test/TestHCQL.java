import net.space.model.Band;
import net.space.service.BandService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @Author A.Albert
 * @Data 21.10.17
 * @Time 11:27
 * @Version 1.0
 * @Info nothing
 */

@RunWith(SpringJUnit4ClassRunner.class)
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_EACH_TEST_METHOD)
@ContextConfiguration("classpath:appconfig-root-test.xml")
@WebAppConfiguration("appconfig-root-test.xml")
public class TestHCQL {

    private BandService service;

    @Autowired(required = true)
    @Qualifier("bandService")
    public void setService(BandService service) {
        this.service = service;
    }


    @Test
    public void getBandByParamTest() {
        HashMap<String, Object> param = new HashMap<>();
        Date dateBand = new Date();
        param.put("nameBand", "Metallica");
        param.put("startTime", "22:00:00");
        param.put("dateBand", dateBand);

        List<Band> bands = this.service.getBandByParam(param);

        for(Band band : bands) {
            System.out.println(band);
        }
    }

}
