
package controllers.administrator;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import controllers.AbstractController;

import services.WarrantyService;
import domain.Warranty;

@Controller
@RequestMapping("/warranty/administrator")
public class WarrantyAdministratorController extends AbstractController {

	@Autowired
	private WarrantyService	warrantyService;


	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView res;
		Warranty warranty;

		warranty = this.warrantyService.create();

		res = this.createEditModelAndView(warranty);

		return res;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Warranty> warranties;

		warranties = this.warrantyService.findAll();

		result = new ModelAndView("warranty/list");
		result.addObject("warranties", warranties);
		result.addObject("requestURI", "warranty/administrator/list.do");
		return result;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int warrantyId) {
		ModelAndView result;
		Warranty warranty;
		warranty = this.warrantyService.findOne(warrantyId);
		Assert.notNull(warranty);
		result = this.createEditModelAndView(warranty);
		return result;
	}

	//save
	//borrar

	protected ModelAndView createEditModelAndView(final Warranty warranty, final String messageCode) {
		ModelAndView result;
		result = new ModelAndView("warranty/edit");
		result.addObject("warranty", warranty);

		result.addObject("message", messageCode);
		return result;
	}

	protected ModelAndView createEditModelAndView(final Warranty warranty) {
		ModelAndView result;
		result = this.createEditModelAndView(warranty, null);
		return result;
	}
	
	@RequestMapping(value="/edit",method = RequestMethod.POST, params="delete")
	public ModelAndView delete(Warranty warranty, BindingResult binding){
		ModelAndView res;
		
		try{
			warrantyService.delete(warranty);
			res = new ModelAndView("redict:list.do");
		} catch(Throwable oops){
			res = createEditModelAndView(warranty, "warranty.commit.error");
		}
		
		return res;
	}
	
	@RequestMapping(value="/edit",method = RequestMethod.POST, params="save")
	public ModelAndView save(@Valid Warranty warranty, BindingResult binding){
		ModelAndView res;
		
		if(binding.hasErrors()){
			res = createEditModelAndView(warranty);
		}else{
			try{
				warrantyService.save(warranty);
				res = new ModelAndView("redict:list.do");
			}catch(Throwable oops){
				res = createEditModelAndView(warranty, "warranty.commit.error");
			}
		}
		
		return res;
	}
}
