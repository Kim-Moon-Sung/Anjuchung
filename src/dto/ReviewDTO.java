package dto;

import java.sql.Date;

public class ReviewDTO {
    private String reviewNo;
    private String reviewTitle;
    private String reviewContent;
    private String reviewWriterId;
    private String reviewFoodName;
    private java.sql.Date postDate;
    private String visitCount;
    private String reviewImage; //추가

    public String getReviewNo() {
        return reviewNo;
    }

    public void setReviewNo(String reviewNo) {
        this.reviewNo = reviewNo;
    }

    public String getReviewTitle() {
        return reviewTitle;
    }

    public void setReviewTitle(String reviewTitle) {
        this.reviewTitle = reviewTitle;
    }

    public String getReviewContent() {
        return reviewContent;
    }

    public void setReviewContent(String reviewContent) {
        this.reviewContent = reviewContent;
    }

    public String getReviewWriterId() {
        return reviewWriterId;
    }

    public void setReviewWriterId(String reviewWriterId) {
        this.reviewWriterId = reviewWriterId;
    }

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public String getVisitCount() {
        return visitCount;
    }

    public void setVisitCount(String visitCount) {
        this.visitCount = visitCount;
    }

    public String getReviewFoodName() {
        return reviewFoodName;
    }

    public void setReviewFoodName(String reviewFoodName) {
        this.reviewFoodName = reviewFoodName;
    }

    // 추가 시작
    public String getReviewImage() {
        return reviewImage;
    }

    public void setReviewImage(String reviewImage) {
        this.reviewImage = reviewImage;
    }
    //추가 끝
}
