
package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.NoteRepository;
import security.Authority;
import domain.Actor;
import domain.Note;

@Service
@Transactional
public class NoteService {

	@Autowired
	private static NoteRepository	noteRepository;

	@Autowired
	private static ReportService	reportService;

	@Autowired
	private static ActorService		actorService;


	public static Note create(final Integer reportId) {
		Note res;
		res = new Note();
		res.setMoment(new Date());
		res.setReport(NoteService.reportService.findOne(reportId));
		final Actor actor = NoteService.actorService.getPrincipal();
		final Collection<Authority> authorities = actor.getUserAccount().getAuthorities();
		final ArrayList<String> listAuth = new ArrayList<String>();
		if (!authorities.isEmpty())
			for (final Authority au : authorities)
				listAuth.add(au.getAuthority());
		Assert.isTrue(listAuth.contains("REFEREE") || listAuth.contains("CUSTOMER") || listAuth.contains("HANDYWORKER"));
		return res;
	}
	public Note save(final Note note) {
		Note res;
		Assert.notNull(note);
		res = NoteService.noteRepository.save(note);
		return res;
	}

	public static Collection<Note> findAll() {
		Collection<Note> res;

		res = NoteService.noteRepository.findAll();

		Assert.notNull(res);

		return res;
	}

	public Note findOne(final Integer noteId) {
		Note res;

		Assert.notNull(noteId);

		res = NoteService.noteRepository.findOne(noteId);

		Assert.notNull(res);
		return res;
	}

}
