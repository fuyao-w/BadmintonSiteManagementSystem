package mapper;

import bean.td;

import java.util.LinkedList;

public interface tdMapper {


    int insert(td td);
    int delgl(int id);
    int subgl(td td);
    LinkedList<td> gettds();
    td gettd(Integer id);


}