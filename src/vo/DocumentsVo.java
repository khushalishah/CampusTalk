package vo;

import java.io.Serializable;

public class DocumentsVo implements Serializable {
	
	
	private long document_enrollment;
	private String document_photo;
	private String document_sign;
	private String document_10th;
	private String document_12th;
	private String document_sem1;
	private String document_sem2;
	private String document_sem3;
	private String document_sem4;
	private String document_sem5;
	private String document_sem6;
	private String document_sem7;
	private String document_sem8;
	private String document_clgId;
	private String document_uniqueId;
	private String document_drivingL;
	private String document_birthC;
	private String document_other;
	
	public DocumentsVo(){}
	
	public DocumentsVo(long document_enrollment,String document_photo, String document_sign, String document_10th, String document_12th,
			String document_sem1, String document_sem2, String document_sem3, String document_sem4,
			String document_sem5, String document_sem6, String document_sem7, String document_sem8,
			String document_clgId, String document_uniqueId, String document_drivingL, String document_birthC,
			String document_other) {
		super();
		this.document_enrollment = document_enrollment;
		this.document_photo = document_photo;
		this.document_sign = document_sign;
		this.document_10th = document_10th;
		this.document_12th = document_12th;
		this.document_sem1 = document_sem1;
		this.document_sem2 = document_sem2;
		this.document_sem3 = document_sem3;
		this.document_sem4 = document_sem4;
		this.document_sem5 = document_sem5;
		this.document_sem6 = document_sem6;
		this.document_sem7 = document_sem7;
		this.document_sem8 = document_sem8;
		this.document_clgId = document_clgId;
		this.document_uniqueId = document_uniqueId;
		this.document_drivingL = document_drivingL;
		this.document_birthC = document_birthC;
		this.document_other = document_other;
	}
	
	public long getDocument_enrollment() {
		return document_enrollment;
	}


	public void setDocument_enrollment(long document_enrollment) {
		this.document_enrollment = document_enrollment;
	}


	public String getDocument_photo() {
		return document_photo;
	}
	public void setDocument_photo(String document_photo) {
		this.document_photo = document_photo;
	}
	public String getDocument_sign() {
		return document_sign;
	}
	public void setDocument_sign(String document_sign) {
		this.document_sign = document_sign;
	}
	public String getDocument_10th() {
		return document_10th;
	}
	public void setDocument_10th(String document_10th) {
		this.document_10th = document_10th;
	}
	public String getDocument_12th() {
		return document_12th;
	}
	public void setDocument_12th(String document_12th) {
		this.document_12th = document_12th;
	}
	public String getDocument_sem1() {
		return document_sem1;
	}
	public void setDocument_sem1(String document_sem1) {
		this.document_sem1 = document_sem1;
	}
	public String getDocument_sem2() {
		return document_sem2;
	}
	public void setDocument_sem2(String document_sem2) {
		this.document_sem2 = document_sem2;
	}
	public String getDocument_sem3() {
		return document_sem3;
	}
	public void setDocument_sem3(String document_sem3) {
		this.document_sem3 = document_sem3;
	}
	public String getDocument_sem4() {
		return document_sem4;
	}
	public void setDocument_sem4(String document_sem4) {
		this.document_sem4 = document_sem4;
	}
	public String getDocument_sem5() {
		return document_sem5;
	}
	public void setDocument_sem5(String document_sem5) {
		this.document_sem5 = document_sem5;
	}
	public String getDocument_sem6() {
		return document_sem6;
	}
	public void setDocument_sem6(String document_sem6) {
		this.document_sem6 = document_sem6;
	}
	public String getDocument_sem7() {
		return document_sem7;
	}
	public void setDocument_sem7(String document_sem7) {
		this.document_sem7 = document_sem7;
	}
	public String getDocument_sem8() {
		return document_sem8;
	}
	public void setDocument_sem8(String document_sem8) {
		this.document_sem8 = document_sem8;
	}
	public String getDocument_clgId() {
		return document_clgId;
	}
	public void setDocument_clgId(String document_clgId) {
		this.document_clgId = document_clgId;
	}
	public String getDocument_uniqueId() {
		return document_uniqueId;
	}
	public void setDocument_uniqueId(String document_uniqueId) {
		this.document_uniqueId = document_uniqueId;
	}
	public String getDocument_drivingL() {
		return document_drivingL;
	}
	public void setDocument_drivingL(String document_drivingL) {
		this.document_drivingL = document_drivingL;
	}
	public String getDocument_birthC() {
		return document_birthC;
	}
	public void setDocument_birthC(String document_birthC) {
		this.document_birthC = document_birthC;
	}
	public String getDocument_other() {
		return document_other;
	}
	public void setDocument_other(String document_other) {
		this.document_other = document_other;
	}
	
	

}
