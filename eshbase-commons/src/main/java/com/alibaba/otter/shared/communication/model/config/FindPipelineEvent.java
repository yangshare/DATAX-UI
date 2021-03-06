/*
 * Copyright (C) 2010-2101 Alibaba Group Holding Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.alibaba.otter.shared.communication.model.config;

import com.alibaba.otter.shared.communication.core.model.Event;

/**
 * 配置查询的事件
 * 
 * @author jianghang
 * 
 * 改channel未Pipeline
 * 
 * @author Joe.zhang
 */
public class FindPipelineEvent extends Event {

    private static final long serialVersionUID = 476657754177940448L;

    private Long              pipelineId;                            // 对应的pipelineId, 可能为空

    public FindPipelineEvent(){
        super(ConfigEventType.findPipeline);
    }

    public Long getPipelineId() {
        return pipelineId;
    }

    public void setPipelineId(Long pipelineId) {
        this.pipelineId = pipelineId;
    }


}
