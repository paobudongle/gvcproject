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
 * <p>Title: Mshorck</p> <p>Description: 模型运行服务实体类 </p> <p>xbckj</p>
 * <p>Copyright (c) 2007</p> @Date 2018-05-08 16:44:27 @author lw @version v1.0
 */
public class Mshorck implements java.io.Serializable {
	@PrimaryKey
	private String shorckId;
	private String shorckS1;
	private String shorckS2;
	private String shorckS3;
	private String shorckS4;
	private String remark;
	private String remarkCn;

	public String getModelType() {
		return modelType;
	}

	public void setModelType(String modelType) {
		this.modelType = modelType;
	}

	private String modelType;

	public String getRemarkCn() {
		return remarkCn;
	}

	public void setRemarkCn(String remarkCn) {
		this.remarkCn = remarkCn;
	}

	/**
	 * 传值 短期闭合 标准集合
	 */
	private String clousreType;


	public String getClousreType() {
		return clousreType;
	}

	public void setClousreType(String clousreType) {
		this.clousreType = clousreType;
	}




	public Mshorck() {
	}
	public void setShorckId(String shorckId) {
		this.shorckId = shorckId;
	}

	public String getShorckId() {
		return shorckId;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getRemark() {
		return remark;
	}

	public void setShorckS1(String shorckS1) {
		this.shorckS1 = shorckS1;
	}

	public String getShorckS1() {
		return shorckS1;
	}

	public void setShorckS2(String shorckS2) {
		this.shorckS2 = shorckS2;
	}

	public String getShorckS2() {
		return shorckS2;
	}

	public void setShorckS3(String shorckS3) {
		this.shorckS3 = shorckS3;
	}

	public String getShorckS3() {
		return shorckS3;
	}

	public void setShorckS4(String shorckS4) {
		this.shorckS4 = shorckS4;
	}

	public String getShorckS4() {
		return shorckS4;
	}

}