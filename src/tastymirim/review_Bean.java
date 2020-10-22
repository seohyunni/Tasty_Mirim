package tastymirim;

import java.util.Date;

public class review_Bean {

	private int review_num; // 글 번호
	private String user_id; // 작성자 ID
	private String user_name; // 작성자 ID
	private int res_num; // 식당번호
	private String review_content; // 리뷰 내용
	private String review_photo; //리뷰 사진
	private int review_star; // 별점
	private Date review_regdate; // 리뷰 작성일
	
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		System.out.println("setNum");
		this.review_num = review_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getRes_num() {
		return res_num;
	}
	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_photo() {
		return review_photo;
	}
	public void setReview_photo(String review_photo) {
		this.review_photo = review_photo;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	public Date getReview_regdate() {
		return review_regdate;
	}
	public void setReview_regdate(Date review_regdate) {
		this.review_regdate = review_regdate;
	}

	
}
