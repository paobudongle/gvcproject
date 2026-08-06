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

package com.pcloud.examinationreport.entity;

import com.frameworkset.orm.annotation.PrimaryKey;
/**
 * <p>Title: ExperDoc</p> <p>Description: 文档记录服务实体类 </p> <p>bxc</p> <p>Copyright
 * (c) 2007</p> @Date 2019-10-27 20:04:04 @author lijia @version v1.0
 */
public class ExperDoc implements java.io.Serializable {
	/**
	 * 实验ID
	 */

	private String experId;
	/**
	 * 实验名称
	 */
	private String experName;
	/**
	 * 组id
	 */
	private String groupId;
	private String lastModifyDate;
	private String lastModifyer;
	private String planDoc;
	/**
	 * 得分
	 */
	private long planSocre;
	private String remark;
	private String reportDoc;
	private long reportSocre;




	public ExperDoc() {
	}
	public void setExperId(String experId) {
		this.experId = experId;
	}

	public String getExperId() {
		return experId;
	}

	public void setExperName(String experName) {
		this.experName = experName;
	}

	public String getExperName() {
		return experName;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getGroupId() {
		return groupId;
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

	public void setPlanDoc(String planDoc) {
		this.planDoc = planDoc;
	}

	public String getPlanDoc() {
		return planDoc;
	}

	public void setPlanSocre(long planSocre) {
		this.planSocre = planSocre;
	}

	public long getPlanSocre() {
		return planSocre;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getRemark() {
		return remark;
	}

	public void setReportDoc(String reportDoc) {
		this.reportDoc = reportDoc;
	}

	public String getReportDoc() {
		return reportDoc;
	}

	public long getReportSocre() {
		return reportSocre;
	}

	public void setReportSocre(long reportSocre) {
		this.reportSocre = reportSocre;
	}
}