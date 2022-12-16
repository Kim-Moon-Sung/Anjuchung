package dto;

public class FoodDTO {

    private String foodId;
    private String fname;
    private Integer price;
    private String category;
    private String detail;
    private Integer stock;
    private String image;
    private int quantity;

    public FoodDTO() {}

    public FoodDTO(String foodId, String fname, Integer price, String category, String detail, Integer stock, String image) {
        super();
        this.foodId = foodId;
        this.fname = fname;
        this.price = price;
        this.category = category;
        this.detail = detail;
        this.stock = stock;
        this.image = image;
    }

    public String getFoodId() {
        return foodId;
    }

    public void setFoodId(String foodId) {
        this.foodId = foodId;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
