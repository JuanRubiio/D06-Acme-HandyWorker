package controllers.HandyWorker;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.ApplicationService;
import services.FixUpTaskService;

import controllers.AbstractController;
import domain.Application;
import domain.FixUpTask;

@Controller
@RequestMapping("/application/handyWorker")
public class ApplicationController extends AbstractController{

	@Autowired
	private ApplicationService applicationService;
	
	@Autowired
	private FixUpTaskService fixUpTaskService;
	
	
	@RequestMapping(value="/create",method=RequestMethod.GET)
	public ModelAndView create(){
		ModelAndView res;
		Application application;
		FixUpTask fixUpTask;
		
		fixUpTask = this.fixUpTaskService.create();
		application = this.applicationService.create(fixUpTask);
		
		res = this.createEditModelAndView(application);
		
		return res;
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST, params="save")
	public ModelAndView save(@Valid Application application,BindingResult binding){
		ModelAndView res;
		
		if(binding.hasErrors()){
			res=createEditModelAndView(application);
		}else{
			try{
				applicationService.save(application);
				res = new ModelAndView("redict:list.do");
			}catch(Throwable oops){
				res = createEditModelAndView(application,"application.commit.error");
			}
		}
		
		return res;
	}
	
	protected ModelAndView createEditModelAndView(Application application){
		ModelAndView res;
		
		res = createEditModelAndView(application,null);
		
		return res;
	}
	
	protected ModelAndView createEditModelAndView(Application application, String messageCode){
		ModelAndView res;
		
		res = new ModelAndView("application/edit");
		res.addObject("application",application);
		res.addObject("message",messageCode);		
		
		return res;
	}
		
}
