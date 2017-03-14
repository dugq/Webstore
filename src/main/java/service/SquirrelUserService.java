package service;

import pojo.dto.UserShopsRelaDto;
import pojo.entity.SquirrelUser;

import java.util.List;

/**
 * Created by Administrator on 2017/2/27.
 */
public interface SquirrelUserService {
    int deleteByPrimaryKey(Integer userId);

    int insert(SquirrelUser record);

    int insertSelective(SquirrelUser record);

    SquirrelUser selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(SquirrelUser record);

    int updateByPrimaryKey(SquirrelUser record);

    SquirrelUser selectByUserName(String userName);

    List<SquirrelUser> selectAll();
}
