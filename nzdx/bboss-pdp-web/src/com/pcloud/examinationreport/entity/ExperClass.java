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
 * <p>Title: ExperClass</p> <p>Description: 班级服务实体类 </p> <p>bxc</p> <p>Copyright
 * (c) 2007</p> @Date 2019-10-26 20:44:27 @author lijia @version v1.0
 */
public class ExperClass implements java.io.Serializable {
	/**
	 * 班级id
	 */
	private String classId;
	/**
	 * 班级编号
	 */
	private String classCode;
	/**
	 * 班级名称
	 */
	private String className;

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}

	public String getClassCode() {
		return classCode;
	}

	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}
}