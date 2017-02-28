package pojo.Enum;

/**
 * Created by Administrator on 2017/2/27.
 */
public enum UserType {
    ADMIN(0),SHOPKEEPER(1),consumer(2),OTHER(-1);
    private int value;
    UserType(int value){
        this.value = value;
    }
    private String getDescrition(){
        switch (value){
            case 1: return "管理员";
            case 2: return "商家";
            case 3: return "消费者";
            default:return "其他";
        }
    }
    public static UserType valueOf(int value) {
        UserType temp = null;
        switch (value) {
            case 0:
                temp = ADMIN;
                break;
            case 1:
                temp = SHOPKEEPER;
                break;
            case 2:
                temp = consumer;
                break;
            default:
                temp = OTHER;
                break;
        }
        return temp;
    }
    public int getValue() {
        return value;
    }
}
