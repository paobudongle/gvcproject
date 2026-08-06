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

package com.pcloud.question.ws;

import com.pcloud.question.entity.*;
import com.pcloud.question.service.*;
import com.frameworkset.util.RListInfo;
import com.frameworkset.util.ListInfo;
import java.util.List;
import javax.jws.WebService;

/**
 * <p>Title: WSQuestionServiceImpl</p> <p>Description:
 * 问题主表webservice服务和hessian服务实现类. </p> <p>xbc</p> <p>Copyright (c)
 * 2007</p> @Date 2019-06-22 14:10:54 @author lijia @version v1.0
 */
@WebService(name = "WSQuestionService", targetNamespace = "com.pcloud.question.ws")
public class WSQuestionServiceImpl implements WSQuestionService {

	private QuestionService questionService;
	public void addQuestion(Question question) throws QuestionException {
		// webservice服务
		try {
			questionService.addQuestion(question);
		} catch (QuestionException e) {
			throw e;
		} catch (Throwable e) {
			throw new QuestionException("add Question failed:", e);
		}

	}
	public void deleteQuestion(String qId) throws QuestionException {
		// webservice服务
		try {
			questionService.deleteQuestion(qId);
		} catch (QuestionException e) {
			throw e;
		} catch (Throwable e) {
			throw new QuestionException("delete Question failed::qId=" + qId, e);
		}

	}
	public void deleteBatchQuestion(String... qIds) throws QuestionException {
		// webservice服务
		try {
			questionService.deleteBatchQuestion(qIds);
		} catch (QuestionException e) {
			throw e;
		} catch (Throwable e) {
			throw new QuestionException("batch delete Question failed::qIds=" + qIds, e);
		}

	}
	public void updateQuestion(Question question) throws QuestionException {
		// webservice服务
		try {
			questionService.updateQuestion(question);

		} catch (QuestionException e) {
			throw e;
		} catch (Throwable e) {
			throw new QuestionException("update Question failed::", e);
		}

	}
	public Question getQuestion(String qId) throws QuestionException {
		// webservice服务
		try {
			Question question = questionService.getQuestion(qId);
			return question;
		} catch (QuestionException e) {
			throw e;
		} catch (Throwable e) {
			throw new QuestionException("get Question failed::qId=" + qId, e);
		}

	}
	public RListInfo queryListInfoQuestions(QuestionCondition conditions, long offset, int pagesize)
			throws QuestionException {
		// webservice服务
		try {

			String qTitle = conditions.getQTitle();
			if (qTitle != null && !qTitle.equals("")) {
				conditions.setQTitle("%" + qTitle + "%");
			}
			ListInfo questions = questionService.queryListInfoQuestions(conditions, offset, pagesize);
			return new RListInfo(questions);
		} catch (QuestionException e) {
			throw e;
		} catch (Throwable e) {
			throw new QuestionException("pagine query Question failed:", e);
		}

	}
	public List<Question> queryListQuestions(QuestionCondition conditions) throws QuestionException {
		// webservice服务
		try {
			String qTitle = conditions.getQTitle();
			if (qTitle != null && !qTitle.equals("")) {
				conditions.setQTitle("%" + qTitle + "%");
			}
			List<Question> questions = questionService.queryListQuestions(conditions);
			return questions;
		} catch (QuestionException e) {
			throw e;
		} catch (Throwable e) {
			throw new QuestionException("query Question failed:", e);
		}

	}
}