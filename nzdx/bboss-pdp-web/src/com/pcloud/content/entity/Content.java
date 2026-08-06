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

import com.frameworkset.orm.annotation.PrimaryKey;
/**
 * <p>Title: Content</p> <p>Description: 内容表服务实体类 </p> <p>xxx</p> <p>Copyright
 * (c) 2007</p> @Date 2018-03-18 10:26:11 @author lijia @version v1.0
 */
public class Content implements java.io.Serializable {
	/**
	 * ID
	 */
	@PrimaryKey
	private String contentId;
	/**
	 * 作者
	 */
	private String author;
	/**
	 * 栏目ID
	 */
	private String channelId;

    private String channelName;
	/**
	 * 内容
	 */
	private String cmsContent;
	/**
	 * 内容图
	 */
	private String contentImg;
	/**
	 * 状态
	 */
	private String contentStatus;
	/**
	 * 转载ID
	 */
	private String crawlId;
	/**
	 * 创建时间
	 */
	private String createDate;
	/**
	 * 创建者
	 */
	private String creater;
	/**
	 * 是否删除
	 */
	private String delFlag;
	/**
	 * 摘要
	 */
	private String description;
	/**
	 * 修改人
	 */
	private String lastModifier;
	/**
	 * 修改时间
	 */
	private String lastModifyDate;
	/**
	 * 流媒体
	 */
	private String mediaId;
	/**
	 * 新闻时间
	 */
	private String newsdate;
	/**
	 * 来源
	 */
	private String orgin;
	/**
	 * 来源URL
	 */
	private String orginUrl;
	/**
	 * 发布时间
	 */
	private String releaseDate;
	/**
	 * 简短标题
	 */
	private String shortTitle;
	/**
	 * 标题
	 */
	private String title;
	/**
	 * 标题图
	 */
	private String titleImg;
	/**
	 * 附件ID
	 */
	private String attachId;
	/**
	 * 首页图
	 */
	private String indexImg;
	public Content() {
	}

    public String getChannelName() {
        return channelName;
    }

    public void setChannelName(String channelName) {
        this.channelName = channelName;
    }

    public void setContentId(String contentId) {
		this.contentId = contentId;
	}

	public String getContentId() {
		return contentId;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getAuthor() {
		return author;
	}

	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}

	public String getChannelId() {
		return channelId;
	}

	public void setCmsContent(String cmsContent) {
		this.cmsContent = cmsContent;
	}

	public String getCmsContent() {
		return cmsContent;
	}

	public void setContentImg(String contentImg) {
		this.contentImg = contentImg;
	}

	public String getContentImg() {
		return contentImg;
	}

	public void setContentStatus(String contentStatus) {
		this.contentStatus = contentStatus;
	}

	public String getContentStatus() {
		return contentStatus;
	}

	public void setCrawlId(String crawlId) {
		this.crawlId = crawlId;
	}

	public String getCrawlId() {
		return crawlId;
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

	public void setMediaId(String mediaId) {
		this.mediaId = mediaId;
	}

	public String getMediaId() {
		return mediaId;
	}

	public void setNewsdate(String newsdate) {
		this.newsdate = newsdate;
	}

	public String getNewsdate() {
		return newsdate;
	}

	public void setOrgin(String orgin) {
		this.orgin = orgin;
	}

	public String getOrgin() {
		return orgin;
	}

	public void setOrginUrl(String orginUrl) {
		this.orginUrl = orginUrl;
	}

	public String getOrginUrl() {
		return orginUrl;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setShortTitle(String shortTitle) {
		this.shortTitle = shortTitle;
	}

	public String getShortTitle() {
		return shortTitle;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setAttachId(String attachId) {
		this.attachId = attachId;
	}

	public String getAttachId() {
		return attachId;
	}

	public void setIndexImg(String indexImg) {
		this.indexImg = indexImg;
	}

	public String getIndexImg() {
		return indexImg;
	}

}