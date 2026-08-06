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

package com.pcloud.advertise.entity;

import com.frameworkset.orm.annotation.PrimaryKey;
/**
 * <p>Title: Advertise</p> <p>Description: 招聘服务实体类 </p> <p>bc</p> <p>Copyright
 * (c) 2007</p> @Date 2018-05-19 12:05:28 @author lijia @version v1.0
 */
public class Advertise implements java.io.Serializable {
	/**
	 * ID
	 */
	@PrimaryKey
	private String advertiseId;
	/**
	 * 招聘单位
	 */
	private String advertiseCompany;
	/**
	 * 招聘内容
	 */
	private String advertiseContent;
	/**
	 * 招聘职位
	 */
	private String advertisePosition;
	/**
	 * 状态0，未发布，1已发布
	 */
	private String advertiseStatus;
	/**
	 * 附件ID
	 */
	private String attachId;
	/**
	 * 创建时间
	 */
	private String createDate;
	/**
	 * 创建人
	 */
	private String creater;
	/**
	 * 是否删除
	 */
	private String delFlag;
	/**
	 * 修改人
	 */
	private String lastModifier;
	/**
	 * 修改时间
	 */
	private String lastModifyDate;
	/**
	 * 发布时间
	 */
	private String releaseDate;
	/**
	 * 工作地点
	 */
	private String workAddress;
	/**
	 * 薪资
	 */
	private String workWage;
	public Advertise() {
	}
	public void setAdvertiseId(String advertiseId) {
		this.advertiseId = advertiseId;
	}

	public String getAdvertiseId() {
		return advertiseId;
	}

	public void setAdvertiseCompany(String advertiseCompany) {
		this.advertiseCompany = advertiseCompany;
	}

	public String getAdvertiseCompany() {
		return advertiseCompany;
	}

	public void setAdvertiseContent(String advertiseContent) {
		this.advertiseContent = advertiseContent;
	}

	public String getAdvertiseContent() {
		return advertiseContent;
	}

	public void setAdvertisePosition(String advertisePosition) {
		this.advertisePosition = advertisePosition;
	}

	public String getAdvertisePosition() {
		return advertisePosition;
	}

	public void setAdvertiseStatus(String advertiseStatus) {
		this.advertiseStatus = advertiseStatus;
	}

	public String getAdvertiseStatus() {
		return advertiseStatus;
	}

	public void setAttachId(String attachId) {
		this.attachId = attachId;
	}

	public String getAttachId() {
		return attachId;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getCreater() {
		return creater;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setLastModifier(String lastModifier) {
		this.lastModifier = lastModifier;
	}

	public String getLastModifier() {
		return lastModifier;
	}

	public void setLastModifyDate(String lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}

	public String getLastModifyDate() {
		return lastModifyDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setWorkAddress(String workAddress) {
		this.workAddress = workAddress;
	}

	public String getWorkAddress() {
		return workAddress;
	}

	public void setWorkWage(String workWage) {
		this.workWage = workWage;
	}

	public String getWorkWage() {
		return workWage;
	}

}