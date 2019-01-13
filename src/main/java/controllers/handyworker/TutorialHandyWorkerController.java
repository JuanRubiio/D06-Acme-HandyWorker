package controllers.handyworker;

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

import security.UserAccount;
import services.ActorService;
import services.SectionService;
import services.TutorialService;

import controllers.AbstractController;
import domain.Actor;
import domain.HandyWorker;
import domain.Section;
import domain.Tutorial;

@Controller
@RequestMapping("/tutorial/handyworker")
public class TutorialHandyWorkerController extends AbstractController{

	@Autowired
	private TutorialService TutorialService;
	@Autowired
	private SectionService sectionService;
	@Autowired
	private ActorService actorService;
	
	//1 METODO POR CADA ENLACE O BOTON DE LA ENTIDAD EN LA APLICACION
	
	//VISTAS DIRECCIONABLES (SOLO LAS RENDERIZA)
	
	//LIST
	@RequestMapping(value="/list",method = RequestMethod.GET)
	public ModelAndView list(){
		
		ModelAndView res;
		Collection<Tutorial> tutoriales;
		
		tutoriales = TutorialService.findAll();
		
		res = new ModelAndView("tutorial/list");
		res.addObject("tutorials",tutoriales);
		res.addObject("requestURI","tutorial/handyworker/list.do");
		
		return res;
	}
	
	
	//CREATE
	@RequestMapping(value="/create",method = RequestMethod.GET)
	public ModelAndView create(){
		
		ModelAndView res;
		Tutorial tutorial;
		//Actor logueado = this.actorService.getPrincipal();
		//Assert.isTrue(logueado instanceof HandyWorker);
		//HandyWorker hw = (HandyWorker) logueado;
		tutorial = this.TutorialService.create();
		//tutorial.setHandyWorker(hw);
		res = this.createEditModelAndView(tutorial);
		
		return res;
	}

	//EDIT
	@RequestMapping(value="/edit",method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam int TutorialId){
		ModelAndView res;
		Tutorial Tutorial;
		
		Tutorial = this.TutorialService.findOne(TutorialId);
		Assert.notNull(Tutorial);
		res = createEditModelAndView(Tutorial);
		
		return res;
	}

	//SHOW
	
	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public ModelAndView show(@RequestParam final int tutorialId) {
			ModelAndView result;
			Tutorial t;
			t = this.TutorialService.findOne(tutorialId);
			result = new ModelAndView("tutorial/show");
			result.addObject("tutorial", t);

			return result;
		}
	
	//BOTONES POST EN VARIAS VISTAS
	
	
	//SAVE (CREAR O EDITAR)
	
	@RequestMapping(value="/edit",method = RequestMethod.POST, params="save")
	public ModelAndView save(@Valid Tutorial tutorial, BindingResult binding){
		ModelAndView res;
		
		if(binding.hasErrors()){
			res = createEditModelAndView(tutorial);
		}else{
			try{
				TutorialService.save(tutorial);
				res = new ModelAndView("redict:list.do");
			}catch(Throwable oops){
				res = createEditModelAndView(tutorial, "tutorial.commit.error");
								  }
		     }
		
		return res;
	}
	
	//DELETE
	
	@RequestMapping(value="/list",method = RequestMethod.POST, params="delete")
	public ModelAndView delete(Tutorial Tutorial, BindingResult binding){
		ModelAndView res;
		
		try{
			TutorialService.delete(Tutorial);
			res = new ModelAndView("redict:list.do");
		} catch(Throwable oops){
			res = createEditModelAndView(Tutorial, "Tutorial.commit.error");
		}
		
		return res;
	}
	
	
	
	
	//METODOS AUXILIARES
	
	protected ModelAndView createEditModelAndView(Tutorial Tutorial){
		ModelAndView res;
		
		res = createEditModelAndView(Tutorial,null);
		
		return res;
	}
	
	protected ModelAndView createEditModelAndView(Tutorial tutorial, String messageCode){
		ModelAndView res;
		Collection<Section> sections;
		
		sections = sectionService.findAll();
		
		//CREA UNA VISTA RENDERIZADA USANDO EDIT.JSP COMO BASE
		res = new ModelAndView("tutorial/edit");
		res.addObject("tutorial",tutorial);
		res.addObject("section", sections);
		res.addObject("message",messageCode);		
		
		return res;
	}
	
}