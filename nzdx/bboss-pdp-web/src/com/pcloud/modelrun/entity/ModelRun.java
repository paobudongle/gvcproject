/**
 *  Copyright 2008-2010 biaoping.yin
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

package com.pcloud.modelrun.entity;

import com.frameworkset.orm.annotation.Column;
import com.frameworkset.orm.annotation.PrimaryKey;
/**
 * <p>Title: ModelRun</p> <p>Description: 模型运行服务实体类 </p> <p>jbxbckj</p>
 * <p>Copyright (c) 2007</p> @Date 2018-05-17 16:31:44 @author lw @version v1.0
 */
public class ModelRun implements java.io.Serializable {
	@PrimaryKey
	private String runId;
	private String creatDate;
	private String creater;
	private String jzId;
	private String lastModifyDate;
	private String lastModifyer;
	private String runLog;
	private String jzTitle;

	public String getExperId() {
		return experId;
	}

	public void setExperId(String experId) {
		this.experId = experId;
	}

	private String experId;
	private String userName;
	/**
	 * 创建人账号
	 */
	private String createUsern;
	private String remark;

	/**
	 * 模拟名称
	 */
	private String runName;

	/**
	 * 闭合类型
	 */
	private String  colsureType;

	/**
	 * 因素冲击
	 */
	private String runShorck;

	/**
	 * 模型闭合内容
	 */
	private String runColsure;
	/**
	 * 运行求解
	 */
	private String runSolve;
	/**
	 * 0:处室创建；1：数据加总；2：运行完成
	 */
	private String runStatus;

	public String getModelType() {
		return modelType;
	}

	public void setModelType(String modelType) {
		this.modelType = modelType;
	}

	private String modelType;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getCreateUsern() {
		return createUsern;
	}
	public void setCreateUsern(String createUsern) {
		this.createUsern = createUsern;
	}



    public String getJzTitle() {
        return jzTitle;
    }

    public void setJzTitle(String jzTitle) {
        this.jzTitle = jzTitle;
    }



	public String getRunLog() {
		return runLog;
	}

	public void setRunLog(String runLog) {
		this.runLog = runLog;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}


	public String getColsureType() {
		return colsureType;
	}

	public void setColsureType(String colsureType) {
		this.colsureType = colsureType;
	}

	public ModelRun() {
	}
	public void setRunId(String runId) {
		this.runId = runId;
	}

	public String getRunId() {
		return runId;
	}

	public void setCreatDate(String creatDate) {
		this.creatDate = creatDate;
	}

	public String getCreatDate() {
		return creatDate;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getCreater() {
		return creater;
	}

	public void setJzId(String jzId) {
		this.jzId = jzId;
	}

	public String getJzId() {
		return jzId;
	}

	public void setLastModifyDate(String lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}

	public String getLastModifyDate() {
		return lastModifyDate;
	}

	public void setLastModifyer(String lastModifyer) {
		this.lastModifyer = lastModifyer;
	}

	public String getLastModifyer() {
		return lastModifyer;
	}

	public void setRunColsure(String runColsure) {
		this.runColsure = runColsure;
	}

	public String getRunColsure() {
		return runColsure.trim();
	}

	public void setRunName(String runName) {
		this.runName = runName;
	}

	public String getRunName() {
		return runName;
	}

	public void setRunShorck(String runShorck) {
		this.runShorck = runShorck;
	}

	public String getRunShorck() {
		return runShorck;
	}

	public void setRunSolve(String runSolve) {
		this.runSolve = runSolve;
	}

	public String getRunSolve() {
		return runSolve;
	}

	public void setRunStatus(String runStatus) {
		this.runStatus = runStatus;
	}

	public String getRunStatus() {
		return runStatus;
	}
	}