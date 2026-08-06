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

package com.pcloud.modelresource.entity;

/**
 * <p>Title: ModelResourceCondition</p> <p>Description: 模型资源查询条件实体类 </p>
 * <p>bjxbc</p> <p>Copyright (c) 2007</p> @Date 2018-07-26 12:17:13 @author
 * lijia @version v1.0
 */
public class ModelResourceCondition implements java.io.Serializable {
	/**
	 * 资料名称
	 */
	private String sourceName;
	private String parentId;
	/**
	 * 00:全球模型01：国家模型02：区域模型
	 */
	private String blongsModel;

	private String newHot;

	private String sourceType;
	private String difficLevel;
	private String isCharge;



	public ModelResourceCondition() {
	}
	public void setSourceName(String sourceName) {
		this.sourceName = sourceName;
	}

	public String getSourceName() {
		return sourceName;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getBlongsModel() {
		return blongsModel;
	}

	public void setBlongsModel(String blongsModel) {
		this.blongsModel = blongsModel;
	}

	public String getNewHot() {
		return newHot;
	}

	public void setNewHot(String newHot) {
		this.newHot = newHot;
	}

	public String getSourceType() {
		return sourceType;
	}

	public void setSourceType(String sourceType) {
		this.sourceType = sourceType;
	}

	public String getDifficLevel() {
		return difficLevel;
	}

	public void setDifficLevel(String difficLevel) {
		this.difficLevel = difficLevel;
	}

	public String getIsCharge() {
		return isCharge;
	}

	public void setIsCharge(String isCharge) {
		this.isCharge = isCharge;
	}
}