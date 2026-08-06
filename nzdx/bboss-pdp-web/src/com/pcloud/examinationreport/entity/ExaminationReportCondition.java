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

/**
 * <p>Title: ExaminationReportCondition</p> <p>Description: 考核报告查询条件实体类 </p>
 * <p>bxt</p> <p>Copyright (c) 2007</p> @Date 2019-10-26 17:56:09 @author
 * lijia @version v1.0
 */
public class ExaminationReportCondition implements java.io.Serializable {
	private String endTime;
	private String startTime;
	private String classId;
	private String groupId;
	private String experId;
	private String userId;
	public ExaminationReportCondition() {
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getStartTime() {
		return startTime;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}

	public String getExperId() {
		return experId;
	}

	public void setExperId(String experId) {
		this.experId = experId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}