package service;

import pojo.dto.Pagination;
import pojo.entity.SquirrelCommodity;

import java.util.List;

/**
 * Created by Administrator on 2017/2/27.
 */
public interface SquirrelCommodityService {
    int deleteByPrimaryKey(Integer id);

    int insert(SquirrelCommodity record);

    int insertSelective(SquirrelCommodity record);

    SquirrelCommodity selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SquirrelCommodity record);

    int updateByPrimaryKey(SquirrelCommodity record);

    List<SquirrelCommodity> selectByShopId(Integer id, Pagination page);
}
