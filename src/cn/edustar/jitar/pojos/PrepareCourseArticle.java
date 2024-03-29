package cn.edustar.jitar.pojos;

import java.util.Date;

/**
 * CPrepareCourseArticle generated by MyEclipse Persistence Tools
 */

public class PrepareCourseArticle implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -6524428055729711174L;
	private Integer prepareCourseArticleId;
	private Integer articleId;
	private Integer prepareCourseStageId;
	private Integer prepareCourseId;
	private Integer userId;
	private Date createDate;
	private String title;
	private boolean articleState = true;
	private boolean typeState = false;
	// Constructors

	/** default constructor */
	public PrepareCourseArticle() {
	}

	/** full constructor */
	public PrepareCourseArticle(Integer articleId,
			Integer prepareCourseStageId, Integer prepareCourseId, Integer userId,
			Date createDate, String title) {
		this.articleId = articleId;
		this.prepareCourseStageId = prepareCourseStageId;
		this.prepareCourseId = prepareCourseId;
		this.userId = userId;
		this.createDate = createDate;
		this.title = title;
	}

	// Property accessors

	public Integer getPrepareCourseArticleId() {
		return this.prepareCourseArticleId;
	}

	public void setPrepareCourseArticleId(Integer prepareCourseArticleId) {
		this.prepareCourseArticleId = prepareCourseArticleId;
	}

	public Integer getArticleId() {
		return this.articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}

	public Integer getPrepareCourseStageId() {
		return this.prepareCourseStageId;
	}

	public void setPrepareCourseStageId(Integer prepareCourseStageId) {
		this.prepareCourseStageId = prepareCourseStageId;
	}

	public Integer getPrepareCourseId() {
		return this.prepareCourseId;
	}

	public void setPrepareCourseId(Integer prepareCourseId) {
		this.prepareCourseId = prepareCourseId;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public boolean isArticleState() {
		return articleState;
	}

	public void setArticleState(boolean articleState) {
		this.articleState = articleState;
	}

	public boolean getTypeState() {
		return typeState;
	}

	public void setTypeState(boolean typeState) {
		this.typeState = typeState;
	}

}