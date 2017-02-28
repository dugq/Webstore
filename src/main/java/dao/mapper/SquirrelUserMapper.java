package dao.mapper;

import org.apache.ibatis.annotations.Param;
import pojo.entity.SquirrelUser;

public interface SquirrelUserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(SquirrelUser record);

    int insertSelective(SquirrelUser record);

    SquirrelUser selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(SquirrelUser record);

    int updateByPrimaryKey(SquirrelUser record);

    SquirrelUser selectByUserName(@Param("userName") String userName);
}