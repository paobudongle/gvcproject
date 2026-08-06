package com.pcloud.modeljz.entity;


import com.frameworkset.orm.annotation.PrimaryKey;

public class JzDf implements java.io.Serializable {
//    @PrimaryKey
    private String dfId;


    private String mdId;
    private String dfType;
    private String dfCode;
    private String dfTitle;
    private String creatDate;
    private String creater;
    private String sortNo;

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

    private String remark;

    public String getDfId() {
        return dfId;
    }

    public void setDfId(String dfId) {
        this.dfId = dfId;
    }

    public String getDfType() {
        return dfType;
    }

    public void setDfType(String dfType) {
        this.dfType = dfType;
    }

    public String getDfCode() {
        return dfCode;
    }

    public void setDfCode(String dfCode) {
        this.dfCode = dfCode;
    }

    public String getDfTitle() {
        return dfTitle;
    }

    public void setDfTitle(String dfTitle) {
        this.dfTitle = dfTitle;
    }

    public String getCreatDate() {
        return creatDate;
    }

    public void setCreatDate(String creatDate) {
        this.creatDate = creatDate;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }


    public String getMdId() { return mdId; }

    public void setMdId(String mdId) { this.mdId = mdId; }
}