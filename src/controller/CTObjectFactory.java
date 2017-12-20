package controller;

import implementation.Answer;
import implementation.Blog;
import implementation.Complain;
import implementation.Documents;
import implementation.Event;
import implementation.Feedback;
import implementation.Notice;
import implementation.Question;
import implementation.Registration;

public class CTObjectFactory {
	public static CTInterface getInstance(String type)
	{
		switch(type)
		{
		case "notice" :return new Notice();
		case "registration" :return new Registration();
		case "question" :return new Question();
		case "complain" : return new Complain();
		case "blog": return new Blog();
		case "event": return new Event();
		case "feedback" : return new Feedback();
		case "documents": return new Documents();
		case "answer" : return new Answer();
		}
		return null;
	}
}
