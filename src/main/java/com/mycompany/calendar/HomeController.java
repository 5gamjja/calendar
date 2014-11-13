package com.mycompany.calendar;

import java.text.DateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.calendar.dao.CalendarUserDao;
import com.mycompany.calendar.dao.EventAttendeeDao;
import com.mycompany.calendar.dao.EventDao;
import com.mycompany.calendar.domain.CalendarUser;
import com.mycompany.calendar.domain.Event;
import com.mycompany.calendar.domain.EventAttendee;
import com.mycompany.calendar.service.CalendarService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Autowired
	private CalendarService calendarService;
	
	private static final int numInitialNumUsers = 12;
	private static final int numInitialNumEvents = 4;
	private Random random = new Random(System.currentTimeMillis());

	
	private CalendarUser[] calendarUsers = null;
	private Event[] events = null;
	private EventAttendee[] eventAttentees = null;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		this.add();
		///////////////////////////////
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		////////////////////////////
		
		List<CalendarUser> users = calendarService.getAllUsers();
		List<Event> events = calendarService.getAllEvents();
		List<EventAttendee> attendees = calendarService.getAllAttendee();
		
		model.addAttribute("users", users);
		model.addAttribute("events", events);
		model.addAttribute("attendees", attendees);
		
		//TODO model에 calendarUsers, events, eventAttentees 배열 객체 추가 
		
		
		return "home";
	}
	
	public void add() {
		this.calendarService.deleteAllEventAttendees();
		this.calendarService.deleteAllEvents();
		this.calendarService.deleteAllUsers();
		
		calendarUsers = new CalendarUser[numInitialNumUsers];
		events = new Event[numInitialNumEvents];
		eventAttentees = new EventAttendee[numInitialNumEvents];
		
		this.calendarService.deleteAllUsers();
		this.calendarService.deleteAllEvents();
		this.calendarService.deleteAllEventAttendees();
		
		for (int i = 0; i < numInitialNumUsers; i++) {
			calendarUsers[i] = new CalendarUser();
			calendarUsers[i].setEmail("user" + i + "@example.com");
			calendarUsers[i].setPassword("user" + i);
			calendarUsers[i].setName("User" + i);
			calendarUsers[i].setId(calendarService.createUser(calendarUsers[i]));
		}
		
		for (int i = 0; i < numInitialNumEvents; i++) {
			events[i] = new Event();
			events[i].setSummary("Event Summary - " + i);
			events[i].setDescription("Event Description - " + i);
			events[i].setOwner(calendarUsers[random.nextInt(numInitialNumUsers)]);
			switch (i) {				          /* Updated by Assignment 3 */
				case 0:
					events[i].setNumLikes(0);  							
					break;
				case 1:
					events[i].setNumLikes(9);
					break;
				case 2:
					events[i].setNumLikes(10);
					break;
				case 3:
					events[i].setNumLikes(10);
					break;
			}
			events[i].setId(calendarService.createEvent(events[i]));
		}
		
		for (int i = 0; i < numInitialNumEvents; i++) {
			eventAttentees[i] = new EventAttendee();
			eventAttentees[i].setEvent(events[i]);
			eventAttentees[i].setAttendee(calendarUsers[3 * i ]);
			eventAttentees[i].setAttendee(calendarUsers[3 * i + 1]);
			eventAttentees[i].setAttendee(calendarUsers[3 * i + 2]);
			eventAttentees[i].setId(calendarService.createEventAttendee(eventAttentees[i]));
		}
	}
	
}
