
package controllers;

import java.util.Collection;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.ComplaintService;
import domain.Complaint;

@Controller
@RequestMapping("/complaint/customer")
public class ComplaintHandyworkerController extends AbstractController {

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Complaint> complaints;
		complaints = ComplaintService.findAll();

		result = new ModelAndView("complaint/list");
		result.addObject("complaints", complaints);
		result.addObject("requestURI", "complaint/handyworker/list.do");
		return result;
	}
}
