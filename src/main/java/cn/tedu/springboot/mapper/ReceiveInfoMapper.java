package cn.tedu.springboot.mapper;

import cn.tedu.springboot.pojo.ReceiveInfo;

import java.util.List;

/**
 * Created by BIG on 2017/10/20.
 */
public interface ReceiveInfoMapper {
    void addReceiveInfo(ReceiveInfo receiveInfo);

    List<ReceiveInfo> findAllReceiveInfoByUserId(String userId);

    ReceiveInfo findAllReceiveInfoByReceiveInfoId(String receiveInfoId);

    void updateUserNewReceiveInfo(ReceiveInfo receiveInfo);

    void deleteReceiveInfo(String receiveInfoId);
}
