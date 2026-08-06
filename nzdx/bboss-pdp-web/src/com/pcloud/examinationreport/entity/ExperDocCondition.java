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
 * <p>Title: ExperDocCondition</p> <p>Description: 文档记录查询条件实体类 </p> <p>bxc</p>
 * <p>Copyright (c) 2007</p> @Date 2019-10-27 20:04:04 @author lijia @version
 * v1.0
 */
public class ExperDocCondition implements java.io.Serializable {
	/**
	 * 实验ID
	 */
	private String experId;
	/**
	 * 文档类型
	 */
	private String docType;

    private String modelType;
	private  String scores;

	public String getModelType() {
		return modelType;
	}

	public void setModelType(String modelType) {
		this.modelType = modelType;
	}

	public String getScores() {
		return scores;
	}

	public void setScores(String scores) {
		this.scores = scores;
	}

	public ExperDocCondition() {
	}
	public void setExperId(String experId) {
		this.experId = experId;
	}

	public String getExperId() {
		return experId;
	}

	public String getDocType() {
		return docType;
	}

	public void setDocType(String docType) {
		this.docType = docType;
	}
}