//
//  DYNetworking.h
//  TestProject
//
//  Created by 周德艺 on 16/5/21.
//  Copyright © 2016年 周德艺. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifdef DEBUG
#define DYNetworkingLog(s, ... ) NSLog( @"[%@ in line %d] ===============>%@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DYNetworkingLog(s, ... )
#endif

/**
 *  请求数据类型
 */
typedef NS_ENUM(NSUInteger, DYRequestType) {
    kDYRequestTypeJSON = 1, //    default  
    kDYRequestTypePlainText  = 2 // text/html
};

/**
 *  响应数据类型
 */
typedef NS_ENUM(NSUInteger, DYResponseType) {
    kDYResponseTypeJSON = 1, //    default  
    kDYResponseTypeXML  = 2,
    kDYResponseTypeData = 3
};

/**
 *  网络状态
 */
typedef NS_ENUM(NSInteger, DYNetworkStatus) {
    kDYNetworkStatusUnknown          = -1,//未知网络
    kDYNetworkStatusNotReachable     = 0,//网络无连接
    kDYNetworkStatusReachableViaWWAN = 1,//2，3，4G网络
    kDYNetworkStatusReachableViaWiFi = 2,//WIFI网络
};

/**
 *	下载
 *
 *	@param bytesRead		已下载
 *	@param totalBytesRead	总
 */
typedef void (^DYDownloadProgressBlock)(int64_t bytesRead,
                                    int64_t totalBytesRead);
typedef DYDownloadProgressBlock DYGetProgressBlock;
typedef DYDownloadProgressBlock DYPostProgressBlock;

/**
 *	上传
 *
 *	@param bytesWritten			已
 *	@param totalBytesWritten	总
 */
typedef void (^DYUploadProgressBlock)(int64_t bytesWritten,
                                  int64_t totalBytesWritten);


@class NSURLSessionTask;
// 使用基类NSURLSessionTask，
typedef NSURLSessionTask DYURLSessionTask;
typedef void(^DYResponseSuccess)(id response);
typedef void(^DYResponseFail)(NSError *error);


@interface DYNetworking : NSObject

/**
 *  开启或关闭接口打印信息
 *
 *  @param isDebug  default NO
 */
+ (void)enableInterfaceDebug:(BOOL)isDebug;


/**
 *	设置基础接口地址
 */
+ (void)updateBaseUrl:(NSString *)baseUrl;
+ (NSString *)baseUrl;

/**
 *	请求超时时间
 *
 *	@param timeout	   default  30
 */
+ (void)setTimeout:(NSTimeInterval)timeout;


#pragma mark - 缓存
/**
 *  开启缓存
 *
 *	@param isCacheGet	   default  YES
 *	@param isCachePost	   default  NO
 */
+ (void)cacheGetRequest:(BOOL)isCacheGet shoulCachePost:(BOOL)isCachePost;

/**
 *	当检查到网络异常时，是否从缓存提取数据。
 *
 *	@param isObtain	   default  NO
 */
+ (void)obtainDataFromLocalWhenNetworkAnomaly:(BOOL)isObtain;


/**
 *	获取缓存总大小/bytes
 */
+ (unsigned long long)totalCacheSize;

/**
 *	清除缓存
 */
+ (void)clearCaches;

#pragma mark - 请求配置
/**
 *  配置全局请求头
 *
 *  @param httpHeaders 参数
 */
+ (void)configCommonHttpHeaders:(NSDictionary *)httpHeaders;

/**
 *  配置请求格式
 *
 *  @param requestType 请求格式，   default  JSON
 *  @param responseType 响应格式，   default  JSON，
 *  @param shouldAutoEncode YES or NO,   default  NO，是否自动encode url
 *  @param shouldCallbackOnCancelRequest 当取消请求时，是否要回调，   default  YES
 */
+ (void)configRequestType:(DYRequestType)requestType
             responseType:(DYResponseType)responseType
      shouldAutoEncodeUrl:(BOOL)shouldAutoEncode
  callbackOnCancelRequest:(BOOL)shouldCallbackOnCancelRequest;

/**
 *	取消某个请求。
 *	@param url		URL，可不包括baseurl
 */
