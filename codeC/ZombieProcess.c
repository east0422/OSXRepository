#include <stdio.h>
#include <unistd.h>

int main (int argc, char **argv) {
  // getpid获取当前进程的进程ID
  printf("start----------pid is %d\n", getpid());
  int childCount = 0;
  // fork函数通过系统调用创建一个与原来进程几乎完全相同的进程，也就是两个进程可以做完全相同的事，但如果初始参数或者传入的变量不同，两个进程也可以做不同的事
  // 一个进程调用fork函数后，系统先给新的进程分配资源，例如存储数据和代码的空间。然后把原来的进程的所有值都复制到新的新进程中，只有少数值与原来的进程的值不同
  // 若成功调用一次则返回两个值，子进程返回0，父进程返回子进程ID；否则，出错返回-1
  // 在fork前只有一个进程在执行这段代码，fork之后就变成两个进程在执行了
  pid_t fpid = fork();
  printf("fork-----------pid is %d\n", getpid());
  switch (fpid) {
    case -1:
      printf("error in fork!\n");
      return 1;
    case 0:
      printf("I am the child process born and pid is %d\n", getpid());
      childCount++;
      break;
    default:
      printf("I am the parent and pid is %d, i will going to sleep and now waitting\n", getpid());
      sleep(3);
  }

  printf("child process count is: %d and pid is: %d\n", childCount, getpid());

  return 0;
}