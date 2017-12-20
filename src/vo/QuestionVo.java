package vo;

import java.io.Serializable;
import java.util.Set;

public class QuestionVo implements Serializable {

	private static final long serialVersionUID = 1L;
	private String question_department;
	private int question_semester;
	private String question_name;
	private long question_enrollment;
	private String question_title;
	private String question_date;
	private int question_id;
	private Set children;
	
	public Set getChildren() {
		return children;
	}
	public void setChildren(Set children) {
		this.children = children;
	}
	public QuestionVo(){}
	public QuestionVo(String question_department, int question_semester,
			String question_name, long question_enrollment,
			String question_title, String question_description) {
		super();
		this.question_department = question_department;
		this.question_semester = question_semester;
		this.question_name = question_name;
		this.question_enrollment = question_enrollment;
		this.question_title = question_title;
		this.question_date = question_description;
	}
	public String getQuestion_department() {
		return question_department;
	}
	public void setQuestion_department(String question_department) {
		this.question_department = question_department;
	}
	public int getQuestion_semester() {
		return question_semester;
	}
	public void setQuestion_semester(int question_semester) {
		this.question_semester = question_semester;
	}
	public String getQuestion_name() {
		return question_name;
	}
	public void setQuestion_name(String question_name) {
		this.question_name = question_name;
	}
	public long getQuestion_enrollment() {
		return question_enrollment;
	}
	public void setQuestion_enrollment(long question_enrollment) {
		this.question_enrollment = question_enrollment;
	}
	public String getQuestion_title() {
		return question_title;
	}
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
	public String getQuestion_date() {
		return question_date;
	}
	public void setQuestion_date(String question_date) {
		this.question_date = question_date;
	}
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	
	public QuestionVo getInstance(int id)
	{
		this.question_id=id;
		return this;
	}

	
}
