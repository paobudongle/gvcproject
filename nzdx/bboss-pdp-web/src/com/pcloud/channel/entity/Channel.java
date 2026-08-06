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

package com.pcloud.channel.entity;

import com.frameworkset.orm.annotation.PrimaryKey;
/**
 * <p>Title: Channel</p> <p>Description: 栏目管理服务实体类 </p> <p>bxckj</p>
 * <p>Copyright (c) 2007</p> @Date 2018-02-26 21:15:12 @author lijia @version
 * v1.0
 */
public class Channel implements java.io.Serializable {
	/**
	 * ID
	 */
	@PrimaryKey
	private String channelId;
	/**
	 * 创建时间
	 */
	private String createDate;
	/**
	 * 创建人
	 */
	private String creater;
	/**
	 * 删除标识
	 */
	private String delFlag;
	/**
	 * 描述
	 */
	private String description;
	/**
	 * 是否有内容
	 */
	private String hasContent;
	/**
	 * 是否在新页面打开
	 */
	private String isBlankOpen;
	/**
	 * 是否显示
	 */
	private String isDisplay;
	/**
	 * 关键词
	 */
	private String keywrods;
	/**
	 * 修改人
	 */
	private String lastModifier;
	/**
	 * 修改时间
	 */
	private String lastModifyDate;
	/**
	 * 排序号
	 */
	private int orderNo;
	/**
	 * 父ID
	 */
	private String pid;
	/**
	 * 简要标题
	 */
	private String sortTitle;
	/**
	 * 标题
	 */
	private String title;
	/**
	 * 内容模板
	 */
	private String tplContent;
	public Channel() {
	}
	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}

	public String getChannelId() {
		return channelId;
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

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public void setHasContent(String hasContent) {
		this.hasContent = hasContent;
	}

	public String getHasContent() {
		return hasContent;
	}

	public void setIsBlankOpen(String isBlankOpen) {
		this.isBlankOpen = isBlankOpen;
	}

	public String getIsBlankOpen() {
		return isBlankOpen;
	}

	public void setIsDisplay(String isDisplay) {
		this.isDisplay = isDisplay;
	}

	public String getIsDisplay() {
		return isDisplay;
	}

	public void setKeywrods(String keywrods) {
		this.keywrods = keywrods;
	}

	public String getKeywrods() {
		return keywrods;
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

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPid() {
		return pid;
	}

	public void setSortTitle(String sortTitle) {
		this.sortTitle = sortTitle;
	}

	public String getSortTitle() {
		return sortTitle;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public void setTplContent(String tplContent) {
		this.tplContent = tplContent;
	}

	public String getTplContent() {
		return tplContent;
	}

}