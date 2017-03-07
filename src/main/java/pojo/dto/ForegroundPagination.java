package pojo.dto;

import com.github.pagehelper.PageInfo;

/**
 * Created by Administrator on 2017/3/5.
 */
public class ForegroundPagination {
    private String url; // 地址
    private int rows = 10; // 每页行数
    private int pages; // 一共多少页
    private int maxRowCount;// 一共多少行
    private int navigatePage = 5; // 分页导航栏显示个数
    private int[] navPageNums; // 分页导航栏
    private int pageIndex = 1; // 当前页
    private String rowsName = "rows"; // 如参数名冲突，可用此属性来修改rows的参数名
    private String pageIndexName = "pageIndex"; // 同上

    public ForegroundPagination() {

    }

    public ForegroundPagination(String rowsName, String pageIndexName) {
        this.rowsName = rowsName;
        this.pageIndexName = pageIndexName;
    }

    public static ForegroundPagination valueOf(PageInfo<?> pageInfo) {
        ForegroundPagination page = new ForegroundPagination();
        page.setRows(pageInfo.getPageSize());
        page.setPages(pageInfo.getPages());
        page.setNavigatePage(pageInfo.getNavigatePages());
        page.setNavPageNums(pageInfo.getNavigatepageNums());
        page.setPageIndex(pageInfo.getPageNum());
        return page;
    }

    public String getRowsName() {
        return rowsName;
    }

    public void setRowsName(String rowsName) {
        this.rowsName = rowsName;
    }

    public String getPageIndexName() {
        return pageIndexName;
    }

    public void setPageIndexName(String pageIndexName) {
        this.pageIndexName = pageIndexName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public int getNavigatePage() {
        return navigatePage;
    }

    public void setNavigatePage(int navigatePage) {
        this.navigatePage = navigatePage;
    }

    public int[] getNavPageNums() {
        return buildNavPageNums(pages, pageIndex, navigatePage);
    }

    public void setNavPageNums(int[] navPageNums) {
        this.navPageNums = navPageNums;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    private static int[] buildNavPageNums(int pages, int pageIndex, int showNum) {
        int[] navigatepageNums;
        // 当总页数小于或等于导航页码数时
        if (pages <= showNum) {
            navigatepageNums = new int[pages];
            for (int i = 0; i < pages; i++) {
                navigatepageNums[i] = i + 1;
            }
        }
        else { // 当总页数大于导航页码数时
            navigatepageNums = new int[showNum];
            int startNum = pageIndex - showNum / 2;
            int endNum = pageIndex + showNum / 2;

            if (startNum < 1) {
                startNum = 1;
                // (最前showNum页
                for (int i = 0; i < showNum; i++) {
                    navigatepageNums[i] = startNum++;
                }
            }
            else if (endNum > pages) {
                endNum = pages;
                // 最后showNum页
                for (int i = showNum - 1; i >= 0; i--) {
                    navigatepageNums[i] = endNum--;
                }
            }
            else {
                // 所有中间页
                for (int i = 0; i < showNum; i++) {
                    navigatepageNums[i] = startNum++;
                }
            }
        }
        return navigatepageNums;
    }

    public int getMaxRowCount() {
        return maxRowCount;
    }

    public void setMaxRowCount(int maxRowCount) {
        this.maxRowCount = maxRowCount;
    }
}
