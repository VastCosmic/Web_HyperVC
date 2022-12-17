# Web_HyperVC
## Intro
This is the OUCSE Project_HyperVC's web of 18Group.
## Info

### Environment
| **IDE**           | **Visual Studio 2022**                |
| ----------------- | ------------------------------------- |
| **Web Framework** | **ASP.NET WEB(.NET Framework 4.7.2)** |
| **Main Language** | **C#, Python**                        |
| **Other**         | **Anaconda3, Pytorch**                |

## Now:	Version_1.1

1. 现在用户可以上传 Indian Pines 的高光谱图像，由web发送请求，后端响应并输出分类结果与信息，最终显示在web上。
2. 现在用户可以发送反馈意见到服务器上。
3. 现在支持的数据集：Indian_pine

## Version History

### Ver	1.1

优化了大量的应用逻辑与数据存取，优化了一些对于腾讯云COS的API的调用的逻辑，修复了一些前端无响应的bug。

整合前后端到同一个解决方案中，但依旧是分离状态，

### Ver	1.0.1

新增了间隔查询请求。

### Ver	1.0

引入了腾讯云COS，分类结果将储存在COS云端。

### Ver	0.1

完成了基本的Web UI设计，完成了mat图像上载功能。