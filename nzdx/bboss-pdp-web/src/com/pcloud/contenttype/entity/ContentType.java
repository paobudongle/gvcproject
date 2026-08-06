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

package com.pcloud.contenttype.entity;

import com.frameworkset.orm.annotation.PrimaryKey;
/**
 * <p>Title: ContentType</p> <p>Description: 内容分类服务实体类 </p> <p>xxx</p>
 * <p>Copyright (c) 2007</p> @Date 2018-03-04 17:50:51 @author lijia @version
 * v1.0
 */
public class ContentType implements java.io.Serializable {
	/**
	 * ID
	 */
	@PrimaryKey
	private String contentTypeId;
	/**
	 * 名称
	 */
	private String contentTypeName;
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
	 * 是否有图片
	 */
	private String hasImg;
	/**
	 * 图片高度
	 */
	private int imgHeight;
	/**
	 * 图片宽度
	 */
	private int imgWidth;
	/**
	 * 是否可用
	 */
	private String isDisplay;
	/**
	 * 修改人
	 */
	private String lastModifier;
	/**
	 * 修改时间
	 */
	private String lastModifyDate;
	public ContentType() {
	}
	public void setContentTypeId(String contentTypeId) {
		this.contentTypeId = contentTypeId;
	}

	public String getContentTypeId() {
		return contentTypeId;
	}

	public void setContentTypeName(String contentTypeName) {
		this.contentTypeName = contentTypeName;
	}

	public String getContentTypeName() {
		return contentTypeName;
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

	public void setHasImg(String hasImg) {
		this.hasImg = hasImg;
	}

	public String getHasImg() {
		return hasImg;
	}

	public void setImgHeight(int imgHeight) {
		this.imgHeight = imgHeight;
	}

	public int getImgHeight() {
		return imgHeight;
	}

	public void setImgWidth(int imgWidth) {
		this.imgWidth = imgWidth;
	}

	public int getImgWidth() {
		return imgWidth;
	}

	public String getIsDisplay() {
		return isDisplay;
	}

	public void setIsDisplay(String isDisplay) {
		this.isDisplay = isDisplay;
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

}