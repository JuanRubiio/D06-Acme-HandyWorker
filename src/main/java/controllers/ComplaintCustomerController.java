
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
public class ComplaintCustomerController extends AbstractController {

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Complaint> complaints;
		complaints = ComplaintService.findAll();

		result = new ModelAndView("complaint/list");
		result.addObject("complaints", complaints);
		result.addObject("requestURI", "complaint/customer/list.do");
		return result;
	}

	public ModelAndView create() {
		final ModelAndView result;
		Complaint complaint;

		complaint = ComplaintService.create();
		//result = this.createModelAndView(complaint);
		//return result;
		return null;
	}

	/*
	 * @RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	 * public ModelAndView save(@Valid final Complaint complaint, final BindingResult binding) {
	 * ModelAndView result;
	 * 
	 * if (binding.hasErrors())
	 * result = this.createModelAndView(complaint);
	 * else
	 * try {
	 * ComplaintService.save(complaint);
	 * result = new ModelAndView("redirect:list.do");
	 * } catch (final Throwable oops) {
	 * result = createModelAndView(complaint, "complaint.commit.error");
	 * 
	 * }
	 * return result;
	 * 
	 * }
	 */
}
