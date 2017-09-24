import net.space.service.BandService;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @Author A.Albert
 * @Data 05.09.17
 * @Time 14:22
 * @Version 1.0
 * @Info empty
 */

@RunWith(SpringJUnit4ClassRunner.class)
@DirtiesContext(classMode = DirtiesContext.ClassMode.AFTER_EACH_TEST_METHOD)
@ContextConfiguration("classpath:appconfig-root-test.xml")
public class TestCurrentDate {
    
    private BandService service;

    @Autowired
    @Qualifier("bandService")
    public void setService(BandService service) {
        this.service = service;
    }

}
