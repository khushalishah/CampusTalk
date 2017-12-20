package vo;

import java.io.Serializable;

public class NoticeVo implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int notice_id; 
	private String notice_semester;
	private long notice_fEnrollment;
	private String notice_document;
	private String notice_startDate;
	private String notice_endDate;
	private String notice_description;
	private String notice_title;
	public NoticeVo()
	{}
	
	
	
	public NoticeVo(int notice_id,String notice_semester,long notice_fEnrollment,String notice_title,
			String notice_startDate, String notice_endDate, String notice_document,String notice_description) {
		super();
		this.notice_id = notice_id;
		this.notice_semester=notice_semester;
		this.notice_fEnrollment = notice_fEnrollment;
		this.notice_document = notice_document;
		this.notice_startDate = notice_startDate;
		this.notice_endDate = notice_endDate;
		this.notice_description = notice_description;
		this.notice_title = notice_title;
	}



	public NoticeVo(String notice_semester,long notice_fEnrollment,String notice_title, 
			String notice_startDate, String notice_endDate,String notice_document,String notice_description) {
		super();
		this.notice_semester=notice_semester;;
		this.notice_fEnrollment = notice_fEnrollment;
		this.notice_title = notice_title;
		this.notice_startDate = notice_startDate;
		this.notice_endDate = notice_endDate;
		this.notice_description = notice_description;
		this.notice_document = notice_document;
	}
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public long getNotice_fEnrollment() {
		return notice_fEnrollment;
	}
	public void setNotice_fEnrollment(long notice_fEnrollment) {
		this.notice_fEnrollment = notice_fEnrollment;
	}
	public String getNotice_semester() {
		return notice_semester;
	}



	public void setNotice_semester(String notice_semester) {
		this.notice_semester = notice_semester;
	}



	public String getNotice_document() {
		return notice_document;
	}
	public void setNotice_document(String notice_document) {
		this.notice_document = notice_document;
	}
	public String getNotice_startDate() {
		return notice_startDate;
	}
	public void setNotice_startDate(String notice_startDate) {
		this.notice_startDate = notice_startDate;
	}
	public String getNotice_endDate() {
		return notice_endDate;
	}
	public void setNotice_endDate(String notice_endDate) {
		this.notice_endDate = notice_endDate;
	}
	public String getNotice_description() {
		return notice_description;
	}
	public void setNotice_description(String notice_description) {
		this.notice_description = notice_description;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	
	public NoticeVo getInstance(int id)
	{
		this.notice_id=id;
		return this;
	}
}
