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

package com.pcloud.modelresource.service;

import com.pcloud.modelresource.entity.*;
import com.frameworkset.util.ListInfo;
import java.util.List;

/**
 * <p>Title: ModelResourceService</p> <p>Description: 模型资源服务接口 </p> <p>bjxbc</p>
 * <p>Copyright (c) 2015</p> @Date 2018-07-26 12:17:13 @author lijia @version
 * v1.0
 */
public interface ModelResourceService {
	public void addModelResource(ModelResource modelResource) throws ModelResourceException;
	public void deleteModelResource(String id) throws ModelResourceException;
	public void deleteBatchModelResource(String... ids) throws ModelResourceException;
	public void updateModelResource(ModelResource modelResource) throws ModelResourceException;
	public ModelResource getModelResource(String id) throws ModelResourceException;

	public ListInfo queryListInfoModelResources(ModelResourceCondition conditions, long offset, int pagesize) throws ModelResourceException;

	public ListInfo queryChildrenListInfoModelResources(ModelResourceCondition conditions, long offset, int pagesize) throws ModelResourceException;

	public List<ModelResource> queryListModelResources(ModelResourceCondition conditions) throws ModelResourceException;

	List<ModelResource> getChildren(ModelResourceCondition conditions) throws ModelResourceException;

    void deleteModelResourceFile(ModelResourceCondition conditions) throws ModelResourceException;

	void updateBatchModelResource(String[] ids, String[] sourceNames, String[] descriptions,String[] timeLengths) throws ModelResourceException;

    void updateNextModelResource(ModelResource modelResource) throws ModelResourceException;

    void updateFrontModelResource(ModelResource modelResource);

    List<ResourceComment> getCommentList(String id);

	void addResourceComment(ResourceComment resourceComment);

	void downCount(String resourceId);

    ResourceComment getCommentInfo(String id, String userName);
}