package mapper;

import bean.prep;

import java.util.ArrayList;
import java.util.LinkedList;

public interface prepMapper {
    int insert(prep record);
   prep getPrepByid(Integer id);
   prep getxx(String ddid);

    int inprep(prep prep);
    int delprep(Integer id);
    int upprep(prep prep);
    int upzt(String zt);
    LinkedList<prep> getPrep();
    ArrayList<prep> gettotal();
    ArrayList<prep> gettotal1();
    LinkedList<prep> getallprep(String member);
}