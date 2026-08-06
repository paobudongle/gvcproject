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

/**
 * <p>Title: QuestionException</p> <p>Description: 问题主表异常处理类 </p> <p>xbc</p>
 * <p>Copyright (c) 2007</p> @Date 2019-06-22 14:10:54 @author lijia @version
 * v1.0
 */
public class QuestionException extends RuntimeException {

	public QuestionException() {
		super();
	}
	public QuestionException(String message, Throwable cause) {
		super(message, cause);
	}

	public QuestionException(String message) {
		super(message);
	}

	public QuestionException(Throwable cause) {
		super(cause);
	}

}