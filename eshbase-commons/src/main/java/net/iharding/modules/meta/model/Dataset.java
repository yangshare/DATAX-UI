package net.iharding.modules.meta.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import net.iharding.core.orm.IdEntity;

import org.guess.sys.model.User;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 表对象Entity
 * 
 * @author Joe.zhang
 * @version 2015-12-01
 */
@Entity
@Table(name = "meta_dataset")
@JsonIgnoreProperties(value = { "columns","modules","dbIndexs"})
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Dataset extends IdEntity {

	/**
	 * 数据源ID
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "db_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@JsonIgnoreProperties(value = { "creater","updater","tables"})
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Database database;
	/**
	 * 类名
	 */
	@Column(name = "class_name")
	private String className;
	/**
	 * 表名
	 */
	@Column(name = "dataset_name")
	private String datasetName;
	
	@Column(name = "name_space")
	private String nameSpace;
	
	/**
	 * 逻辑名
	 */
	@Column(name = "dataset_pname")
	private String datasetPname;
	/**
	 * 表类别
	 */
	@Column(name = "dataset_type")
	private Integer datasetType;
	/**
	 * 备注
	 */
	private String remark;
	@Column(name = "column_count")
	private Integer columnCount;
	@Column(name = "row_count")
	private Long rowCount;
	@Column(name = "sample_rows")
	private String sampleRows;
	//数据模型id,数据模型类别的需要建立id
	@Column(name = "datamodel_id")
	private Long datamodelId;
	
	
	/**
	 * 最后更新人
	 */
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = User.class,fetch = FetchType.LAZY)
	@JoinColumn(name="updateby_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private User updater;
	/**
	 * 建立人
	 */
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.MERGE },targetEntity = User.class,fetch = FetchType.LAZY)
	@JoinColumn(name="createby_id")
	@NotFound(action = NotFoundAction.IGNORE)
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private User creater;
	/**
	 * 最后更新时间
	 */
	@Column(name = "update_date")
	private Date updateDate;
	/**
	 * 建立时间
	 */
	@Column(name = "create_date")
	private Date createDate;

	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE }, targetEntity = Module.class)
	@JoinTable(name = "meta_module_table", joinColumns = { @JoinColumn(name = "table_id") }, inverseJoinColumns = { @JoinColumn(name = "module_id") })
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Set<Module> modules = new HashSet<Module>(0);

	@OneToMany(targetEntity = DbColumn.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL,mappedBy="dbtable")
	@OrderBy("id ASC")
	private Set<DbColumn> columns;
	
	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.MERGE }, targetEntity = DBIndex.class)
	@JoinTable(name = "meta_table_index", joinColumns = { @JoinColumn(name = "table_id") }, inverseJoinColumns = { @JoinColumn(name = "index_id") })
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	private Set<DBIndex> dbIndexs;

	@Column(name="check_label")
	private Integer checkLabel;
	
	
	public Integer getColumnCount() {
		return columnCount;
	}

	public void setColumnCount(Integer columnCount) {
		this.columnCount = columnCount;
	}

	public Long getRowCount() {
		return rowCount;
	}

	public void setRowCount(Long rowCount) {
		this.rowCount = rowCount;
	}

	public String getNameSpace() {
        return nameSpace;
    }

    public void setNameSpace(String nameSpace) {
        this.nameSpace = nameSpace;
    }

    public String getSampleRows() {
		return sampleRows;
	}

	public void setSampleRows(String sampleRows) {
		this.sampleRows = sampleRows;
	}

	public Integer getCheckLabel() {
		return checkLabel;
	}

	public void setCheckLabel(Integer checkLabel) {
		this.checkLabel = checkLabel;
	}
	
	public DBIndex getDBIndex(int indexType){
		if (dbIndexs!=null && dbIndexs.size()>0){
			for(DBIndex index:dbIndexs){
				if (index.getIndexType()==indexType){
					return index;
				}
			}
		}
		return null;
	}

	public Long getDatamodelId() {
		return datamodelId;
	}

	public void setDatamodelId(Long datamodelId) {
		this.datamodelId = datamodelId;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public Set<DBIndex> getDbIndexs() {
		return dbIndexs;
	}

	public void setDbIndexs(Set<DBIndex> dbIndexs) {
		this.dbIndexs = dbIndexs;
	}

	public Set<DbColumn> getColumns() {
		return columns;
	}

	public void setColumns(Set<DbColumn> columns) {
		this.columns = columns;
	}
	
	public Database getDatabase() {
		return database;
	}

	public void setDatabase(Database database) {
		this.database = database;
	}

	public Set<Module> getModules() {
		return modules;
	}

	public void setModules(Set<Module> modules) {
		this.modules = modules;
	}



	public Integer getTableType() {
		return datasetType;
	}

	public void setTableType(Integer tableType) {
		this.datasetType = tableType;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	

	public User getUpdater() {
		return updater;
	}

	public void setUpdater(User updater) {
		this.updater = updater;
	}

	public User getCreater() {
		return creater;
	}

	public void setCreater(User creater) {
		this.creater = creater;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	

	public String getDatasetName() {
		return datasetName;
	}

	public void setDatasetName(String datasetName) {
		this.datasetName = datasetName;
	}

	public String getDatasetPname() {
		return datasetPname;
	}

	public void setDatasetPname(String datasetPname) {
		this.datasetPname = datasetPname;
	}

	public Integer getDatasetType() {
		return datasetType;
	}

	public void setDatasetType(Integer datasetType) {
		this.datasetType = datasetType;
	}

	public void addColumn(DbColumn col) {
		if (columns == null) {
			columns = new HashSet<DbColumn>();
		}
		columns.add(col);
	}

	public DbColumn getDbColumn(String columnName) {
		if (columns!=null){
			for(DbColumn column:columns){
				if (column.getColumnName().equalsIgnoreCase(columnName)){
					return column;
				}
			}
		}
		return null;
	}
	
	
	
	public DbColumn getNewDbColumn(String columnName) {
		if (columns!=null){
			for(DbColumn column:columns){
				if (column.getColumnName().equalsIgnoreCase(columnName)){
					return column;
				}
			}
		}
		return new DbColumn();
	}

	@Override  
    public boolean equals(Object obj) {  
        if(obj == null) return false;  
        if(this == obj) return true;  
        if(obj instanceof Dataset){   
        	Dataset dbtable =(Dataset)obj;  
            if( dbtable.getDatasetName().equals(this.datasetName)) return true;  
        }  
        return false;  
    }  
  
  
  
    /** 
     * 重写hashcode 方法，返回的hashCode 不一样才认定为不同的对象 
     */  
    @Override  
    public int hashCode() {  
        return datasetName.hashCode();  
    }  

}