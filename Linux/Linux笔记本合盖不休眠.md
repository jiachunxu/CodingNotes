# Linux笔记本合盖不休眠

``` shell
    vim /etc/systemd/logind.conf 

    HandleLidSwitch=ignore 忽略,常亮
    HandleLidSwitch=lock 息屏,不休眠
    
    #HandlePowerKey按下电源键后的行为，默认power off
    #HandleSleepKey 按下挂起键后的行为，默认suspend
    #HandleHibernateKey按下休眠键后的行为，默认hibernate
    #HandleLidSwitch合上笔记本盖后的行为，默认suspend（改为ignore；即合盖不休眠）在原文件中，还要去掉前面的#
```

``` shell
    重启服务
    service systemd-logind restart
    
    systemctl restart systemd-logind.service 
```

