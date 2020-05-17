package usermanagement.model;

public class Product {
    private int id;
    private int userId;
    private String image;
    private String title;
    private String description;
    private int price;

    public Product(int id, int userId, String image, String title, String description, int price) {
        this.id = id;
        this.userId = userId;
        this.image = image;
        this.title = title;
        this.description = description;
        this.price = price;
    }

    public Product(int userId, String image, String title, String description, int price) {
        this.userId = userId;
        this.image = image;
        this.title = title;
        this.description = description;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
