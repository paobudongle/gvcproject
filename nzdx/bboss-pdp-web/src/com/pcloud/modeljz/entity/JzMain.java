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

package com.pcloud.modeljz.entity;

import com.frameworkset.orm.annotation.PrimaryKey;
/**
 * <p>Title: JzMain</p> <p>Description: 模型数据加总服务实体类 </p> <p>北京信碧诚</p>
 * <p>Copyright (c) 2007</p> @Date 2018-03-25 00:24:45 @author liuwu @version
 * v1.0
 */
public class JzMain implements java.io.Serializable {
	/**
	 * 主键id
	 */
	@PrimaryKey
	private String jzId;
	/**
	 * 加总数据名称
	 */
	private String jzTitle;



	/**
	 * 加总数据类型
	 */
	private String jzType;
	/**
	 * 加总文件原名称
	 */
	private String jzOglname;
	/**
	 * 数据状态0:待执行；1:已执行；现阶段实时处理默认为1
	 */
	private String jzStatus;



	/**
	 * 是否模板
	 */
	private Integer isSymbol;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 加总日志
	 */
	private String aggLog;
	/**
	 * csv日志
	 */
	private String csvLog;
	/**
	 * 创建时间
	 */
	private String creatDate;
	/**
	 * 创建人
	 */
	private String creater;

	private String day;
	private String month;
	private String year;



	/**
	 * 创建人账号
	 */
	private String createrUsern;
	/**
	 * 修改时间
	 */
	private String lastModifyDate;
	/**
	 * 模型id
	 */
	private String mdId;
	/**
	 * 结果输出目录
	 */
	private String outputDir;

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}


	public JzMain() {
	}
	public void setJzId(String jzId) {
		this.jzId = jzId;
	}

	public String getJzId() {
		return jzId;
	}

	public void setJzTitle(String jzTitle) {
		this.jzTitle = jzTitle;
	}

	public String getJzTitle() {
		return jzTitle;
	}

	public void setJzStatus(String jzStatus) {
		this.jzStatus = jzStatus;
	}

	public String getJzStatus() {
		return jzStatus;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getRemark() {
		return remark;
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

	public void setLastModifyDate(String lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}

	public String getLastModifyDate() {
		return lastModifyDate;
	}

	public void setMdId(String mdId) {
		this.mdId = mdId;
	}

	public String getMdId() {
		return mdId;
	}

	public void setOutputDir(String outputDir) {
		this.outputDir = outputDir;
	}

	public String getOutputDir() {
		return outputDir;
	}

	public String getAggLog() {
		return aggLog;
	}

	public void setAggLog(String aggLog) {
		this.aggLog = aggLog;
	}

	public String getCsvLog() {
		return csvLog;
	}

	public void setCsvLog(String csvLog) {
		this.csvLog = csvLog;
	}

	public String getJzType() {
		return jzType;
	}

	public void setJzType(String jzType) {
		this.jzType = jzType;
	}

	public String getJzOglname() {
		return jzOglname;
	}

	public void setJzOglname(String jzOglname) {
		this.jzOglname = jzOglname;
	}

	public Integer getIsSymbol() {
		return isSymbol;
	}

	public void setIsSymbol(Integer isSymbol) {
		this.isSymbol = isSymbol;
	}
	public String getCreaterUsern() {
		return createrUsern;
	}

	public void setCreaterUsern(String createrUsern) {
		this.createrUsern = createrUsern;
	}
}