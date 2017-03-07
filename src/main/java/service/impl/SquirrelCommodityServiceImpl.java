package service.impl;

import dao.mapper.SquirrelCommodityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.dto.Pagination;
import pojo.entity.SquirrelCommodity;

import java.util.List;

/**
 * Created by Administrator on 2017/2/27.
 */
@Service
public class SquirrelCommodityServiceImpl implements service.SquirrelCommodityService {
    @Autowired
    private SquirrelCommodityMapper squirrelCommodityMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return squirrelCommodityMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SquirrelCommodity record) {
        return squirrelCommodityMapper.insert(record);
    }

    @Override
    public int insertSelective(SquirrelCommodity record) {
        return squirrelCommodityMapper.insertSelective(record);
    }

    @Override
    public SquirrelCommodity selectByPrimaryKey(Integer id) {
        return squirrelCommodityMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SquirrelCommodity record) {
        return squirrelCommodityMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SquirrelCommodity record) {
        return squirrelCommodityMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<SquirrelCommodity> selectByShopId(Integer id, Pagination page) {
        page.startPage();
        return squirrelCommodityMapper.selectByShopId(id);
    }
}
