# ShougongkeDemo （仿“手工客”iOS App）


<img src="http://o76hg1e0m.bkt.clouddn.com/IMG_4480.JPG" height=380 width=640 alt="iOS学习网站、博客" align=center />

># 郑重声明 #
>本项目用于自身学习，以及为找工作做准备。
>如无意间对您有所冒犯，请联系 deyi233@gmail.com
>
>我将尽快删除，谢谢。

>详细说明请点击 <http://zerody.me>

<!-- more -->

# 一、为什么要做一个仿制App
从上家公司离职以来，由于个人原因一直耽误找工作。5月份上旬开始准备找工作时，
打算把自己工作这一段时间以来掌握的东西做一下整理，最好通过完整的项目做一下展示，既展示了自己，又方便用人单位。
但不能拿原公司商业化的东西展示；自己做一个新的 APP，后台编写又会耽误太多时间；所以就萌生仿制一款现有成熟App的想法。

## 为什么是“手工客”
1. 首先，“手工客”相较于微博等客户端，功能专一，界面简洁，复杂程度低，但细节处理又不错，难度适中
2. 其次，个人比较倾向于寻找文化传播、社交分享一类的工作
3. 最后，本人是一个手工爱好者（虽然手艺差点），更符合兴趣爱好，有动力.

# 二、项目说明
## 仿制版本
    截止5月18号最新版本 手工客 V5.7.3

## 开发环境
    Xcode 7.2.1
由于自己比较依赖代码提示，最新的 Xcode 7.3系列 ,大家都知道的代码提示问题，果断装回7.2

## 语言
    Objective-C
Swift 虽然有用过，但还是Objective-C比较熟练

## 运行环境
    iOS8+
时间原因，未做 iOS8以下版本的适配，真机测试5s，其他为模拟器测试

## 完成度
    项目初始目标为未登录状态下所有功能界面

现未开发的功能有：跳转购买，用户主页两大模块，后期将逐步完成

其他页面中存在少数页面细节遗漏，后期逐步优化

# 三、开发说明 

## 1.架构
    采用传统的MVC架构。
项目前期曾考虑ReactiveCocoa的使用，但虽然MVVM模式及ReactiveCocoa也曾有所涉猎，但毕竟不够熟练，所以未予采用

* 在单一样式cell的界面中，使用自定义的dataSource及delegate对 UITableView 及 UICollectionView从 controller 中剥离，进行瘦身。个别 cell 多样结构略复杂的界面，随未做瘦身，但尽量简化 controller 的处理，例如“首页”和“市集”界面
* 数据处理基本放在 model 层完成，个别数据简单的放在 getter 中完成 

## 2.开发方式
    纯代码开发。
在查看“手工客”的安装包时，发现使用的是storyboard及xib文件开发。
考虑到在公司开发中的版本整合中避免不必要的麻烦，个人更倾向于纯代码开发。
当然storyboard及xib个人也是比较熟练的。

## 3.资源
    项目中绝大部分图片资源来自手工客Android端。
在项目初期，从手工客iOS端获取图片资源后，发现大部分图片是没有得到的，所以转而考虑从 Android 端获取，最后实在找不到的，再自己从运行截图上抠(比如下拉刷新的小剪刀)。
    所以，在图片的使用上可能跟原版存在细微差别。

## 4.接口
    使用Charles抓取接口。
考虑到安全问题，捕获接口全部为未登录状态下的接口

## 5.第三方类库
* AFNetworking  -  结合[HYBNetworking](https://github.com/CoderJackyHuang/HYBNetworking)以及自身开发需求经验，对AFNetworking进行简单二次封装
* Masonry   -  从去年学习了Masonry之后就开始放弃了拖拽开发……
* MJExtension - 结合 ESJsonFormat 插件使用， model 的创建效率提升很高。但未对接口数据进行过滤，所以项目中存在部分无用的属性
* MJRefresh - 使用MJRefresh自定义了下拉刷新
* UITableView+FDTemplateLayoutCell - 不得不说这个计算行高，真的超好用
* 自己写的常用的几个：DYBannerView - 滚动条 、 DYMenu - 单级菜单  、DYSegment - 分段选择 略作修改整合到项目中
* 其他的如SDWebImage、MWPhotoBrowser、IQKeyboardManager不做多解释

# 四、问题说明
* 由于接口自己抓取、缺少设计文档、自己的不注意等种种原因，接口中数据的使用可能会不准确，页面布局在其他机型可能不合理，造成项目中经常会出现诸如无法跳转、图片过大、文字越界等问题，后期将逐步优化。
* 另外为了展示首次安装的引导页面，关闭了二次开启跳过此页面的代码。
* 相关命名从为了便于开发，与接口一致，可能有待斟酌

# 五、部分效果展示
* 首页  [首页.gif](http://o76hg1e0m.bkt.clouddn.com/sgk-show01.gif)

* 教程  [教程.gif](http://o76hg1e0m.bkt.clouddn.com/sgk-show02.gif)

* 市集  [市集.gif](http://o76hg1e0m.bkt.clouddn.com/sgk-show04.gif)


[视频地址: http://v.youku.com/v_show/id_XMTU5NjEzMjE3Mg==.html](http://v.youku.com/v_show/id_XMTU5NjEzMjE3Mg==.html)

# 最后
水平不高，能力有限，望多指正。
开发中遇到的问题，代码整理，经验总结等，请移步 [我的博客](http://www.zerody.me)

# 这才是真的最后
放个我的手工作品镇楼
![](http://o76hg1e0m.bkt.clouddn.com/IMG_20140123_113242.jpg)  ![](http://o76hg1e0m.bkt.clouddn.com/IMG_20140123_112739.jpg)
