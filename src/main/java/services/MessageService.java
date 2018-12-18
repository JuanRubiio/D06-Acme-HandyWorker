
package services;

import java.util.Collection;
import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.MessageRepository;
import domain.Actor;
import domain.Message;
import domain.MessageBox;

@Service
@Transactional
public class MessageService {

	@Autowired
	private MessageRepository	messageRepository;
	@Autowired
	private ActorService		actorService;
	@Autowired
	private MessageBoxService	messageBoxService;
	@Autowired
	private UtilitiesService	utilitiesService;


	public Message create() {
		Message result;
		Actor sender;

		sender = this.actorService.getPrincipal();

		result = new Message();
		result.setSender(sender);
		result.setDate(new Date(System.currentTimeMillis()));
		result.setSpam(false);

		return result;
	}

	public Collection<Message> findAll() {
		Collection<Message> result;

		result = this.messageRepository.findAll();

		Assert.notNull(result);

		return result;
	}

	public Message findOne(final Integer messageId) {
		Message result;

		Assert.notNull(messageId);

		result = this.messageRepository.findOne(messageId);

		Assert.notNull(result);
		return result;
	}

	public Message save(final Message message) {
		Message result;
		MessageBox messageBox;

		messageBox = this.messageBoxService.findSystemMessageBox("out box");

		Assert.notNull(message);
		Assert.notNull(message.getRecipient());
		if (this.utilitiesService.checkSpam(message.getBody()) || this.utilitiesService.checkSpam(message.getSubject()) || this.utilitiesService.checkSpam(message.getTags())) {
			message.setSpam(true);
			final Actor actor = this.actorService.getPrincipal();
			actor.setSuspicious(true);
			this.actorService.save(actor);
		}

		result = this.messageRepository.save(message);
		this.messageRepository.flush();
		this.messageBoxService.saveMessageInBox(result, messageBox);
		this.messageRepository.flush();

		return result;
	}

	public void delete(final Message message) {
		Assert.notNull(message);

		this.messageRepository.delete(message);
	}

	public void moveMessage(final Message message, final Integer messageBoxId) {
		final Actor actor = this.actorService.getPrincipal();
		final MessageBox messageBox = this.messageBoxService.findOne(messageBoxId);
		Assert.notNull(messageBox);
		Assert.isTrue(messageBox.getActor().getId() == actor.getId());
		final Collection<Message> mes = this.messageRepository.findMessagesByMessageBoxesId(messageBoxId);
		Assert.isTrue(!mes.contains(message));
		this.messageBoxService.saveMessageInBox(message, messageBox);
	}

	public void delete(final Integer messageId) {
		Assert.isTrue(messageId != 0 && messageId != null);
		Message message;
		message = this.messageRepository.findOne(messageId);
		Assert.isTrue(message != null);

		Assert.isTrue(this.checkPrincipalActor(message));
		final MessageBox mes = this.messageBoxService.findSystemMessageBox("trash box");
		Assert.notNull(mes);
		final Collection<MessageBox> boxes = this.messageBoxService.getMessageBoxesByMessageId(message.getId());

		if (!mes.getMessages().contains(message))
			this.messageBoxService.saveMessageInBox(message, mes);
		else if (boxes.isEmpty())
			this.delete(message);
		else
			for (final MessageBox b : boxes) {
				final Collection<Message> m = b.getMessages();
				m.remove(message);
				b.setMessages(m);
				this.messageBoxService.save(b);
			}

	}
	//	public void broadcast(final Message message) {
	//		Assert.notNull(message);
	//
	//		final Actor administrador = this.actorService.getPrincipal();
	//
	//		final Collection<Authority> autorities = administrador.getUserAccount().getAuthorities();
	//		final ArrayList<String> listAuth = new ArrayList<String>();
	//
	//		if (!autorities.isEmpty())
	//			for (final Authority au : autorities)
	//				listAuth.add(au.getAuthority());
	//
	//		Assert.isTrue(listAuth.contains("ADMIN"));
	//
	//		final String subject = message.getSubject();
	//		final String body = message.getBody();
	//		final String priority = message.getPriority();
	//		final Boolean spam = message.getSpam();
	//
	//		final Collection<Actor> actors = this.actorService.findAll();
	//		final Message m = this.create();
	//		MessageBox mesbox = new MessageBox();
	//		m.setSender(administrador);
	//		m.setSubject(subject);
	//		m.setBody(body);
	//		m.setPriority(priority);
	//		m.setSpam(spam);
	//		for (final Actor a : actors) {
	//
	//			final Collection<MessageBox> messageBoxes = this.messageBoxService.getMessageBoxsByActor(a.getId());
	//
	//			for (final MessageBox met : messageBoxes)
	//				if (met.getName().equals("in box"))
	//					mesbox = met;
	//
	//			m.setRecipient(a);
	//			this.save(m);
	//			this.messageRepository.flush();
	//			this.messageBoxService.saveMessageInBox(m, mesbox);
	//			this.messageRepository.flush();
	//
	//		}
	//	}

	public Message saveToSend(final Message message, final Boolean broadcast) {
		Assert.notNull(message);
		Message result;

		result = this.save(message);
		Message copy;
		Actor receiver;
		MessageBox messageBox;

		copy = message.clone();
		receiver = message.getRecipient();
		messageBox = this.messageBoxService.getMessageBoxAndCheckSpam(copy, receiver, broadcast);

		this.save(copy);

		return result;
	}

	public Boolean checkPrincipalActor(final Message message) {
		Boolean res = false;
		Assert.notNull(message);

		Actor actor;

		actor = this.actorService.getPrincipal();

		final Collection<MessageBox> messageboxes = this.messageBoxService.getMessageBoxsByActor(actor.getId());
		for (final MessageBox mes : messageboxes)
			if (mes.getMessages().contains(message))
				res = true;
		return res;
	}

