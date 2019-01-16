
package controllers.referee;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.ComplaintService;
import services.CustomerService;
import services.RefereeService;
import services.ReportService;
import controllers.AbstractController;
import domain.Complaint;

@Controller
@RequestMapping("/complaint")
public class ComplaintRefereeController extends AbstractController {

	@Autowired
	private CustomerService		customerService;

	@Autowired
	private ComplaintService	complaintService;

	@Autowired
	private RefereeService		refereeService;

	@Autowired
	private ReportService		reportService;


	@RequestMapping(value = "/referee/list", method = RequestMethod.GET)
	public ModelAndView getComplaint() {
		ModelAndView result;
		final Collection<Complaint> complaints = this.complaintService.findAll();
		result = new ModelAndView("complaint/list");
		result.addObject("requestURI", "referee/complaint/list.do");
		result.addObject("complaints", complaints);
		return result;
	}

	@RequestMapping(value = "/referee/show", method = RequestMethod.GET)
	public ModelAndView display(final int complaintId) {
		ModelAndView result;
		final Complaint complaint = this.complaintService.findOne(complaintId);
		result = new ModelAndView("complaint/show");
		result.addObject("requestURI", "complaint/referee/show.do");
		result.addObject("complaint", complaint);
		return result;
	}

}
