package com.pcloud.modeljz.entity;

import com.frameworkset.orm.annotation.PrimaryKey;

public class JzBasic implements java.io.Serializable {
    @PrimaryKey
    private String dicId;
    private String dicType;
    private String dicTitle;
    private String belongs;
    private String  dfTitle;
    private String  sortNo;
    private String  remark;

    public String getSortNo() {
        return sortNo;
    }

    public void setSortNo(String sortNo) {
        this.sortNo = sortNo;
    }


    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }






    public String getDicId() {
        return dicId;
    }

    public void setDicId(String dicId) {
        this.dicId = dicId;
    }

    public String getDicType() {
        return dicType;
    }

    public void setDicType(String dicType) {
        this.dicType = dicType;
    }

    public String getDicTitle() {
        return dicTitle;
    }

    public void setDicTitle(String dicTitle) {
        this.dicTitle = dicTitle;
    }

    public String getBelongs() {
        return belongs;
    }

    public void setBelongs(String belongs) {
        this.belongs = belongs;
    }

    public String getDfTitle() {
        return dfTitle;
    }

    public void setDfTitle(String dfTitle) {
        this.dfTitle = dfTitle;
    }
}
