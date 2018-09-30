package com.dimple.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Dimple on 2018/6/23/10:11
 */
public class Msg {
    //    状态码，100代表返回成功，200代表返回失败
    private int code;
    //系统要返回的数据
    private String msg;
    //需要返回的数据
    private Map<String, Object> extend = new HashMap<>();

    public static Msg success() {
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("操作成功");
        return result;
    }
    public static Msg failure() {
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("操作失败");
        return result;
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    public Msg add(String key, Object value) {
        this.extend.put(key, value);
        return this;
    }
}
