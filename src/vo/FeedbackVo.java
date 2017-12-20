package vo;

import java.io.Serializable;

public class FeedbackVo implements Serializable{
	private int fId;
	private String fDepartment;
	private String fDivision;
	private int fSemester;
	private String fNameOfTeacher;
	private String fCourseCode;
	private String fCourseTitle;
	private String fComment;
	private int que1,que2,que3,que4,que5,que6,que7,que8,que9,que10,que11,que12,que13;
	
	public FeedbackVo(){}
	
	public FeedbackVo(String fDepartment, String fDivision, int fSemester, String fNameOfTeacher,
			String fCouseCode, String fCourseTitle, String fComment, int que1, int que2, int que3, int que4, int que5,
			int que6, int que7, int que8, int que9, int que10, int que11, int que12, int que13) {
		
		this.fDepartment = fDepartment;
		this.fDivision = fDivision;
		this.fSemester = fSemester;
		this.fNameOfTeacher = fNameOfTeacher;
		this.fCourseCode = fCouseCode;
		this.fCourseTitle = fCourseTitle;
		this.fComment = fComment;
		this.que1 = que1;
		this.que2 = que2;
		this.que3 = que3;
		this.que4 = que4;
		this.que5 = que5;
		this.que6 = que6;
		this.que7 = que7;
		this.que8 = que8;
		this.que9 = que9;
		this.que10 = que10;
		this.que11 = que11;
		this.que12 = que12;
		this.que13 = que13;
	}
	public String getfCourseCode() {
		return fCourseCode;
	}
	public void setfCourseCode(String fCourseCode) {
		this.fCourseCode = fCourseCode;
	}
	public int getQue1() {
		return que1;
	}
	public int getQue2() {
		return que2;
	}
	public int getQue3() {
		return que3;
	}
	public int getQue4() {
		return que4;
	}
	public int getQue5() {
		return que5;
	}
	public int getQue6() {
		return que6;
	}
	public int getQue7() {
		return que7;
	}
	public int getQue8() {
		return que8;
	}
	public int getQue9() {
		return que9;
	}
	public int getQue10() {
		return que10;
	}
	public int getQue11() {
		return que11;
	}
	public int getQue12() {
		return que12;
	}
	public int getQue13() {
		return que13;
	}
	public int getfId() {
		return fId;
	}
	public void setfId(int fId) {
		this.fId = fId;
	}
	public String getfDepartment() {
		return fDepartment;
	}
	public void setfDepartment(String fDepartment) {
		this.fDepartment = fDepartment;
	}
	public String getfDivision() {
		return fDivision;
	}
	public void setfDivision(String fDivision) {
		this.fDivision = fDivision;
	}
	public int getfSemester() {
		return fSemester;
	}
	public void setfSemester(int fSemester) {
		this.fSemester = fSemester;
	}
	public String getfNameOfTeacher() {
		return fNameOfTeacher;
	}
	public void setfNameOfTeacher(String fNameOfTeacher) {
		this.fNameOfTeacher = fNameOfTeacher;
	}
	public String getfCouseCode() {
		return fCourseCode;
	}
	public void setfCouseCode(String fCourseCode) {
		this.fCourseCode = fCourseCode;
	}
	public String getfCourseTitle() {
		return fCourseTitle;
	}
	public void setfCourseTitle(String fCourseTitle) {
		this.fCourseTitle = fCourseTitle;
	}
	public String getfComment() {
		return fComment;
	}
	public void setfComment(String fComment) {
		this.fComment = fComment;
	}
	
	public void setQue1(int que1) {
		this.que1 = que1;
	}
	public void setQue2(int que2) {
		this.que2 = que2;
	}
	public void setQue3(int que3) {
		this.que3 = que3;
	}
	public void setQue4(int que4) {
		this.que4 = que4;
	}
	public void setQue5(int que5) {
		this.que5 = que5;
	}
	public void setQue6(int que6) {
		this.que6 = que6;
	}
	public void setQue7(int que7) {
		this.que7 = que7;
	}
	public void setQue8(int que8) {
		this.que8 = que8;
	}
	public void setQue9(int que9) {
		this.que9 = que9;
	}
	public void setQue10(int que10) {
		this.que10 = que10;
	}
	public void setQue11(int que11) {
		this.que11 = que11;
	}
	public void setQue12(int que12) {
		this.que12 = que12;
	}
	public void setQue13(int que13) {
		this.que13 = que13;
	}
	
	

}
