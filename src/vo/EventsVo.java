package vo;

import java.io.Serializable;

public class EventsVo implements Serializable {

	private int event_id; 
	private long event_enrollment;
	private String event_time;
	private String event_document;
	private String event_startDate;
	private String event_endDate;
	private String event_description;
	private String event_title;
	public EventsVo()
	{}
		
	public EventsVo(long event_enrollment,String event_title ,  String event_startDate,
			String event_endDate,String event_time, String event_document, String event_description) {
		super();
		this.event_enrollment=event_enrollment;
		this.event_title = event_title;
		this.event_startDate = event_startDate;
		this.event_endDate = event_endDate;
		this.event_time = event_time;
		this.event_document = event_document;
		this.event_description = event_description;
		
	}

	public EventsVo(int event_id,long event_enrollment,String event_title ,String event_startDate, String event_endDate,String event_time,
String event_document, String event_description) {
		super();
		this.event_id = event_id;
		this.event_enrollment=event_enrollment;
		this.event_title = event_title;
		this.event_startDate = event_startDate;
		this.event_endDate = event_endDate;
		this.event_time = event_time;
		this.event_description = event_description;
		this.event_document = event_document;
	}

	public long getEvent_enrollment() {
		return event_enrollment;
	}

	public void setEvent_enrollment(long event_enrollment) {
		this.event_enrollment = event_enrollment;
	}

	public int getEvent_id() {
		return event_id;
	}

	public void setEvent_id(int event_id) {
		this.event_id = event_id;
	}

	public String getEvent_time() {
		return event_time;
	}

	public void setEvent_time(String event_time) {
		this.event_time = event_time;
	}

	public String getEvent_document() {
		return event_document;
	}

	public void setEvent_document(String event_document) {
		this.event_document = event_document;
	}

	public String getEvent_startDate() {
		return event_startDate;
	}

	public void setEvent_startDate(String event_startDate) {
		this.event_startDate = event_startDate;
	}

	public String getEvent_endDate() {
		return event_endDate;
	}

	public void setEvent_endDate(String event_endDate) {
		this.event_endDate = event_endDate;
	}

	public String getEvent_description() {
		return event_description;
	}

	public void setEvent_description(String event_description) {
		this.event_description = event_description;
	}

	public String getEvent_title() {
		return event_title;
	}

	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
}
