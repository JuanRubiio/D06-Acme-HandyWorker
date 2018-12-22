
package services;

import java.util.Collection;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import utilities.AbstractTest;
import domain.Application;
import domain.CreditCard;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
	"classpath:spring/datasource.xml", "classpath:spring/config/packages.xml"
})
@Transactional
public class ApplicationServiceTest extends AbstractTest {

	@Autowired
	private ApplicationService	applicationService;
	
	@Autowired
	private CreditCardService creditCardService;

	@Test
	public void testCreateApplication() {
		super.authenticate("handyWorker1");
		final Application application = this.applicationService.create(1425);
		//Sin los 2 set funciona bien tambien
		application.setPrice(174.0);
		application.setHandyWorkerComments("¿Como estan ustedes?");
		Assert.notNull(application);
	}
	
	@Test
	public void testSaveApplication() {
		super.authenticate("customer1");
		final Application application = this.applicationService.findOne(1429);
		application.setStatus("REJECTED");
		this.applicationService.save(application);
		Assert.isTrue(this.applicationService.findAll().contains(application));
	}

	@Test
	public void testSaveApplication2() {
		super.authenticate("customer1");
		final Application application = this.applicationService.findOne(1429);
		application.setStatus("ACCEPTED");
		application.setCustomerComment("Bieennnn!");
		final CreditCard cd = this.creditCardService.findOne(1372);
		application.setCreditCard(cd);
		this.applicationService.save(application);
		Assert.isTrue(this.applicationService.findAll().contains(application));
	}
	
	@Test
	public void findOneTest() {
		final Application application = this.applicationService.findOne(1430);
		Assert.notNull(application);
	}

	@Test
	public void findAllTest() {
		final Collection<Application> application = this.applicationService.findAll();
		Assert.notEmpty(application);
	}

}
