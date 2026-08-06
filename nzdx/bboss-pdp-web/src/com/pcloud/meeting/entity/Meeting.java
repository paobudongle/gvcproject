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

package com.pcloud.meeting.entity;

import com.frameworkset.orm.annotation.PrimaryKey;
/**
 * <p>Title: Meeting</p> <p>Description: 会议管理服务实体类 </p> <p>bc</p> <p>Copyright
 * (c) 2007</p> @Date 2018-05-19 12:04:43 @author lijia @version v1.0
 */
public class Meeting implements java.io.Serializable {
	/**
	 * ID
	 */
	@PrimaryKey
	private String meetingId;
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
	 * 会议地点
	 */
	private String meetingAddress;
	/**
	 * 会议内容
	 */
	private String meetingContent;
	/**
	 * 会议日期
	 */
	private String meetingData;
	private String meetingStartData;
	private String meetingEndData;



	/**
	 * 状态0，未发布，1已发布
	 */
	private String meetingStatus;
	/**
	 * 主办单位
	 */
	private String organizer;
	/**
	 * 发布时间
	 */
	private String releaseDate;
	/**
	 * 标题
	 */
	private String title;
	public Meeting() {
	}
	public void setMeetingId(String meetingId) {
		this.meetingId = meetingId;
	}

	public String getMeetingId() {
		return meetingId;
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

	public void setMeetingAddress(String meetingAddress) {
		this.meetingAddress = meetingAddress;
	}

	public String getMeetingAddress() {
		return meetingAddress;
	}

	public void setMeetingContent(String meetingContent) {
		this.meetingContent = meetingContent;
	}

	public String getMeetingContent() {
		return meetingContent;
	}

	public void setMeetingData(String meetingData) {
		this.meetingData = meetingData;
	}

	public String getMeetingData() {
		return meetingData;
	}

	public void setMeetingStatus(String meetingStatus) {
		this.meetingStatus = meetingStatus;
	}

	public String getMeetingStatus() {
		return meetingStatus;
	}

	public void setOrganizer(String organizer) {
		this.organizer = organizer;
	}

	public String getOrganizer() {
		return organizer;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public String getMeetingStartData() {
		return meetingStartData;
	}

	public void setMeetingStartData(String meetingStartData) {
		this.meetingStartData = meetingStartData;
	}

	public String getMeetingEndData() {
		return meetingEndData;
	}

	public void setMeetingEndData(String meetingEndData) {
		this.meetingEndData = meetingEndData;
	}
}