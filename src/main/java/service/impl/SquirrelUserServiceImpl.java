package service.impl;

import dao.mapper.SquirrelUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.dto.UserShopsRelaDto;
import pojo.entity.SquirrelUser;

import java.util.List;

/**
 * Created by Administrator on 2017/2/27.
 */
@Service
public class SquirrelUserServiceImpl implements service.SquirrelUserService {
    @Autowired
    private SquirrelUserMapper squirrelUserMapper;
    @Override
    public int deleteByPrimaryKey(Integer userId) {
        return squirrelUserMapper.deleteByPrimaryKey(userId);
    }

    @Override
    public int insert(SquirrelUser record) {
        return squirrelUserMapper.insert(record);
    }

    @Override
    public int insertSelective(SquirrelUser record) {
        return squirrelUserMapper.insertSelective(record);
    }

    @Override
    public SquirrelUser selectByPrimaryKey(Integer userId) {
        return squirrelUserMapper.selectByPrimaryKey(userId);
    }

    @Override
    public int updateByPrimaryKeySelective(SquirrelUser record) {
        return squirrelUserMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SquirrelUser record) {
        return squirrelUserMapper.updateByPrimaryKey(record);
    }

    @Override
    public SquirrelUser selectByUserName(String userName) {
        return squirrelUserMapper.selectByUserName(userName);
    }

    @Override
    public List<SquirrelUser> selectAll() {
        return squirrelUserMapper.selectAll();
    }
}
