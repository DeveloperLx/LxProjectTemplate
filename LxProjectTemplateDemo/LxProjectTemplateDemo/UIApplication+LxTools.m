//
//  UIApplication+LxTools.m
//  LxProjectTemplateDemo
//
//  Created by DeveloperLx on 15/12/13.
//  Copyright © 2015年 DeveloperLx. All rights reserved.
//

#import "UIApplication+LxTools.h"
#include <sys/sysctl.h>
#import <mach/mach.h>

@implementation UIApplication (LxTools)

- (BOOL)isBuildInSimulator
{
    static dispatch_once_t one;
    static BOOL isBuildInSimulator = NO;
    dispatch_once(&one, ^{
        
        size_t size;
        sysctlbyname("hw.machine", NULL, &size, NULL, 0);
        char * machine = malloc(size);
        sysctlbyname("hw.machine", machine, &size, NULL, 0);
        NSString * machineName = [NSString stringWithUTF8String:machine];
        free(machine);
        
        if ([machineName isEqualToString:@"x86_64"] || [machineName isEqualToString:@"i386"]) {
            isBuildInSimulator = YES;
        }
    });
    return isBuildInSimulator;
}

- (BOOL)isInstalledFromAppStore
{
    if (self.isBuildInSimulator) {
        return NO;
    }
    
    if (getgid() <= 10) {
        return NO;
    }
    
    if ([[NSBundle mainBundle] objectForInfoDictionaryKey:@"SignerIdentity"]) {
        return NO;
    }
    
    NSFileManager * defaultManager = [NSFileManager defaultManager];
    NSString * bundlePath = [NSBundle mainBundle].bundlePath;
    
    NSString * filePath = [bundlePath stringByAppendingPathComponent:@"_CodeSignature"];
    if ([defaultManager fileExistsAtPath:filePath] == NO) {
        return NO;
    }
    
    filePath = [bundlePath stringByAppendingPathComponent:@"SC_Info"];
    if ([defaultManager fileExistsAtPath:filePath] == NO) {
        return NO;
    }
    
    return YES;
}

- (BOOL)isBeingDebugged
{
    size_t size = sizeof(struct kinfo_proc);
    struct kinfo_proc info;
    int ret = 0, name[4];
    memset(&info, 0, sizeof(struct kinfo_proc));
    
    name[0] = CTL_KERN;
    name[1] = KERN_PROC;
    name[2] = KERN_PROC_PID; name[3] = getpid();
    
    if (ret == sysctl(name, 4, &info, &size, NULL, 0)) {
        return ret != 0;
    }
    return (info.kp_proc.p_flag & P_TRACED) ? YES : NO;
}

- (int64_t)memoryUsage
{
    struct task_basic_info info;
    mach_msg_type_number_t size = sizeof(info);
    kern_return_t kern = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)&info, &size);
    if (kern != KERN_SUCCESS) return -1;
    return (int64_t)info.resident_size;
}

- (float)cpuUsage
{
    kern_return_t kr;
    task_info_data_t tinfo;
    mach_msg_type_number_t task_info_count;
    
    task_info_count = TASK_INFO_MAX;
    kr = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)tinfo, &task_info_count);
    if (kr != KERN_SUCCESS) {
        return -1;
    }
    
    thread_array_t thread_list;
    mach_msg_type_number_t thread_count;
    
    thread_info_data_t thinfo;
    mach_msg_type_number_t thread_info_count;
    
    thread_basic_info_t basic_info_th;
    
    kr = task_threads(mach_task_self(), &thread_list, &thread_count);
    if (kr != KERN_SUCCESS) {
        return -1;
    }
    
    long tot_sec = 0;
    long tot_usec = 0;
    float total_cpu = 0;
    int j;
    
    for (j = 0; j < thread_count; j++) {
        thread_info_count = THREAD_INFO_MAX;
        kr = thread_info(thread_list[j], THREAD_BASIC_INFO,
                         (thread_info_t)thinfo, &thread_info_count);
        if (kr != KERN_SUCCESS) {
            return -1;
        }
        
        basic_info_th = (thread_basic_info_t)thinfo;
        
        if (!(basic_info_th->flags & TH_FLAGS_IDLE)) {
            tot_sec = tot_sec + basic_info_th->user_time.seconds + basic_info_th->system_time.seconds;
            tot_usec = tot_usec + basic_info_th->system_time.microseconds + basic_info_th->system_time.microseconds;
            total_cpu = total_cpu + basic_info_th->cpu_usage / (float)TH_USAGE_SCALE;
        }
    }
    
    kr = vm_deallocate(mach_task_self(), (vm_offset_t)thread_list, thread_count * sizeof(thread_t));
    assert(kr == KERN_SUCCESS);
    
    return total_cpu;
}

@end
