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
import java.util.List;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;

/**
 * <p>Title: WSQuestionService</p> <p>Description: 问题主表webservice服务和hessian服务接口.
 * </p> <p>xbc</p> <p>Copyright (c) 2015</p> @Date 2019-06-22 14:10:54 @author
 * lijia @version v1.0
 */
@WebService(name = "WSQuestionService", targetNamespace = "com.pcloud.question.ws")
public interface WSQuestionService {
	public void addQuestion(@WebParam(name = "question", partName = "partQuestion") Question question)
			throws QuestionException;
	public void deleteQuestion(@WebParam(name = "qId", partName = "partQId") String qId) throws QuestionException;
	public void deleteBatchQuestion(@WebParam(name = "qIds", partName = "partQIds") String... qIds)
			throws QuestionException;
	public void updateQuestion(@WebParam(name = "question", partName = "partQuestion") Question question)
			throws QuestionException;
	public @WebResult(name = "question", partName = "partQuestion") Question getQuestion(
            @WebParam(name = "qId", partName = "partQId") String qId) throws QuestionException;
	public @WebResult(name = "questions", partName = "partQuestions") RListInfo queryListInfoQuestions(
            @WebParam(name = "conditions", partName = "partConditions") QuestionCondition conditions,
            @WebParam(name = "offset", partName = "partOffset") long offset,
            @WebParam(name = "pagesize", partName = "partPagesize") int pagesize) throws QuestionException;
	public @WebResult(name = "questions", partName = "partQuestions") List<Question> queryListQuestions(
            @WebParam(name = "conditions", partName = "partConditions") QuestionCondition conditions)
					throws QuestionException;
}