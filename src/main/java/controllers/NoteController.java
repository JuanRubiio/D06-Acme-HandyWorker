
package controllers;

import java.util.Collection;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import services.NoteService;
import domain.Note;

@Controller
@RequestMapping("/note")
public class NoteController extends AbstractController {

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Note> notes;
		notes = NoteService.findAll();

		result = new ModelAndView("note/list");
		result.addObject("notes", notes);
		result.addObject("requestURI", "note/list.do");
		return result;
	}

	public ModelAndView create() {
		final ModelAndView result;
		Note note;
		final Integer report = 0; //Hay que obtener el report para el que se crea la nota
		note = NoteService.create(report);
		//result = this.createEditModelAndView(note);
		//return result;
		return null;
	}
}
