package service.impl;

import dao.mapper.SquirrelShopsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.entity.SquirrelShops;

/**
 * Created by Administrator on 2017/2/27.
 */
@Service
public class SquirrelShopsServiceImpl implements service.SquirrelShopsService {
    @Autowired
    private SquirrelShopsMapper squirrelShopsMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return squirrelShopsMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SquirrelShops record) {
        return squirrelShopsMapper.insert(record);
    }

    @Override
    public int insertSelective(SquirrelShops record) {
        return squirrelShopsMapper.insertSelective(record);
    }

    @Override
    public SquirrelShops selectByPrimaryKey(Integer id) {
        return squirrelShopsMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SquirrelShops record) {
        return squirrelShopsMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SquirrelShops record) {
        return squirrelShopsMapper.updateByPrimaryKey(record);
    }
}
