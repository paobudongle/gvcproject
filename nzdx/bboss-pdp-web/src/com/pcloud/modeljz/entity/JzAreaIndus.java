package com.pcloud.modeljz.entity;

import com.frameworkset.orm.annotation.PrimaryKey;

public class JzAreaIndus implements java.io.Serializable {
    @PrimaryKey
    private String aiId;
    private String mdId;
    private String aiType;
    private String aiCode;
    private String aiName;


    private String  sortNo;

    private String aiRemark;
    private String aiBlongBefore;
    private String aiBlongNew;
    private String createDate;
    private String lastModifyDate;
    private String creater;

    public String getAiId() {
        return aiId;
    }

    public void setAiId(String aiId) {
        this.aiId = aiId;
    }

    public String getMdId() {
        return mdId;
    }

    public void setMdId(String mdId) {
        this.mdId = mdId;
    }

    public String getAiType() {
        return aiType;
    }

    public void setAiType(String aiType) {
        this.aiType = aiType;
    }

    public String getAiCode() {
        return aiCode;
    }

    public void setAiCode(String aiCode) {
        this.aiCode = aiCode;
    }

    public String getAiName() {
        return aiName;
    }

    public void setAiName(String aiName) {
        this.aiName = aiName;
    }



    public String getAiBlongBefore() {
        return aiBlongBefore;
    }

    public void setAiBlongBefore(String aiBlongBefore) {
        this.aiBlongBefore = aiBlongBefore;
    }

    public String getAiBlongNew() {
        return aiBlongNew;
    }

    public void setAiBlongNew(String aiBlongNew) {
        this.aiBlongNew = aiBlongNew;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getLastModifyDate() {
        return lastModifyDate;
    }

    public void setLastModifyDate(String lastModifyDate) {
        this.lastModifyDate = lastModifyDate;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }
    public String getAiRemark() {
        return aiRemark;
    }

    public void setAiRemark(String aiRemark) {
        this.aiRemark = aiRemark;
    }
    public String getSortNo() {
        return sortNo;
    }

    public void setSortNo(String sortNo) {
        this.sortNo = sortNo;
    }


}
