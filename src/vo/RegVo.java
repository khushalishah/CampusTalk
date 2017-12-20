package vo;

import java.io.Serializable;

public class RegVo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String registration_name;
	private String registration_gender;
	private String registration_date;
	private String registration_profilePic;
	private String registration_email;
	private String registration_phone;
	private String registration_alternatePhone;
	private String registration_uname;
	private String registration_password;
	private long registration_enrollment;
	private int registration_passingyear;
	private String registration_odetails;
	private String registration_tdetails;
	private String registration_pdetails;
	private String registration_department;
	private int registration_semester;
	
	public RegVo(){}

	public RegVo(String registration_name, String registration_gender, String registration_date,
			String registration_profilePic, String registration_email, 
			String registration_phone, String registration_alternatePhone, String registration_uname,
			String registration_password, long registration_enrollment,
			int registration_passingyear, String registration_odetails,String registration_tdetails, String registration_pdetails,
			String registration_department, int registration_semester) 
	{
		super();
		this.registration_name = registration_name;
		this.registration_gender = registration_gender;
		this.registration_date = registration_date;
		this.registration_profilePic = registration_profilePic;
		this.registration_email = registration_email;
		this.registration_phone = registration_phone;
		this.registration_alternatePhone = registration_alternatePhone;
		this.registration_uname = registration_uname;
		this.registration_password = registration_password;
		this.registration_enrollment = registration_enrollment;
		this.registration_passingyear = registration_passingyear;
		this.registration_odetails = registration_odetails;
		this.registration_tdetails = registration_tdetails;
		this.registration_pdetails = registration_pdetails;
		this.registration_department = registration_department;
		this.registration_semester = registration_semester;
	}
	

	public String getRegistration_name() {
		return registration_name;
	}

	public void setRegistration_name(String registration_name) {
		this.registration_name = registration_name;
	}

	public String getRegistration_gender() {
		return registration_gender;
	}

	public void setRegistration_gender(String registration_gender) {
		this.registration_gender = registration_gender;
	}

	public String getRegistration_date() {
		return registration_date;
	}

	public void setRegistration_date(String registration_date) {
		this.registration_date = registration_date;
	}

	public String getRegistration_profilePic() {
		return registration_profilePic;
	}

	public void setRegistration_profilePic(String registration_profilePic) {
		this.registration_profilePic = registration_profilePic;
	}

	public String getRegistration_email() {
		return registration_email;
	}

	public void setRegistration_email(String registration_email) {
		this.registration_email = registration_email;
	}

	public String getRegistration_phone() {
		return registration_phone;
	}

	public void setRegistration_phone(String registration_phone) {
		this.registration_phone = registration_phone;
	}

	public String getRegistration_alternatePhone() {
		return registration_alternatePhone;
	}

	public void setRegistration_alternatePhone(String registration_alternatePhone) {
		this.registration_alternatePhone = registration_alternatePhone;
	}

	public String getRegistration_uname() {
		return registration_uname;
	}

	public void setRegistration_uname(String registration_uname) {
		this.registration_uname = registration_uname;
	}

	public String getRegistration_password() {
		return registration_password;
	}

	public void setRegistration_password(String registration_password) {
		this.registration_password = registration_password;
	}

	public long getRegistration_enrollment() {
		return registration_enrollment;
	}

	public void setRegistration_enrollment(long registration_enrollment) {
		this.registration_enrollment = registration_enrollment;
	}

	public int getRegistration_passingyear() {
		return registration_passingyear;
	}

	public void setRegistration_passingyear(int registration_passingyear) {
		this.registration_passingyear = registration_passingyear;
	}

	public String getRegistration_odetails() {
		return registration_odetails;
	}

	public void setRegistration_odetails(String registration_odetails) {
		this.registration_odetails = registration_odetails;
	}

	public String getRegistration_tdetails() {
		return registration_tdetails;
	}

	public void setRegistration_tdetails(String registration_tdetails) {
		this.registration_tdetails = registration_tdetails;
	}

	public String getRegistration_pdetails() {
		return registration_pdetails;
	}

	public void setRegistration_pdetails(String registration_pdetails) {
		this.registration_pdetails = registration_pdetails;
	}

	public String getRegistration_department() {
		return registration_department;
	}

	public void setRegistration_department(String registration_department) {
		this.registration_department = registration_department;
	}

	public int getRegistration_semester() {
		return registration_semester;
	}

	public void setRegistration_semester(int registration_semester) {
		this.registration_semester = registration_semester;
	}
	public RegVo getInstance(long id)
	{
		this.registration_enrollment=id;
		return this;
	}

	
}
