package mapper;

import bean.affiche;

import java.util.List;

public interface afficheMapper {
    int insert(affiche record);

    int insertSelective(affiche record);
    int updataAnnounce(affiche record);
    int delAnnounce(Integer id);
    affiche selOne(Integer id);
    List<affiche> selAll();
    List<affiche> getAllAfficheManage();
}