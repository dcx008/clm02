package cn.tedu.springboot.service;

import cn.tedu.springboot.mapper.ReceiveInfoMapper;
import cn.tedu.springboot.pojo.ReceiveInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReceiveInfoServiceImpl implements ReceiveInfoService{

    @Autowired
    private ReceiveInfoMapper receiveInfoMapper;

    @Override
    public List<ReceiveInfo> findAllReceiveInfoByUserId(String userId) {
        return receiveInfoMapper.findAllReceiveInfoByUserId(userId);
    }

    @Override
    public ReceiveInfo findAllReceiveInfoByReceiveInfoId(String receiveInfoId) {
        return receiveInfoMapper.findAllReceiveInfoByReceiveInfoId(receiveInfoId);
    }

    @Override
    public void addUserNewReceiveInfo(ReceiveInfo receiveInfo) {
        receiveInfoMapper.addReceiveInfo(receiveInfo);
    }

    @Override
    public void updateUserNewReceiveInfo(ReceiveInfo receiveInfo) {
        receiveInfoMapper.updateUserNewReceiveInfo(receiveInfo);
    }

    @Override
    public void deleteReceiveInfo(String receiveInfoId) {
        receiveInfoMapper.deleteReceiveInfo(receiveInfoId);
    }

}
