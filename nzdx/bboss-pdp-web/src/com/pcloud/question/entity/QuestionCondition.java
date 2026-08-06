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

/**
 * <p>Title: QuestionCondition</p> <p>Description: 问题主表查询条件实体类 </p> <p>xbc</p>
 * <p>Copyright (c) 2007</p> @Date 2019-06-22 14:10:54 @author lijia @version
 * v1.0
 */
public class QuestionCondition implements java.io.Serializable {
	/**
	 * 标题
	 */
	private String qTitle;
	private String sortKey;
	private boolean sortDesc;
	private String qId;
	private String myQuestion;
	private String myAnswer;
	private String userId;

	public QuestionCondition() {
	}
	public void setQTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getQTitle() {
		return qTitle;
	}

	public void setSortKey(String sortKey) {
		this.sortKey = sortKey;
	}

	public String getSortKey() {
		return sortKey;
	}

	public void setSortDesc(boolean sortDesc) {
		this.sortDesc = sortDesc;
	}

	public boolean getSortDesc() {
		return sortDesc;
	}

	public void setQId(String qId) {
		this.qId = qId;
	}

	public String getQId() {
		return qId;
	}

	public String getMyQuestion() {
		return myQuestion;
	}

	public void setMyQuestion(String myQuestion) {
		this.myQuestion = myQuestion;
	}

	public String getMyAnswer() {
		return myAnswer;
	}

	public void setMyAnswer(String myAnswer) {
		this.myAnswer = myAnswer;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}