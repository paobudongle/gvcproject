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

package com.pcloud.modeljz.service;

/**
 * <p>Title: JzMainException</p> <p>Description: 模型数据加总异常处理类 </p> <p>北京信碧诚</p>
 * <p>Copyright (c) 2007</p> @Date 2018-03-25 00:24:45 @author liuwu @version
 * v1.0
 */
public class JzMainException extends RuntimeException {

	public JzMainException() {
		super();
	}
	public JzMainException(String message, Throwable cause) {
		super(message, cause);
	}

	public JzMainException(String message) {
		super(message);
	}

	public JzMainException(Throwable cause) {
		super(cause);
	}

}