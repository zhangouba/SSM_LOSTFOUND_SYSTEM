package com.qst.manger.utils;

public class AttrNode {
    private  Integer type=0;      //0不选中
    private  Integer checked=0;//1选择

    public AttrNode(Integer checked) {
        this.checked = checked;
    }

    public AttrNode(Integer type, Integer checked) {
        this.type = type;
        this.checked = checked;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getChecked() {
        return checked;
    }

    public void setChecked(Integer checked) {
        this.checked = checked;
    }
}
