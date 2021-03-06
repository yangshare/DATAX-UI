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

package com.alibaba.otter.shared.common.model.statistics.table;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.alibaba.otter.shared.common.utils.OtterToStringStyle;

import net.iharding.core.orm.IdEntity;

/**
 * @author danping.yudp
 * 
 * 添加hibernate属性
 * 
 * @author Joe.Zhang
 */
@Entity
@Table(name = "stream_stat_table_history")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class TableHistoryStat  extends IdEntity {
    @Column(name = "START_TIME")
    private Date              startTime;
    @Column(name = "END_TIME")
    private Date              endTime;
    @Column(name = "INSERT_COUNT")
    private Long              insertCount;
    @Column(name = "UPDATE_COUNT")
    private Long              updateCount;
    @Column(name = "DELETE_COUNT")
    private Long              deleteCount;
    @Column(name = "DATA_MEDIA_PAIR_ID")
    private Long              dataMediaPairId;
    @Column(name = "PIPELINE_ID")
    private Long              pipelineId;
    @Column(name = "GMT_CREATE")
    private Date gmtCreate;   // 创建时间

    @Column(name = "GMT_MODIFIED")
    private Date gmtModified; // 修改时间



    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

 

    public Long getInsertCount() {
        return insertCount;
    }

    public void setInsertCount(Long insertCount) {
        this.insertCount = insertCount;
    }

    public Long getUpdateCount() {
        return updateCount;
    }

    public void setUpdateCount(Long updateCount) {
        this.updateCount = updateCount;
    }

    public Long getDeleteCount() {
        return deleteCount;
    }

    public void setDeleteCount(Long deleteCount) {
        this.deleteCount = deleteCount;
    }

    public Long getDataMediaPairId() {
        return dataMediaPairId;
    }

    public void setDataMediaPairId(Long dataMediaPairId) {
        this.dataMediaPairId = dataMediaPairId;
    }

    public Long getPipelineId() {
        return pipelineId;
    }

    public void setPipelineId(Long pipelineId) {
        this.pipelineId = pipelineId;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, OtterToStringStyle.DEFAULT_STYLE);
    }
}
