
package controllers;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.FixUpTaskService;
import services.WarrantyService;
import domain.FixUpTask;
import domain.Warranty;

@Controller
@RequestMapping("/warranty")
public class WarrantyController extends AbstractController {

	@Autowired
	private WarrantyService		warrantyService;

	@Autowired
	private FixUpTaskService	fixUpTaskService;


	@RequestMapping(value = "/administrator/list", method = RequestMethod.GET)
	public ModelAndView listAdmin() {
		ModelAndView result;

		final Collection<Warranty> warranties = this.warrantyService.findAll();

		result = new ModelAndView("warranty/list");
		result.addObject("requestURI", "warranty/administrator/list.do");
		result.addObject("warranty", warranties);

		return result;
	}

	@RequestMapping(value = "/administrator/show", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int warrantyId) {
		ModelAndView result;

		final Warranty t = this.warrantyService.findOne(warrantyId);

		result = new ModelAndView("warranty/show");

		result.addObject("warranty", t);

		return result;
	}

	@RequestMapping(value = "/customer/show", method = RequestMethod.GET)
	public ModelAndView listCustomer(@RequestParam final int fixUpTaskId) {
		ModelAndView result;
		Warranty warranty;
		FixUpTask fixUpTask;

		fixUpTask = this.fixUpTaskService.findOne(fixUpTaskId);
		warranty = fixUpTask.getWarranty();

		result = new ModelAndView("warranty/show");

		result.addObject("warranty", warranty);

		return result;
	}

	@RequestMapping(value = "/handyworker/show", method = RequestMethod.GET)
	public ModelAndView listHandyWorker(@RequestParam final int fixUpTaskId) {
		ModelAndView result;
		Warranty warranty;
		FixUpTask fixUpTask;

		fixUpTask = this.fixUpTaskService.findOne(fixUpTaskId);
		warranty = fixUpTask.getWarranty();

		result = new ModelAndView("warranty/show");

		result.addObject("warranty", warranty);

		return result;
	}

	@RequestMapping(value = "/administrator/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;

		final Warranty t = this.warrantyService.create();
		result = this.createEditModelAndView(t);

		return result;
	}

	@RequestMapping(value = "/administrator/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int warrantyId) {
		ModelAndView result;

		final Warranty t = this.warrantyService.findOne(warrantyId);

		result = this.createEditModelAndView(t);

		return result;
	}

	@RequestMapping(value = "/administrator/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Warranty t, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			System.out.println(binding.getAllErrors());
			result = this.createEditModelAndView(t);
		} else
			try {
				this.warrantyService.save(t);
				result = new ModelAndView("redirect:list.do");
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(t, "warranty.commit.error");
			}

		return result;
	}

	@RequestMapping(value = "/administrator/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(final Warranty t, final BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			System.out.println(binding.getAllErrors());
			result = this.createEditModelAndView(t);
		} else
			try {
				this.warrantyService.delete(t);
				result = new ModelAndView("redirect:list.do");
			} catch (final Throwable oops) {
				result = this.createEditModelAndView(t, "warranty.commit.error");
			}

		return result;
	}

	@RequestMapping(value = "/change", method = RequestMethod.GET)
	public ModelAndView change(@RequestParam final int warrantyId) {
		ModelAndView result;

		final Warranty t = this.warrantyService.findOne(warrantyId);

		if (t.getDraft().equals(false)) {
			t.setDraft(true);
			this.warrantyService.save(t);
		}

		final Collection<Warranty> warranties = this.warrantyService.findAll();

		result = new ModelAndView("warranty/admin/list");
		result.addObject("requestURI", "warranty/admin/list.do");
		result.addObject("warranties", warranties);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Warranty t) {
		final ModelAndView result = this.createEditModelAndView(t, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Warranty warranty, final String message) {
		ModelAndView result;

		result = new ModelAndView("warranty/edit");

		result.addObject("warranty", warranty);
		result.addObject("message", message);
		return result;
	}
}
