//
//  main.m
//  NSByteCountFormatter_tests
//
//  Created by Gregory John Casamento on 7/3/19.
//  Copyright © 2019 Gregory John Casamento. All rights reserved.
//

#import <Foundation/Foundation.h>

void passTest(BOOL flag,
              NSString *msg)
{
    if(flag == YES)
    {
        NSLog(@"PASS: %@",msg);
    }
    else
    {
        NSLog(@"FAIL: %@",msg);
    }
}

/*
 NSByteCountFormatterCountStyleFile
 Specifies display of file byte counts. The actual behavior for this is platform-specific; in macOS 10.8, this uses the decimal style, but that may change over time.
 
 NSByteCountFormatterCountStyleMemory
 Specifies display of memory byte counts. The actual behavior for this is platform-specific; in macOS 10.8, this uses the binary style, but that may change over time.
 
 NSByteCountFormatterCountStyleDecimal
 Causes 1000 bytes to be shown as 1 KB. It is better to use
 NSByteCountFormatterCountStyleFile
 or
 NSByteCountFormatterCountStyleMemory
 in most cases.
 
 NSByteCountFormatterCountStyleBinary
 Causes 1024 bytes to be shown as 1 KB. It is better to use
 NSByteCountFormatterCountStyleFile
 or
 NSByteCountFormatterCountStyleMemory
 in most cases.
 */
void runTests()
{
    NSString *output = [NSByteCountFormatter stringFromByteCount:1024 * 1024
                                                      countStyle:NSByteCountFormatterCountStyleFile];
    NSLog(@"%@",output);
    passTest([output isEqualToString: @"1 MB"], @"NSByteCountFormatterCountStyleFile works");

    output = [NSByteCountFormatter stringFromByteCount:1024 + 512
                                            countStyle:NSByteCountFormatterCountStyleFile];
    NSLog(@"%@",output);
    passTest([output isEqualToString: @"2 KB"], @"NSByteCountFormatterCountStyleFile works");

    output = [NSByteCountFormatter stringFromByteCount:1024 * 1024
                                            countStyle:NSByteCountFormatterCountStyleMemory];
    NSLog(@"%@",output);
    passTest([output isEqualToString: @"1 MB"], @"NSByteCountFormatterCountStyleMemory works");

    output = [NSByteCountFormatter stringFromByteCount:1024 * 1024
                                            countStyle:NSByteCountFormatterCountStyleDecimal];
    NSLog(@"%@",output);
    passTest([output isEqualToString: @"1 MB"], @"NSByteCountFormatterCountStyleDecimal works");

    output = [NSByteCountFormatter stringFromByteCount:1024 * 1024
                                            countStyle:NSByteCountFormatterCountStyleBinary];
    NSLog(@"%@",output);
    passTest([output isEqualToString: @"1 MB"], @"NSByteCountFormatterCountStyleBinary works");
    
    NSByteCountFormatter *formatter = [[NSByteCountFormatter alloc] init];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:formatter];
    BOOL flag = [data writeToFile:@"output.data" atomically:YES];
    if (!flag)
    {
        NSLog(@"Error writing");
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        runTests();
    }
    return 0;
}
