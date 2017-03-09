package service.impl;

import com.github.pagehelper.PageHelper;
import dao.mapper.SquirrelCommodityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.dto.Pagination;
import pojo.dto.SquirrelCommodityDto;
import pojo.entity.SquirrelCommodity;
import pojo.entity.SquirrelShops;

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

    @Override
    public List<SquirrelCommodityDto> selectDtoByNameShopIdClassIdAndSortType(String name, Integer shopId, Integer classId, String sortType,int pageIndex) {
        PageHelper.startPage(pageIndex,4,sortType);
        return squirrelCommodityMapper.selectDtoByNameShopIdClassIdAndSortType(name,shopId,classId);
    }
}
