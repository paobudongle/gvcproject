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
 * <p>Title: ModelResource</p> <p>Description: 模型资源服务实体类 </p> <p>bjxbc</p>
 * <p>Copyright (c) 2007</p> @Date 2018-07-26 12:17:13 @author lijia @version
 * v1.0
 */
public class ModelResource implements java.io.Serializable {
	/**
	 * 主键
	 */

	private String id;
	/**
	 * 00:全球模型01：国家模型02：区域模型
	 */
	private String blongsModel;
	/**
	 * 描述
	 */
	private String description;
	/**
	 * 难度等级 00 入门01初级02中级03高级
	 */
	private String difficLevel;
	/**
	 * 下载次数
	 */
	private int downloadCount;
	/**
	 * 收费情况00免费01付费
	 */
	private String isCharge;
	/**
	 * 上级ID
	 */
	private String parentId;
	/**
	 * 资源存放路径
	 */
	private String soucrePath;
	/**
	 * 资料图标
	 */
	private String sourceIcon;
	/**
	 * 资料名称
	 */
	private String sourceName;
	/**
	 * 资料类型00：文档资料 01：视频资料
	 */
	private String sourceType;
	/**
	 * 文件后缀
	 */
	private String suffix;
	/**
	 * 时长（仅视频资料有）
	 */
	private String timeLength;
	/**
	 * 更新日期
	 */
	private String updateDate;
	/**
	 * 上传时间
	 */
	private String uploadTime;
	/**
	 * 上传人
	 */
	private String uploadUser;
	/**
	 * 浏览次数
	 */
	private int viewCount;

	private int cdnum;

	private String fileSize;



	private String permission;


	public ModelResource() {
	}
	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}
	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setBlongsModel(String blongsModel) {
		this.blongsModel = blongsModel;
	}

	public String getBlongsModel() {
		return blongsModel;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public void setDifficLevel(String difficLevel) {
		this.difficLevel = difficLevel;
	}

	public String getDifficLevel() {
		return difficLevel;
	}

	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}

	public int getDownloadCount() {
		return downloadCount;
	}

	public void setIsCharge(String isCharge) {
		this.isCharge = isCharge;
	}

	public String getIsCharge() {
		return isCharge;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getParentId() {
		return parentId;
	}

	public void setSoucrePath(String soucrePath) {
		this.soucrePath = soucrePath;
	}

	public String getSoucrePath() {
		return soucrePath;
	}

	public void setSourceIcon(String sourceIcon) {
		this.sourceIcon = sourceIcon;
	}

	public String getSourceIcon() {
		return sourceIcon;
	}

	public void setSourceName(String sourceName) {
		this.sourceName = sourceName;
	}

	public String getSourceName() {
		return sourceName;
	}

	public void setSourceType(String sourceType) {
		this.sourceType = sourceType;
	}

	public String getSourceType() {
		return sourceType;
	}

	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}

	public String getSuffix() {
		return suffix;
	}

	public void setTimeLength(String timeLength) {
		this.timeLength = timeLength;
	}

	public String getTimeLength() {
		return timeLength;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getUploadTime() {
		return uploadTime;
	}

	public void setUploadUser(String uploadUser) {
		this.uploadUser = uploadUser;
	}

	public String getUploadUser() {
		return uploadUser;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getViewCount() {
		return viewCount;
	}

	public int getCdnum() {
		return cdnum;
	}

	public void setCdnum(int cdnum) {
		this.cdnum = cdnum;
	}
}