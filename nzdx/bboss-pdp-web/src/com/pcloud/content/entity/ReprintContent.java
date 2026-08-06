package com.pcloud.content.entity;

import java.util.Date;

public class ReprintContent  implements java.io.Serializable{
    private String crawlId;
    private String contentId;
    private String crawlTitle;
    private Date crawlTime;
    private String websiteName;
    private String channelName;
    private String releaseDate;
    private String crawlcontent;

    public String getCrawlcontent() {
        return crawlcontent;
    }

    public void setCrawlcontent(String crawlcontent) {
        this.crawlcontent = crawlcontent;
    }

    public String getCrawlId() {
        return crawlId;
    }

    public void setCrawlId(String crawlId) {
        this.crawlId = crawlId;
    }

    public String getContentId() {
        return contentId;
    }

    public void setContentId(String contentId) {
        this.contentId = contentId;
    }

    public String getCrawlTitle() {
        return crawlTitle;
    }

    public void setCrawlTitle(String crawlTitle) {
        this.crawlTitle = crawlTitle;
    }

    public Date getCrawlTime() {
        return crawlTime;
    }

    public void setCrawlTime(Date crawlTime) {
        this.crawlTime = crawlTime;
    }

    public String getWebsiteName() {
        return websiteName;
    }

    public void setWebsiteName(String websiteName) {
        this.websiteName = websiteName;
    }

    public String getChannelName() {
        return channelName;
    }

    public void setChannelName(String channelName) {
        this.channelName = channelName;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }
}
