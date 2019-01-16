package controllers.sponsor;

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

import services.ActorService;
import services.SponsorshipService;

import controllers.AbstractController;
import domain.Actor;
import domain.Sponsor;
import domain.Sponsorship;
import domain.Tutorial;

@Controller
@RequestMapping("/sponsorship/sponsor")
public class SponsorshipSponsorController extends AbstractController{

	@Autowired
	private SponsorshipService SponsorshipService;
	@Autowired
	private ActorService actorService;
	
	
	@RequestMapping(value="/list",method = RequestMethod.GET)
	public ModelAndView list(){
		
		ModelAndView res;
		Collection<Sponsorship> sponsorships;
		
		Actor logueado = this.actorService.getPrincipal();
		sponsorships = SponsorshipService.findBySponsorId(logueado.getId());
		
		res = new ModelAndView("sponsorship/list");
		res.addObject("sponsorships",sponsorships);
		res.addObject("requestURI","sponsorship/sponsor/list.do");
		
		return res;
	}
	
	@RequestMapping(value="/create",method = RequestMethod.GET)
	public ModelAndView create(@RequestParam Tutorial tutorial){
		ModelAndView res;
		Sponsorship sponsorship;
		
		Actor logueado = this.actorService.getPrincipal();
		//Assert.isTrue(logueado instanceof HandyWorker);
		Sponsor s = (Sponsor) logueado;
		
		sponsorship = this.SponsorshipService.create(tutorial);
		sponsorship.setSponsor(s);
		res = this.createEditModelAndView(sponsorship);
		
		return res;
	}

	@RequestMapping(value="/edit",method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam int sponsorshipId){
		ModelAndView res;
		Sponsorship Sponsorship;
		
		Sponsorship = this.SponsorshipService.findOne(sponsorshipId);
		Assert.notNull(Sponsorship);
		res = createEditModelAndView(Sponsorship);
		
		return res;
	}

	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public ModelAndView show(@RequestParam final int sponsorshipId) {
			ModelAndView result;
			Sponsorship sp;
			sp = this.SponsorshipService.findOne(sponsorshipId);
			result = new ModelAndView("sponsorship/show");
			result.addObject("sponsorship", sp);

			return result;
		}
	
	@RequestMapping(value="/delete",method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam final int sponsorshipId){
		
		ModelAndView res;
		Sponsorship sp;
		sp = this.SponsorshipService.findOne(sponsorshipId);
		Assert.notNull(sp);
		SponsorshipService.delete(sp);
		res = new ModelAndView("redirect:list.do");
		return res;
	}
	
	@RequestMapping(value="/save",method = RequestMethod.POST, params="save")
	public ModelAndView save(@Valid Sponsorship Sponsorship, BindingResult binding){
		ModelAndView res;
		
		if(binding.hasErrors()){
			System.out.println(binding.getAllErrors());
			res = createEditModelAndView(Sponsorship);
		}else{
			try{
				SponsorshipService.save(Sponsorship);
				res = new ModelAndView("redirect:list.do");
			}catch(Throwable oops){
				res = createEditModelAndView(Sponsorship, "Sponsorship.commit.error");
								  }
		     }
		
		return res;
	}
	
	
	protected ModelAndView createEditModelAndView(Sponsorship Sponsorship){
		ModelAndView res;
		
		res = createEditModelAndView(Sponsorship,null);
		
		return res;
	}
	
	protected ModelAndView createEditModelAndView(Sponsorship Sponsorship, String messageCode){
		ModelAndView res;

		
		res = new ModelAndView("sponsorship/edit");
		res.addObject("sponsorship",Sponsorship);
		res.addObject("message",messageCode);		
		
		return res;
	}
	
}