package service;

import bean.sale;

import java.util.concurrent.ConcurrentHashMap;

public class conMap {
    private static class SingletonHolder{
        private static ConcurrentHashMap<Integer, sale> instance = new ConcurrentHashMap<>();
    }

    public static ConcurrentHashMap<Integer, sale> getInstance(){
       return SingletonHolder.instance;
    }
}
