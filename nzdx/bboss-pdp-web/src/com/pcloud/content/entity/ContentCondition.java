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

package com.pcloud.content.entity;

/**
 * <p>Title: ContentCondition</p> <p>Description: 内容表查询条件实体类 </p> <p>xxx</p>
 * <p>Copyright (c) 2007</p> @Date 2018-03-18 10:26:11 @author lijia @version
 * v1.0
 */
public class ContentCondition implements java.io.Serializable {
	/**
	 * 内容
	 */
	private String cmsContent;
	/**
	 * 标题
	 */
	private String title;

	private String crawlId;

	private String channelId;

	private String contentId;
	private String channelName;

	private String searchword;

	public ContentCondition() {
	}

	public String getSearchword() {
		return searchword;
	}

	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}

	public String getChannelId() {
		return channelId;
	}

	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}

	public String getCrawlId() {
		return crawlId;
	}

	public void setCrawlId(String crawlId) {
		this.crawlId = crawlId;
	}

	public void setCmsContent(String cmsContent) {
		this.cmsContent = cmsContent;
	}

	public String getCmsContent() {
		return cmsContent;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public String getContentId() {
		return contentId;
	}

	public void setContentId(String contentId) {
		this.contentId = contentId;
	}

	public String getChannelName() {
		return channelName;
	}

	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}
}