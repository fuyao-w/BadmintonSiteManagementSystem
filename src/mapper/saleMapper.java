package mapper;

import bean.sale;
import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public interface saleMapper {
    int delByID(Integer id);

    int insertSale(sale sale);

    sale selByID(Integer id);

    int selqualification(@Param("id") Integer id,@Param("username")String username);

    int seldj(Integer id);

    int insertSelective(sale record);


    int updj(Integer id);

    int updj1(String title);

    int uppdj(@Param("dj") int dj, @Param("id") int id);

    sale selectByPrimaryKey(Integer id);

    LinkedList<sale> get10PTrave();

    LinkedList<sale> getallPTrave();

    ArrayList<sale> getall();

    int updateByPrimaryKeySelective(sale record);

    int updateByPrimaryKey(sale record);
    int updatedj(Integer id);



}