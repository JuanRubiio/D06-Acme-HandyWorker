package controllers.HandyWorker;

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

import services.ApplicationService;
import services.FixUpTaskService;
import services.PhaseService;

import controllers.AbstractController;
import domain.Application;
import domain.FixUpTask;
import domain.Phase;

@Controller
@RequestMapping("/phase/handyWorker")
public class PhaseController extends AbstractController{

	@Autowired
	private PhaseService phaseService;
	
	@Autowired
	private ApplicationService applicationService;
	
	@Autowired
	private FixUpTaskService fixUpTaskService;
	
	@RequestMapping(value="/list",method = RequestMethod.GET)
	public ModelAndView list(){
		ModelAndView res;
		Collection<Phase> phases;
		
		phases = phaseService.findAll();
		
		res = new ModelAndView("phase/list");
		res.addObject("phases",phases);
		res.addObject("requestURI", "phase/handyWorker/list.do");
		
		return res;
	} 
	
	@RequestMapping(value="/create",method = RequestMethod.GET)
	public ModelAndView create(){
		ModelAndView res;
		Phase phases;
		Application application;
		FixUpTask fixUpTask;
		
		fixUpTask = this.fixUpTaskService.create();
		application = this.applicationService.create(fixUpTask);
		phases = this.phaseService.create(application);
		
		res = this.createEditModelAndView(phases);
		
		return res;
	}
	
	@RequestMapping(value="/edit",method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam int phaseId){
		ModelAndView res;
		Phase phases;
		
		phases = this.phaseService.findOne(phaseId);
		Assert.notNull(phases);
		res = createEditModelAndView(phases);
		
		return res;
	}
	
	@RequestMapping(value="/edit",method = RequestMethod.POST, params="save")
	public ModelAndView save(@Valid Phase phase, BindingResult binding){
		ModelAndView res;
		
		if(binding.hasErrors()){
			res = createEditModelAndView(phase);
		}else{
			try{
				phaseService.save(phase);
				res = new ModelAndView("redict:list.do");
			}catch(Throwable oops){
				res = createEditModelAndView(phase, "phase.commit.error");
			}
		}
		
		return res;
	}

	@RequestMapping(value="/edit",method = RequestMethod.POST, params="delete")
	public ModelAndView delete(Phase phase, BindingResult binding){
		ModelAndView res;
		
		try{
			phaseService.delete(phase);
			res = new ModelAndView("redict:list.do");
		} catch(Throwable oops){
			res = createEditModelAndView(phase, "phase.commit.error");
		}
		
		return res;
	}
	
	protected ModelAndView createEditModelAndView(Phase phase){
		ModelAndView res;
		
		res = createEditModelAndView(phase,null);
		
		return res;
	}
	
	protected ModelAndView createEditModelAndView(Phase phase, String messageCode){
		ModelAndView res;
		
		res = new ModelAndView("phase/edit");
		res.addObject("phase",phase);
		res.addObject("message",messageCode);		
		
		return res;
	}
	
}
