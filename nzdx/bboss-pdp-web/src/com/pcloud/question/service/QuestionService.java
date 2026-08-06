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
import java.util.List;

/**
 * <p>Title: QuestionService</p> <p>Description: 问题主表服务接口 </p> <p>xbc</p>
 * <p>Copyright (c) 2015</p> @Date 2019-06-22 14:10:54 @author lijia @version
 * v1.0
 */
public interface QuestionService {
	public void addQuestion(Question question) throws QuestionException;
	public void deleteQuestion(String qId) throws QuestionException;
	public void deleteBatchQuestion(String... qIds) throws QuestionException;
	public void updateQuestion(Question question) throws QuestionException;
	public Question getQuestion(String qId) throws QuestionException;
	public ListInfo queryListInfoQuestions(QuestionCondition conditions, long offset, int pagesize)
			throws QuestionException;
	public List<Question> queryListQuestions(QuestionCondition conditions) throws QuestionException;
	public List<QuestionAnswer> queryListQuestionAnswer(String qId) throws QuestionException;
    void addQuestionAnswer(QuestionAnswer questionAnswer) throws QuestionException;
}