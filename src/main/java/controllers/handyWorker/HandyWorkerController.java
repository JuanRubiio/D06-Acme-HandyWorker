package controllers.HandyWorker;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.HandyWorkerService;

import controllers.AbstractController;
import domain.HandyWorker;

@Controller
@RequestMapping("/actor/handyWorker")
public class HandyWorkerController extends AbstractController{

	@Autowired
	private HandyWorkerService handyWorkerService;
	
	
	@RequestMapping(value="/edit",method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam int handyWorkerId){
		ModelAndView res;
		
		HandyWorker handyWorkers;
		
		handyWorkers = this.handyWorkerService.findOne(handyWorkerId);
		Assert.notNull(handyWorkers);
		res = createEditModelAndView(handyWorkers);
		return res;
	}
	
	protected ModelAndView createEditModelAndView(HandyWorker handyWorker){
		ModelAndView res;
		
		res = createEditModelAndView(handyWorker,null);
		
		return res;
	}
	
	protected ModelAndView createEditModelAndView(HandyWorker handyWorker, String messageCode){
		ModelAndView res;
		
		res = new ModelAndView("handyWorker/edit");
		res.addObject("handyWorker",handyWorker);
		res.addObject("message",messageCode);		
		
		return res;
	}
	
}
