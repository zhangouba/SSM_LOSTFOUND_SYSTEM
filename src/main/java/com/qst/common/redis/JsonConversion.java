package com.qst.common.redis;

/*
 * 作用:实现接受Json解析后的数据
 * */
public class JsonConversion {
    // 设置属性
    public String name;
    public int age;

    // 构造器
    public JsonConversion() {

    }

    // getter和setter方法
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    /*
     * 具体实现方法 转化为String字符串
     */
    @Override
    public String toString() {
        return "Person [name=" + name + ", age=" + age + "]";
    }

}
