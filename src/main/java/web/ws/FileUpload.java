package web.ws;

import internal.basic.BasicController;
import org.apache.commons.lang.time.DateFormatUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import pojo.dto.JsonResponse;

import java.io.File;
import java.util.Date;

/**
 * Created by Administrator on 2017/3/5.
 */
@Controller
@RequestMapping("file")
public class FileUpload extends BasicController{
    String filePath = "/opt/data";

    @RequestMapping("upload")
    @ResponseBody
    public JsonResponse upload(@RequestParam("file") MultipartFile[] files) {
        String path = getSession().getServletContext().getRealPath(filePath);
        try {
            MultipartFile file = files[0];
            String curDate = DateFormatUtils.format(new Date(), "yyyyMMdd");
            String destDir = path + File.separator + curDate+ File.separator +getMemoryUser().getUserName();
            File destFile = new File(destDir);
            if (!destFile.exists()) {
                destFile.mkdirs();
            }
            String fileName = file.getOriginalFilename();
            File f = new File(destFile.getAbsoluteFile() + File.separator + fileName);
            // 如果当前文件已经存在了，就跳过。
            if (f.exists()) {
                JsonResponse response = JsonResponse.ofSuccess();
                response.put("url", filePath +File.separator + curDate+ File.separator +getMemoryUser().getUserName() + File.separator + fileName);
                return response;
            }
            file.transferTo(f);
            f.createNewFile();
            JsonResponse response = JsonResponse.ofSuccess();
            response.put("url", filePath +File.separator + curDate+ File.separator +getMemoryUser().getUserName() + File.separator + fileName);
            return response;
        }
        catch (Exception e) {
            e.printStackTrace();
            return JsonResponse.ofFail("保存失败。");
        }
    }
}
