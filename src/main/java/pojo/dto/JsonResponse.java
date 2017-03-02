package pojo.dto;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2017/2/28.
 */
public class JsonResponse extends HashMap<String,Object> implements Serializable{

    private static final long serialVersionUID = 374059332702876278L;

    private JsonResponse(){

    }

    public static JsonResponse ofFail(String message){
        JsonResponse response = new JsonResponse();
        response.put("status",false);
        response.setMessage(message);
        return  response;
    }
    public static JsonResponse ofSuccess(){
        JsonResponse response = new JsonResponse();
        response.put("status",true);
        response.setMessage("操作成功.");
        return  response;
    }


    public void setMessage(String message) {
        this.put("message",message);
    }
}
