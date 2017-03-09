package pojo.Enum;

/**
 * Created by Administrator on 2017/3/9.
 */
public enum SortTypeEnum {
    //排序方式：价格升序，价格降序，销量升序，销量降序
    PRICE(0),PRICEDESC(1),SALES(2),SALESDESC(3),other(-1);
    private int value;
    private SortTypeEnum(int value){
        this.value = value;
    }

    public int getValue(){
        return this.value;
    }

    public String getExpression(){
       switch (this.value){
           case 0: return "price";
           case 1: return "price desc";
           case 2:return "sale_num";
           case 3:return "sale_num desc";
           default:return "";
       }
    }
    public static SortTypeEnum valueOf(int value) {
        switch (value) {
            case 0: return PRICE;
            case 1: return PRICEDESC;
            case 2:return SALES;
            case 3:return SALESDESC;
            default:return other;
        }
    }
}
