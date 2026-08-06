package com.pcloud.modeljz.entity;

public class JsTree  implements java.io.Serializable {

    private String id;
    private String text;
    private String title;
    private String icon;
    private String state;
    private String csv;
    private String dimension;
    private String unit;
    private String nature;
    private String jzId;
    /**
     * 是否案例数据
     */
    private String isSymbol;
    private boolean children;

    private String runStatus;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getCsv() {
        return csv;
    }

    public void setCsv(String csv) {
        this.csv = csv;
    }



    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public boolean isChildren() {
        return children;
    }

    public void setChildren(boolean children) {
        this.children = children;
    }

    public String getDimension() {
        return dimension;
    }

    public void setDimension(String dimension) {
        this.dimension = dimension;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getNature() {
        return nature;
    }

    public void setNature(String nature) {
        this.nature = nature;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIsSymbol() {
        return isSymbol;
    }

    public void setIsSymbol(String isSymbol) {
        this.isSymbol = isSymbol;
    }

    public String getRunStatus() {
        return runStatus;
    }

    public void setRunStatus(String runStatus) {
        this.runStatus = runStatus;
    }

    public String getJzId() {
        return jzId;
    }

    public void setJzId(String jzId) {
        this.jzId = jzId;
    }
}
