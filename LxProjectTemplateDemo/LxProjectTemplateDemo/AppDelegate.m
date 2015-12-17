//
//  AppDelegate.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/6.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "AppDelegate.h"
#import "LxPushManager.h"
#import "LxDataBaseManager.h"
#import "LxAccountManager.h"
#import <AFNetworking/AFNetworkReachabilityManager.h>
#import <Toast/UIView+Toast.h>


@interface AppDelegate ()
{
    UIBackgroundTaskIdentifier _backgroundTaskIdentifier;
}
@property (nonatomic,assign) BOOL isFirstRunForCurrentAppVersion;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    @weakify(self);
    
    //  if first run this version
    
    if (self.isFirstRunForCurrentAppVersion) {
        
        //  do things only when first run
        
        [LxDataBaseManager createTablesAndIndexesIfNotExists];
        [LxDataBaseManager checkAndUpdateDataBaseVersion];
        
        self.isFirstRunForCurrentAppVersion = NO;
    }

    //  push
    
    if ([LxPushManager isPushOn] == NO) {
        [LxPushManager setupWithLaunchOptions:launchOptions];
        [LxPushManager registerRemotePush];
    }
    
    //  observe network and prompt
    
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        @strongify(self);
        
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {

            }
                break;
            default:
            {
                [self.window makeToast:TOAST_NETWORK_BROKEN];
            }
                break;
        }
    }];
    
    // display scene
    
    if ([[NSUserDefaults standardUserDefaults]boolForKey:kNeedAutoLogin]) {
        
    }
    else {
    
    }
    
    [[[NSNotificationCenter defaultCenter]rac_addObserverForName:LoginSuccessNotification object:nil]subscribeNext:^(NSNotification * notification) {
       
        //  window.rootViewController 切换 登录vc 至 home vc
    }];
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {

    [self saveContext];
}

#pragma mark - getter setter

- (NSString *)everLaunchedForCurrentAppVersionKey
{
    return [NSString stringWithFormat:@"%@ version ever launched", BUNDLE_SHORT_VERSION_STRING];
}

- (BOOL)isFirstRunForCurrentAppVersion
{
    return [[NSUserDefaults standardUserDefaults]boolForKey:[self everLaunchedForCurrentAppVersionKey]];
}

- (void)setIsFirstRunForCurrentAppVersion:(BOOL)isFirstRunForCurrentAppVersion
{
    [[NSUserDefaults standardUserDefaults]setBool:isFirstRunForCurrentAppVersion forKey:[self everLaunchedForCurrentAppVersionKey]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - Remote Push stack

#pragma mark - local Push stack

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.etiantian.LxProjectTemplateDemo" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"LxProjectTemplateDemo" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"LxProjectTemplateDemo.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
