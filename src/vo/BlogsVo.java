package vo;

import java.io.Serializable;

public class BlogsVo implements Serializable{

	private static final long serialVersionUID = 1L;
	private int blog_id;
	private long blog_enrollment ;
	private String blog_name;
	private String blog_title;
	private String blog_file;
	private String blog_description;
	private String blog_date;
	private String blog_category;
	
	BlogsVo()
	{}
	
	
	
	public BlogsVo(int blog_id, long blog_enrollment, String blog_name, String blog_title, String blog_file,
			String blog_description,String blog_date,String blog_category) {
		super();
		this.blog_id = blog_id;
		this.blog_enrollment = blog_enrollment;
		this.blog_name = blog_name;
		this.blog_title = blog_title;
		this.blog_file = blog_file;
		this.blog_description = blog_description;
		this.blog_date=blog_date;
		this.blog_category=blog_category;
	}



	public BlogsVo(long blog_enrollment, String blog_name, String blog_title, String blog_file, String blog_description,String blog_date,String blog_category) {
		super();
		this.blog_enrollment = blog_enrollment;
		this.blog_name = blog_name;
		this.blog_title = blog_title;
		this.blog_file = blog_file;
		this.blog_description = blog_description;
		this.blog_date=blog_date;
		this.blog_category=blog_category;
	}
	public long getBlog_enrollment() {
		return blog_enrollment;
	}
	public void setBlog_enrollment(long blog_enrollment) {
		this.blog_enrollment = blog_enrollment;
	}
	public int getBlog_id() {
		return blog_id;
	}
	public void setBlog_id(int blog_id) {
		this.blog_id = blog_id;
	}
	public String getBlog_name() {
		return blog_name;
	}
	public void setBlog_name(String blog_name) {
		this.blog_name = blog_name;
	}
	public String getBlog_title() {
		return blog_title;
	}
	public void setBlog_title(String blog_title) {
		this.blog_title = blog_title;
	}
	public String getBlog_file() {
		return blog_file;
	}
	public void setBlog_file(String blog_file) {
		this.blog_file = blog_file;
	}
	public String getBlog_description() {
		return blog_description;
	}
	public void setBlog_description(String blog_description) {
		this.blog_description = blog_description;
	}



	public String getBlog_date() {
		return blog_date;
	}



	public void setBlog_date(String blog_date) {
		this.blog_date = blog_date;
	}



	public String getBlog_category() {
		return blog_category;
	}



	public void setBlog_category(String blog_category) {
		this.blog_category = blog_category;
	}
	
}
