package mapper;

import bean.comment;

import java.util.ArrayList;

public interface commentMapper {


    int insert(comment comment);

    int del(int id);

    comment selcom();

    ArrayList<comment> selreview();


}