+ (void)cancelRequestWithURL:(NSString *)url;

/**
 *	取消所有请求
 */
+ (void)cancelAllRequest;


#pragma mark - 请求
/**
 *  GET请求接口，若不指定baseurl，可传完整的url
 *
 *  @param url     接口地址（名）
 *  @param refreshCache 是否刷新缓存。由于请求成功也可能没有数据，对于业务失败，只能通过人为手动判断
 *  @param params  参数，可空
 *  @param success 成功
 *  @param fail    失败
 *
 *  @return 返回的对象中有可取消请求的API
 */
+ (DYURLSessionTask *)getWithUrl:(NSString *)url
                     refreshCache:(BOOL)refreshCache
                          success:(DYResponseSuccess)success
                             fail:(DYResponseFail)fail;
// 带params参数
+ (DYURLSessionTask *)getWithUrl:(NSString *)url
                     refreshCache:(BOOL)refreshCache
                           params:(NSDictionary *)params
                          success:(DYResponseSuccess)success
                             fail:(DYResponseFail)fail;
// 带进度回调
+ (DYURLSessionTask *)getWithUrl:(NSString *)url
                     refreshCache:(BOOL)refreshCache
                           params:(NSDictionary *)params
                         progress:(DYGetProgressBlock)progress
                          success:(DYResponseSuccess)success
                             fail:(DYResponseFail)fail;

/**
 *  POST请求接口
 *
 *  @param url     地址/名
 *  @param params  参数
 *  @param success 成功
 *  @param fail    失败
 *
 *  @return 返回的对象中有可取消请求的API
 */
+ (DYURLSessionTask *)postWithUrl:(NSString *)url
                      refreshCache:(BOOL)refreshCache
                            params:(NSDictionary *)params
                           success:(DYResponseSuccess)success
                              fail:(DYResponseFail)fail;
+ (DYURLSessionTask *)postWithUrl:(NSString *)url
                      refreshCache:(BOOL)refreshCache
                            params:(NSDictionary *)params
                          progress:(DYPostProgressBlock)progress
                           success:(DYResponseSuccess)success
                              fail:(DYResponseFail)fail;


/**
 *	图片上传接口，若不指定baseurl，可传完整的url
 *
 *	@param image			对象
 *	@param url				上传图片的接口路径，如/path/images/
 *	@param filename		给图片起一个名字，   default  当前日期时间,格式为"yyyyMMddHHmmss"，后缀为`jpg`
 *	@param name				与指定的图片相关联的名称，这是由后端写接口的人指定的，如imagefiles
 *	@param mimeType		   default  image/jpeg
 *	@param parameters	参数
 *	@param progress		上传进度
 *	@param success		上传成功回调
 *	@param fail				上传失败回调
 *
 *	@return 返回的对象中有可取消请求的API
 */
+ (DYURLSessionTask *)uploadWithImage:(UIImage *)image
                                   url:(NSString *)url
                              filename:(NSString *)filename
                                  name:(NSString *)name
                              mimeType:(NSString *)mimeType
                            parameters:(NSDictionary *)parameters
                              progress:(DYUploadProgressBlock)progress
                               success:(DYResponseSuccess)success
                                  fail:(DYResponseFail)fail;


/**
 *	上传文件
 *
 *	@param url				上传路径
 *	@param uploadingFile	本地路径
 *	@param progress			进度
 *	@param success		    成功回调
 *	@param fail				失败回调
 *
 *	@return
 */
+ (DYURLSessionTask *)uploadFileWithUrl:(NSString *)url
                           uploadingFile:(NSString *)uploadingFile
                                progress:(DYUploadProgressBlock)progress
                                 success:(DYResponseSuccess)success
                                    fail:(DYResponseFail)fail;


/**
 *  下载文件
 *
 *  @param url           下载URL
 *  @param saveToPath    保存路径
 *  @param progressBlock 进度
 *  @param success       成功
 *  @param failure       失败
 */
+ (DYURLSessionTask *)downloadWithUrl:(NSString *)url
                            saveToPath:(NSString *)saveToPath
                              progress:(DYDownloadProgressBlock)progressBlock
                               success:(DYResponseSuccess)success
                               failure:(DYResponseFail)failure;

@end
