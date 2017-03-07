package pojo.dto;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

/**
 * Created by Administrator on 2017/3/5.
 */
public class Pagination {
    private int pageNum; // 页码
    private int pageSize; // 每页显示数量

    public Pagination(int pageSize) {
        this(0, pageSize);
    }

    public Pagination(int pageNum, int pageSize) {
        this.pageNum = pageNum;
        this.pageSize = pageSize;
    }

    /**
     * 开始分页
     *
     * @return
     */
    public Page startPage() {
        return PageHelper.startPage(this.pageNum, this.pageSize);
    }

    /**
     * @param orderBy
     *            排序
     * @return
     */
    public Page startPage(String orderBy) {
        return PageHelper.startPage(this.pageNum, this.pageSize, orderBy);
    }

    /**
     * @param count
     *            是否进行count查询
     * @return
     */
    public Page startPage(Boolean count) {
        return PageHelper.startPage(this.pageNum, this.pageSize, count);
    }

    /**
     * @param count
     *            是否进行count查询
     * @param reasonable
     *            分页合理化,null时用默认配置
     * @return
     */
    public Page startPage(Boolean count, Boolean reasonable) {
        return PageHelper.startPage(this.pageNum, this.pageSize, count, reasonable);
    }

    /**
     * @param count
     *            是否进行count查询
     * @param reasonable
     *            分页合理化,null时用默认配置
     * @param pageSizeZero
     *            true且pageSize=0时返回全部结果，false时分页,null时用默认配置
     * @return
     */
    public Page startPage(Boolean count, Boolean reasonable, Boolean pageSizeZero) {
        return PageHelper.startPage(this.pageNum, this.pageSize, count, reasonable, pageSizeZero);
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