	public Collection<Message> findMessagesByActorId(final int id) {
		return this.messageRepository.findMessagesByActorId(id);
	}

}

//package services;
//
//import java.util.Collection;
//import java.util.Date;
//
//import javax.transaction.Transactional;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.util.Assert;
//
//import repositories.MessageRepository;
//import domain.Actor;
//import domain.Administrator;
//import domain.Message;
//import domain.MessageBox;
//
//@Service
//@Transactional
//public class MessageService {
//
//	@Autowired
//	private MessageRepository	messageRepository;
//	@Autowired
//	private ActorService		actorService;
//	@Autowired
//	private MessageBoxService	messageboxService;
//	@Autowired
//	private SpamService			spamService;
//
//
//	public MessageService() {
//		super();
//	}
//
//	public Message create() {
//		Message result;
//		Actor sender;
//		MessageBox MessageBox;
//
//		sender = this.actorService.getPrincipal();
//		MessageBox = this.messageboxService.findSystemMessageBox("out box");
//
//		result = new Message();
//		result.setSender(sender);
//		result.setDate(new Date(System.currentTimeMillis()));
//
//		return result;
//	}
//
//	public Collection<Message> findAll() {
//		Collection<Message> result;
//
//		result = this.messageRepository.findAll();
//
//		Assert.notNull(result);
//
//		return result;
//	}
//
//	public Message findOne(final Integer messageId) {
//		Message result;
//
//		Assert.notNull(messageId);
//
//		result = this.messageRepository.findOne(messageId);
//
//		Assert.notNull(result);
//		return result;
//	}
//
//	public Message saveToSend(final Message message, final Boolean broadcast) {
//		Assert.notNull(message);
//		Message result;
//
//		result = this.save(message);
//		Message copy;
//		Actor receiver;
//		MessageBox MessageBox;
//
//		copy = message.clone();
//		receiver = message.getRecipient();
//		MessageBox = this.messageboxService.getMessageBoxAndCheckSpam(copy, receiver, broadcast);
//
//		this.save(copy);
//
//		return result;
//	}
//
//	public void moveMessage(final Message message, final Integer MessageBoxId) {
//		final Actor actor = this.actorService.getPrincipal();
//		final MessageBox MessageBox = this.messageboxService.findOne(MessageBoxId);
//		Assert.isTrue(MessageBox.getActor().getId() == actor.getId());
//
//	}
//
//	public void broadcast(final Message message) {
//		Assert.notNull(message);
//		final Administrator administrator = (Administrator) this.actorService.getPrincipal();
//		final String subject = message.getSubject();
//		final String body = message.getBody();
//		final String priority = message.getPriority();
//		final Collection<Actor> actors = this.actorService.findAll();
//		actors.remove(administrator);
//		for (final Actor a : actors) {
//			final Message m = this.create();
//			m.setSubject(subject);
//			m.setBody(body);
//			m.setPriority(priority);
//			m.setRecipient(a);
//			this.saveToSend(m, true);
//		}
//	}
//
//	public void delete(final Integer messageId) {
//		Assert.isTrue(messageId != 0 && messageId != null);
//		Message message;
//		message = this.messageRepository.findOne(messageId);
//		Assert.isTrue(message != null);
//
//		final MessageBox mes = this.messageboxService.findSystemMessageBox("trash box");
//		Assert.notNull(mes);
//		final Collection<MessageBox> boxes = this.messageboxService.getMessageBoxesByMessageId(message.getId());
//
//		if (!mes.getMessages().contains(message))
//			this.messageboxService.saveMessageInBox(message, mes);
//		else if (boxes.isEmpty())
//			this.delete(message);
//		else
//			for (final MessageBox b : boxes) {
//				final Collection<Message> m = b.getMessages();
//				m.remove(message);
//				b.setMessages(m);
//				this.messageboxService.save(b);
//			}
//
//	}
//
//	public void move(final Integer messageId, final Integer MessageBoxId) {
//		MessageBox MessageBox;
//		Message message;
//
//		MessageBox = this.messageboxService.findOne(MessageBoxId);
//		this.messageboxService.checkPrincipalActor(MessageBox);
//		message = this.findOne(messageId);
//
//		this.save(message);
//	}
//
//	public void spam(final Message message) {
//		final Actor a = this.actorService.getPrincipal();
//		final MessageBox f = this.messageboxService.getMessageBoxsByActor(a.getId()).get(3);
//
//		this.messageRepository.save(message);
//		f.getMessages().add(message);
//
//		this.messageboxService.save(f);
//
//	}
//
//	public Message save(final Message message) {
//		Message result;
//		Assert.notNull(message);
//
//		//CONCURRENCY CHECK
//		if (message.getId() != 0) {
//			final Message messageCheck = this.messageRepository.findOne(message.getId());
//			Assert.isTrue(message.getVersion() == messageCheck.getVersion());
//		}
//		result = this.messageRepository.save(message);
//
//		return result;
//	}
//
//	public void delete(final Message message) {
//		Assert.notNull(message);
//
//		this.messageRepository.delete(message);
//	}
//
//	//Other Business Methods -----------------------------------------------------------
//
//	private void checkPrincipalMessageBoxActor(final MessageBox MessageBox) {
//		Assert.notNull(MessageBox);
//
//		Actor actor;
//
//		actor = this.actorService.getPrincipal();
//
//		Assert.isTrue(actor.getId() == MessageBox.getActor().getId());
//
//	}
//
//	public Collection<Message> findMessagesByActorId(final int id) {
//		return this.messageRepository.findMessagesByActorId(id);
//	}
//
//}
