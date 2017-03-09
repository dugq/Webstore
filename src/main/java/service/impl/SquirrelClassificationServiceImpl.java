package service.impl;

import dao.mapper.SquirrelClassificationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.dto.SquirrelClassificationDto;
import pojo.entity.SquirrelClassification;

import java.util.List;

/**
 * Created by Administrator on 2017/3/8.
 */
@Service
public class SquirrelClassificationServiceImpl implements service.SquirrelClassificationService {
    @Autowired
    private SquirrelClassificationMapper squirrelClassificationMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return squirrelClassificationMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(SquirrelClassification record) {
        return squirrelClassificationMapper.insert(record);
    }

    @Override
    public int insertSelective(SquirrelClassification record) {
        return squirrelClassificationMapper.insertSelective(record);
    }

    @Override
    public SquirrelClassification selectByPrimaryKey(Integer id) {
        return squirrelClassificationMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(SquirrelClassification record) {
        return squirrelClassificationMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(SquirrelClassification record) {
        return squirrelClassificationMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<SquirrelClassificationDto> selectAllDtos() {
        return squirrelClassificationMapper.selectAllDtos();
    }

    @Override
    public List<SquirrelClassification> selectByName(String name) {
        return squirrelClassificationMapper.selectByName(name);
    }
}
