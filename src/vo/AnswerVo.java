package vo;

import java.io.Serializable;

public class AnswerVo implements Serializable{

	private static final long serialVersionUID = 1L;
	private int ansID;
	private int queID;
	private String answer;
	private int semester;
	private String department;
	private String name;
	private String date;
	
	public AnswerVo(){}
	
	public AnswerVo(int queID, String answer, int semester, String department, String name, String date) {
		super();
		this.queID = queID;
		this.answer = answer;
		this.semester = semester;
		this.department = department;
		this.name = name;
		this.date = date;
	}



	public int getAnsID() {
		return ansID;
	}
	public void setAnsID(int ansID) {
		this.ansID = ansID;
	}
	public int getQueID() {
		return queID;
	}
	public void setQueID(int queID) {
		this.queID = queID;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	
}
