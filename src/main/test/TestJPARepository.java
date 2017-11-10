import net.space.dao.TestJPA;
import net.space.model.Band;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

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
public class TestJPARepository {

    @Autowired
    private TestJPA testing;

    @Test
    public void testJPA() {
        List<Band> bands = testing.getBandsByParam("Metallica");

        System.out.println(bands.get(0));
    }
}
