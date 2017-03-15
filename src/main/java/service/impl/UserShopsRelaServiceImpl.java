package service.impl;

import com.github.pagehelper.PageHelper;
import dao.mapper.UserShopsRelaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.dto.UserShopsRelaDto;
import pojo.entity.UserShopsRela;

import java.util.List;

/**
 * Created by Administrator on 2017/2/27.
 */
@Service
public class UserShopsRelaServiceImpl implements service.UserShopsRelaService {
    @Autowired
    private UserShopsRelaMapper userShopsRelaMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return userShopsRelaMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(UserShopsRela record) {
        return userShopsRelaMapper.insert(record);
    }

    @Override
    public int insertSelective(UserShopsRela record) {
        return userShopsRelaMapper.insertSelective(record);
    }

    @Override
    public UserShopsRela selectByPrimaryKey(Integer id) {
        return userShopsRelaMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(UserShopsRela record) {
        return userShopsRelaMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(UserShopsRela record) {
        return userShopsRelaMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<UserShopsRelaDto> selectDtosByUserId(Integer userId) {
        return userShopsRelaMapper.selectDtosByUserId(userId);
    }

    @Override
    public List<UserShopsRelaDto> selectDtosByShopIdAndStutas(Integer pageIndex, Integer shopId,Byte status) {
        PageHelper.startPage(pageIndex,10);
        return userShopsRelaMapper.selectDtosByShopIdAndStatus(shopId,status);
    }

}
