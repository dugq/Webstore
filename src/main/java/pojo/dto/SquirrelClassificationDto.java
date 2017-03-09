package pojo.dto;

import pojo.entity.SquirrelClassification;

import java.util.Date;

public class SquirrelClassificationDto extends SquirrelClassification {
    private static final long serialVersionUID = 8575718454301400748L;
    private int count;

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}