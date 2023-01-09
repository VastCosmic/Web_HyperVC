# Web_HyperVC

## Intro
This is the OUCSE Project_HyperVC's web of 18Group.

------

[TOC]



## Info

### Environment
| **IDE**           | **Visual Studio 2022, VSCode 2022**   |
| ----------------- | ------------------------------------- |
| **Web Framework** | **ASP.NET WEB(.NET Framework 4.7.2)** |
| **Main Language** | **C#, Python, JSP, HTML**             |
| **Other**         | **Anaconda3, Pytorch**                |

## Now:	Version_1.6

1. 全新的UI设计，更美观的界面
2. 现在用户可以上传 IndianPines、Salinas、PaviaU 的高光谱图像，由web发送请求，后端响应并输出分类结果与信息，最终显示在web上。
3. 现在用户可以发送反馈意见到COS云端上。
4. 现在支持的数据集：IndianPines、Salinas、PaviaU.


# 部署文档（Windows）

## 环境与项目文件准备 -- Web端(IIS--ASP.NET MVC)

### 下载项目文件

> git clone https://github.com/VastCosmic/Web_HyperVC.git

### 安装IIS相关服务

在 **Windows控制面板-程序与功能-启用或关闭Windows功能** 中勾选 **IIS、.NET** 相关功能模块，点击确定并等待系统安装启用功能完成。

<img src="https://vc-image-1313154504.cos.ap-shanghai.myqcloud.com/image/202301091027278.png" alt="image-20230109102721217" style="zoom: 80%;" />

### 接入腾讯云对象存储COS

#### 创建存储桶

注：该部分会产生腾讯云费用，请自行斟酌

注册腾讯云账号，在对象存储服务中**新建一个存储桶**，选择地域，填写名称等。

存储桶访问权限设置为**共有读私有写**。

其他设置按需设置，详情请查看腾讯云COS帮助文档。

[对象存储 创建存储桶-控制台指南-文档中心-腾讯云 (tencent.com)](https://cloud.tencent.com/document/product/436/13309)



#### 获取密钥等其他信息并填写配置文件

获取 **腾讯云密钥、腾讯云账户的账户标识APPID、存储桶名称、存储桶地域**，

打开项目文件根目录下的 **HyperVC_Setting.yaml**，填写对应配置文件信息。

相关帮助请查看腾讯云帮助文档。

[访问密钥 - 控制台 (tencent.com)](https://console.cloud.tencent.com/cam/capi)

[存储桶列表 - 对象存储 - 控制台 (tencent.com)](https://console.cloud.tencent.com/cos/bucket)

![image-20230109143617202](https://vc-image-1313154504.cos.ap-shanghai.myqcloud.com/image/202301091436253.png)

![](https://vc-image-1313154504.cos.ap-shanghai.myqcloud.com/image/202301091441680.png)

![image-20230109144219392](https://vc-image-1313154504.cos.ap-shanghai.myqcloud.com/image/202301091442431.png)

### 部署Web网站

打开**IIS管理器**，并右键后点击**添加网站**。

随意输入一个网站名称，选择**物理路径**到刚才下载的**项目文件根目录**。

**修改端口**，建议为5000~9999之间，点击确定。(若有https或域名需求可另外自行配置)

随后即可使用 **localhost:端口名** 访问网站。

<img src="https://vc-image-1313154504.cos.ap-shanghai.myqcloud.com/image/202301091152263.png" alt="image-20230109115227164" style="zoom: 33%;" />

![](https://vc-image-1313154504.cos.ap-shanghai.myqcloud.com/image/202301091154372.png)

<img src="https://vc-image-1313154504.cos.ap-shanghai.myqcloud.com/image/202301091158366.png" alt="image-20230109115808304" style="zoom:67%;" />

## 环境与项目文件准备 -- Python

### 安装Python3.10以及pip

相关方法比较简单请自行查找。

### 安装项目所需环境

打开项目目录下的HyperVC_py文件夹，找到requirements.txt文件，并使用pip安装对应依赖。

```
pip3 install -r requirements.txt
```



## 附录

### 错误排查--没有写访问权限

如果出现错误 *当前标识(IIS APPPOOL\132)没有对“C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files”的写访问权限。* 请按照如下设置：

#### 添加IIS用户组

在 **属性-安全-编辑-添加** 中新增IIS用户组，一般命名为IIS_IUSRS，并勾选完全控制权限点击确定。

![](https://vc-image-1313154504.cos.ap-shanghai.myqcloud.com/image/202301091034758.png)

#### 注册权限

使用 **管理员身份打开cmd** ，输入以下内容，其中 **server\user** 为刚刚添加的用户组的名称。

```
C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Aspnet_regiis.exe -ga server\user
```

![image-20230109104217432](https://vc-image-1313154504.cos.ap-shanghai.myqcloud.com/image/202301091042476.png)



## Version History

| Ver 1.6   | 新增部署文档<br/>新增yaml配置文件用以自定义配置COS<br/>修改了项目的路径读取逻辑 |
| --------- | ------------------------------------------------------------ |
| Ver 1.5.1 | 更换了全新的UI，新增了反馈意见上传至COS云。                  |
| Ver 1.4   | 完成了三个数据集的训练和适配                                 |
| Ver 1.3   | 修复了计时器与COS请求的timer冲突，修改了存储逻辑             |
| Ver 1.2   | 优化了前后端调用的接口和逻辑                                 |
| Ver 1.1   | 优化了大量的应用逻辑与数据存取，优化了一些对于腾讯云COS的API的调用的逻辑，修复了一些前端无响应的bug。 |
| Ver 1.0.1 | 新增了间隔查询请求。                                         |
| Ver 1.0   | 引入了腾讯云COS，分类结果将储存在COS云端。                   |
| Ver 0.1   | 完成了基本的Web UI设计，完成了mat图像上载功能。              |


