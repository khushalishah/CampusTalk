package vo;

import java.io.Serializable;

public class ComplainVo implements Serializable {

	private static final long serialVersionUID = 1L;
	private int complain_id;
	private String complain_department;
	private long complain_enrollment;
	private String complain_date;
	private String complain_title;
	private String complain_description;
	private String complain_name;
	private int complain_semester;

	

	public ComplainVo() {
	}

	public ComplainVo(String complain_department, long complain_enrollment, String complain_date, String complain_title,
			String complain_description, int complain_semester, String complain_name) {
		super();
		this.complain_department = complain_department;
		this.complain_enrollment = complain_enrollment;
		this.complain_date = complain_date;
		this.complain_title = complain_title;
		this.complain_description = complain_description;
		this.complain_semester = complain_semester;
		this.complain_name = complain_name;
	}

	public ComplainVo(int complain_id, String complain_department, long complain_enrollment, String complain_date, String complain_title,
			String complain_description, String complain_name, int complain_semester) {
		super();
		this.complain_id = complain_id;
		this.complain_department = complain_department;
		this.complain_enrollment = complain_enrollment;
		this.complain_date = complain_date;
		this.complain_title = complain_title;
		this.complain_description = complain_description;
		this.complain_name = complain_name;
		this.complain_semester = complain_semester;
	}

	public int getComplain_id() {
		return complain_id;
	}

	public void setComplain_id(int complain_id) {
		this.complain_id = complain_id;
	}

	public String getComplain_department() {
		return complain_department;
	}

	public void setComplain_department(String complain_department) {
		this.complain_department = complain_department;
	}

	public long getComplain_enrollment() {
		return complain_enrollment;
	}

	public void setComplain_enrollment(long complain_enrollment) {
		this.complain_enrollment = complain_enrollment;
	}

	public String getComplain_title() {
		return complain_title;
	}

	public void setComplain_title(String complain_title) {
		this.complain_title = complain_title;
	}

	public String getComplain_description() {
		return complain_description;
	}

	public void setComplain_description(String complain_description) {
		this.complain_description = complain_description;
	}

	public String getComplain_name() {
		return complain_name;
	}

	public void setComplain_name(String complain_name) {
		this.complain_name = complain_name;
	}

	public int getComplain_semester() {
		return complain_semester;
	}

	public void setComplain_semester(int complain_semester) {
		this.complain_semester = complain_semester;
	}
	
	public String getComplain_date() {
		return complain_date;
	}

	public void setComplain_date(String complain_date) {
		this.complain_date = complain_date;
	}

	public ComplainVo getInstance(int id) {
		this.complain_id = id;
		return this;
	}

}
