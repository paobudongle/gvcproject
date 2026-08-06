
package com.pcloud.examinationreport.entity;


public class ExaminationReport implements java.io.Serializable {
	/**
	 * 实验ID
	 */
	private String experId;
	/**
	 * 耗时（分钟）
	 */
	private int costTime;
	private String endTime;
	/**
	 * 实验名称
	 */
	private String experName;

	private String userId;
	/**
	 * 00:进行中；05：实验完成
	 */
	private String experState;
	/**
	 * 所属组ID
	 */
	private long operatSocre;
	private String remark;
	private String startTime;

	public String getModelType() {
		return modelType;
	}

	public void setModelType(String modelType) {
		this.modelType = modelType;
	}

	private  String modelType;
	/**
	 * 得分
	 */
	private long totalSocre;

	public ExaminationReport() {
	}

	public void setExperId(String experId) {
		this.experId = experId;
	}

	public String getExperId() {
		return experId;
	}

	public void setCostTime(int costTime) {
		this.costTime = costTime;
	}

	public int getCostTime() {
		return costTime;
	}


	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setExperName(String experName) {
		this.experName = experName;
	}

	public String getExperName() {
		return experName;
	}

	public void setExperState(String experState) {
		this.experState = experState;
	}

	public String getExperState() {
		return experState;
	}


	public long getOperatSocre() {
		return operatSocre;
	}

	public void setOperatSocre(long operatSocre) {
		this.operatSocre = operatSocre;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getRemark() {
		return remark;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getStartTime() {
		return startTime;
	}


	public void setTotalSocre(long totalSocre) {
		this.totalSocre = totalSocre;
	}

	public long getTotalSocre() {
		return totalSocre;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}