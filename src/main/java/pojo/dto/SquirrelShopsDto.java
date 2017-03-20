package pojo.dto;

import pojo.entity.SquirrelShops;

/**
 * Created by duq on 2017/3/10.
 */
public class SquirrelShopsDto extends SquirrelShops {

    private static final long serialVersionUID = -7212101885549168278L;

    private String shopkeeperName;

    private Integer sales;
    private String commodityName;

    public String getShopkeeperName() {
        return shopkeeperName;
    }

    public void setShopkeeperName(String shopkeeperName) {
        this.shopkeeperName = shopkeeperName;
    }

    public Integer getSales() {
        return sales;
    }

    public void setSales(Integer sales) {
        this.sales = sales;
    }


    public void setCommodityName(String commodityName) {
        this.commodityName = commodityName;
    }


    public String getCommodityName() {
        return commodityName;
    }
}