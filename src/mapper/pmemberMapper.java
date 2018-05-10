package mapper;

import bean.pmember;

public interface pmemberMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(pmember record);

    int insertSelective(pmember record);

    pmember selectByPrimaryKey(Integer mid);

    int updateByPrimaryKeySelective(pmember pmember);

    int updateByPrimaryKey(pmember pmember);
}