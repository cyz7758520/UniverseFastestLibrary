# 宇宙最快库
# 必读说明

# 简介
&emsp;&emsp;本软件根据《道德经》为核心思想而设计，完全自主研发，使用大量汇编指令深度优化，在Windows x86/x64、Cygwin x64、Linux x64、Android x86/x64/ArmAt32/ArmA64系统下，实现了以下宇宙最快的功能：  
&emsp;&emsp;* 宇宙最快的内存复制函数memcpy、memmove，绝大部分情况下比系统自带的memcpy、memmove快10%~50%左右。  
&emsp;&emsp;* 宇宙最快的互斥锁MutexLock，绝大部分情况下比系统自带的互斥锁快50%~90%左右，且内存只占用1个字节。  

&emsp;&emsp;**特别注意：在某些特定的CPU和特定的情况下，可能会比系统自带的慢，或者你需要针对某种特定环境达到更快的速度，那就只能找我专门做优化。**  

# 使用
## C/C++语言调用内存复制函数memcpy、memmove
&emsp;&emsp;1、根据需要静态链接UniverseFastestLibrary\UniverseFastestLibrary\UniverseFastestLibrary_MSVC++*.lib或UniverseFastestLibrary\UniverseFastestLibrary\NDK-libs\*\libUniverseFastestLibrary.so，动态库也只能用静态方式链接才能替换系统自带的memcpy、memmove。  
&emsp;&emsp;2、包含UniverseFastestLibrary\UniverseFastestLibrary\UniverseFastestLibrary.h头文件。  
&emsp;&emsp;3、直接调用memcpy、memmove函数即可（memcpy和memmove都支持内存重叠的复制，已有代码无需改动即可自动替换），也可以调用MemCpy，如果确定当前系统支持Avx指令集或Sse2指令集，也可以调用MemCpyAvx或MemCpySse2，通常MemCpyAvx比MemCpySse2快。  
&emsp;&emsp;**4、如果你有能力可以集成到操作系统里，那就可以加速所有的软件。**  

## C/C++语言调用互斥锁MutexLock
&emsp;&emsp;1、根据需要静态链接UniverseFastestLibrary\UniverseFastestLibrary\UniverseFastestLibrary_MSVC++*.lib或UniverseFastestLibrary\UniverseFastestLibrary\NDK-libs\*\libUniverseFastestLibrary.so，动态库可以用静态方式链接或动态方式链接。  
&emsp;&emsp;2、包含UniverseFastestLibrary\UniverseFastestLibrary\UniverseFastestLibrary.h头文件。  
&emsp;&emsp;3、声明互斥锁：MutexLock g_MutexLock = 0;。  
&emsp;&emsp;4、互斥锁加锁：MutexLocked( &g_MutexLock );。  
&emsp;&emsp;5、执行需要多线程互斥的代码。  
&emsp;&emsp;6、互斥锁解锁：MutexUnlock( &g_MutexLock );。  

# 其他
&emsp;&emsp;讨论QQ群：511046632    欢迎大家参与测试和讨论！  
&emsp;&emsp;本人QQ号：280604597    赤勇玄心行天道  
&emsp;&emsp;本人微信：qq280604597    赤勇玄心行天道  
&emsp;&emsp;本人博客：http://www.cnblogs.com/gaoyaguo  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;https://blog.csdn.net/cyz7758520?type=blog  
&emsp;&emsp;源代码：https://github.com/cyz7758520/UniverseFastestLibrary  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;https://gitee.com/chen_yi_ze/UniverseFastestLibrary  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;https://gitcode.com/cyz77585201/UniverseFastestLibrary  

# 捐助
&emsp;&emsp;如果大家觉得好的话，我希望大家能支持我继续研发！  
&emsp;&emsp;![Image text](https://img2023.cnblogs.com/blog/249784/202310/249784-20231019225223266-1469706300.png)
