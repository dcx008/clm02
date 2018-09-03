package cn.tedu.springboot.pojo;

import java.util.Date;

/**
 * Created by BIG on 2017/10/19.
 */
public class ReceiveInfo {
    private String userId;

    private String receiveInfoId;
    private String receiveAddress;
    private String receiver;
    private String receiveTelephone;
    private Date receiveTime;
    private String postCode;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getReceiveInfoId() {
        return receiveInfoId;
    }

    public void setReceiveInfoId(String receiveInfoId) {
        this.receiveInfoId = receiveInfoId;
    }

    public String getReceiveAddress() {
        return receiveAddress;
    }

    public void setReceiveAddress(String receiveAddress) {
        this.receiveAddress = receiveAddress;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getReceiveTelephone() {
        return receiveTelephone;
    }

    public void setReceiveTelephone(String receiveTelephone) {
        this.receiveTelephone = receiveTelephone;
    }

    public Date getReceiveTime() {
        return receiveTime;
    }

    public void setReceiveTime(Date receiveTime) {
        this.receiveTime = receiveTime;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }
}
