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

package com.pcloud.question.service;

import com.pcloud.question.entity.*;
import com.frameworkset.util.ListInfo;
import com.frameworkset.common.poolman.ConfigSQLExecutor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.List;
import com.frameworkset.orm.transaction.TransactionManager;

/**
 * <p>Title: QuestionServiceImpl</p> <p>Description: 问题主表业务处理类 </p> <p>xbc</p>
 * <p>Copyright (c) 2007</p> @Date 2019-06-22 14:10:54 @author lijia @version
 * v1.0
 */
public class QuestionServiceImpl implements QuestionService {

	private static Logger log = LoggerFactory.getLogger(QuestionServiceImpl.class);

	private ConfigSQLExecutor executor;
	public void addQuestion(Question question) throws QuestionException {
		// 业务组件
		try {
			executor.insertBean("addQuestion", question);
		} catch (Throwable e) {
			throw new QuestionException("add Question failed:", e);
		}

	}
	public void deleteQuestion(String qId) throws QuestionException {
		try {
			executor.delete("deleteByKey", qId);
		} catch (Throwable e) {
			throw new QuestionException("delete Question failed::qId=" + qId, e);
		}

	}
	public void deleteBatchQuestion(String... qIds) throws QuestionException {
		TransactionManager tm = new TransactionManager();
		try {
			tm.begin();
			executor.deleteByKeys("deleteByKey", qIds);
			tm.commit();
		} catch (Throwable e) {

			throw new QuestionException("batch delete Question failed::qIds=" + qIds, e);
		} finally {
			tm.release();
		}

	}
	public void updateQuestion(Question question) throws QuestionException {
		try {
			executor.updateBean("updateQuestion", question);
		} catch (Throwable e) {
			throw new QuestionException("update Question failed::", e);
		}

	}
	public Question getQuestion(String qId) throws QuestionException {
		try {
			Question bean = executor.queryObject(Question.class, "selectById", qId);
			executor.update("addToViewCount",qId);
			return bean;
		} catch (Throwable e) {
			throw new QuestionException("get Question failed::qId=" + qId, e);
		}

	}
	public ListInfo queryListInfoQuestions(QuestionCondition conditions, long offset, int pagesize)
			throws QuestionException {
		ListInfo datas = null;
		try {
			datas = executor.queryListInfoBean(Question.class, "queryListQuestion", offset, pagesize, conditions);
		} catch (Exception e) {
			throw new QuestionException("pagine query Question failed:", e);
		}
		return datas;

	}
	public List<Question> queryListQuestions(QuestionCondition conditions) throws QuestionException {
		try {
			List<Question> beans = executor.queryListBean(Question.class, "queryListQuestion", conditions);
			return beans;
		} catch (Exception e) {
			throw new QuestionException("query Question failed:", e);
		}

	}

	@Override
	public List<QuestionAnswer> queryListQuestionAnswer(String qId) throws QuestionException {
		try {
			List<QuestionAnswer> beans = executor.queryList(QuestionAnswer.class, "queryListQuestionAnswer", qId);
			return beans;
		} catch (Exception e) {
			throw new QuestionException("query queryListQuestionAnswer failed:", e);
		}
	}

	@Override
	public void addQuestionAnswer(QuestionAnswer questionAnswer) throws QuestionException {

		try {
			executor.insertBean("addQuestionAnswer", questionAnswer);
			executor.update("addToAnswerCount",questionAnswer.getQId());
		} catch (Throwable e) {
			throw new QuestionException("add addQuestionAnswer failed:", e);
		}
	}
}