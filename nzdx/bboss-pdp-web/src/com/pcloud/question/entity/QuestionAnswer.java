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
 * <p>Title: QuestionAnswer</p> <p>Description: 问题回复服务实体类 </p> <p>bxc</p>
 * <p>Copyright (c) 2007</p> @Date 2019-06-22 17:47:11 @author lijia @version
 * v1.0
 */
public class QuestionAnswer implements java.io.Serializable {
	@PrimaryKey
	private String answerId;
	/**
	 * 回答内容
	 */
	private String answerContent;
	/**
	 * 回答时间
	 */
	private String answerTime;
	/**
	 * 问题id
	 */
	private String qId;
	/**
	 * 用户id
	 */
	private String userId;
	/**
	 * 用户名
	 */
	private String userName;
	public QuestionAnswer() {
	}
	public void setAnswerId(String answerId) {
		this.answerId = answerId;
	}

	public String getAnswerId() {
		return answerId;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerTime(String answerTime) {
		this.answerTime = answerTime;
	}

	public String getAnswerTime() {
		return answerTime;
	}

	public void setQId(String qId) {
		this.qId = qId;
	}

	public String getQId() {
		return qId;
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

}