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

package com.pcloud.question.entity;

import com.frameworkset.orm.annotation.PrimaryKey;
/**
 * <p>Title: Question</p> <p>Description: 问题主表服务实体类 </p> <p>xbc</p> <p>Copyright
 * (c) 2007</p> @Date 2019-06-22 14:10:54 @author lijia @version v1.0
 */
public class Question implements java.io.Serializable {
	/**
	 * 主键id
	 */
	@PrimaryKey
	private String qId;
	/**
	 * 回答数量
	 */
	private int answerCount;
	/**
	 * 内容
	 */
	private String qContent;
	/**
	 * 提问时间
	 */
	private String qTime;
	/**
	 * 标题
	 */
	private String qTitle;
	/**
	 * 用户id
	 */
	private String userId;
	/**
	 * 用户名称
	 */
	private String userName;
	/**
	 * 点击数量
	 */
	private int viewCount;
	public Question() {
	}


	public void setQId(String qId) {
		this.qId = qId;
	}

	public String getQId() {
		return qId;
	}

	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}

	public int getAnswerCount() {
		return answerCount;
	}

	public void setQContent(String qContent) {
		this.qContent = qContent;
	}

	public String getQContent() {
		return qContent;
	}

	public void setQTime(String qTime) {
		this.qTime = qTime;
	}

	public String getQTime() {
		return qTime;
	}

	public void setQTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getQTitle() {
		return qTitle;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserName() {
		return userName;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getViewCount() {
		return viewCount;
	}

}