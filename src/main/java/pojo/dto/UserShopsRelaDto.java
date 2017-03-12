package pojo.dto;

import pojo.entity.UserShopsRela;

/**
 * Created by Administrator on 2017/3/12.
 */
public class UserShopsRelaDto extends UserShopsRela {
    private static final long serialVersionUID = 6307149607228631589L;

    private String name;
    private Double price;
    private String description;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
