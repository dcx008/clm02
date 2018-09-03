package cn.tedu.springboot.service;

import cn.tedu.springboot.pojo.ReceiveInfo;

import java.util.List;

public interface ReceiveInfoService {
    List<ReceiveInfo> findAllReceiveInfoByUserId(String userId);

    ReceiveInfo findAllReceiveInfoByReceiveInfoId(String receiveInfoId);

    void addUserNewReceiveInfo(ReceiveInfo receiveInfo);

    void updateUserNewReceiveInfo(ReceiveInfo receiveInfo);

    void deleteReceiveInfo(String receiveInfoId);
}
