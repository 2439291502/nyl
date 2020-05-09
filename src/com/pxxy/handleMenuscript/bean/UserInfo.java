package com.pxxy.handleMenuscript.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 客户信息
 * 
 * @author ASUS
 *
 */
public class UserInfo implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String userId;// 用户编号

	private String username;// 用户名

	private String password;// 登录密码

	private String tureName;// 用户姓名

	private String email;// 电子邮箱

	private Integer sex;// 性别

	private Integer profession;// 专业领域

	private String research;// 研究方向

	private Integer postId; // 职称

	private Integer eBackgroundId;// 用户学历编号

	private String workUnit;// 工作单位

	private String address;// 通讯地址

	private String postcode;// 邮编

	private String phone;// 电话号码

	private String telephone;//手机号码

	private Integer applyExpert;// 是否申请为专家 默认为0（否）

	private Date createData;// 注册时间

	private Date updateDate;// 更新日期

	private Integer typeId;// 权限编号

	private Integer state; // 状态（激活）

	private Post post; // 职称编号 User表与Post表 一对一
	private Type type;// 权限编号 User表与Type表 一对一
	private EBackground eBackground;// 用户学历编号 User表与用户学历EducateBackground表 一对一
	public UserInfo() {
		
	}
	public UserInfo(String userId, String username, String password, String tureName, String email, Integer sex,
			Integer profession, String research, Integer postId, Integer eBackgroundId, String workUnit, String address,
			String postcode, String phone, String telephone, Integer applyExpert, Date createData, Date updateDate,
			Integer typeId, Integer state, Post post, Type type, EBackground eBackground) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.tureName = tureName;
		this.email = email;
		this.sex = sex;
		this.profession = profession;
		this.research = research;
		this.postId = postId;
		this.eBackgroundId = eBackgroundId;
		this.workUnit = workUnit;
		this.address = address;
		this.postcode = postcode;
		this.phone = phone;
		this.telephone = telephone;
		this.applyExpert = applyExpert;
		this.createData = createData;
		this.updateDate = updateDate;
		this.typeId = typeId;
		this.state = state;
		this.post = post;
		this.type = type;
		this.eBackground = eBackground;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTureName() {
		return tureName;
	}
	public void setTureName(String tureName) {
		this.tureName = tureName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Integer getProfession() {
		return profession;
	}
	public void setProfession(Integer profession) {
		this.profession = profession;
	}
	public String getResearch() {
		return research;
	}
	public void setResearch(String research) {
		this.research = research;
	}
	public Integer getPostId() {
		return postId;
	}
	public void setPostId(Integer postId) {
		this.postId = postId;
	}
	public Integer geteBackgroundId() {
		return eBackgroundId;
	}
	public void seteBackgroundId(Integer eBackgroundId) {
		this.eBackgroundId = eBackgroundId;
	}
	public String getWorkUnit() {
		return workUnit;
	}
	public void setWorkUnit(String workUnit) {
		this.workUnit = workUnit;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public Integer getApplyExpert() {
		return applyExpert;
	}
	public void setApplyExpert(Integer applyExpert) {
		this.applyExpert = applyExpert;
	}
	public Date getCreateData() {
		return createData;
	}
	public void setCreateData(Date createData) {
		this.createData = createData;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public EBackground geteBackground() {
		return eBackground;
	}
	public void seteBackground(EBackground eBackground) {
		this.eBackground = eBackground;
	}
	@Override
	public String toString() {
		return "UserInfo [userId=" + userId + ", username=" + username + ", password=" + password + ", tureName="
				+ tureName + ", email=" + email + ", sex=" + sex + ", profession=" + profession + ", research="
				+ research + ", postId=" + postId + ", eBackgroundId=" + eBackgroundId + ", workUnit=" + workUnit
				+ ", address=" + address + ", postcode=" + postcode + ", phone=" + phone + ", telephone=" + telephone
				+ ", applyExpert=" + applyExpert + ", createData=" + createData + ", updateDate=" + updateDate
				+ ", typeId=" + typeId + ", state=" + state + ", post=" + post + ", type=" + type + ", eBackground="
				+ eBackground + "]";
	}
	
}