#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(){

    pid_t child_pid = fork();

    if(child_pid == 0){
        printf("Child process PID : %d\n",getpid());
        exit(0);
    }else if(child_pid > 0){
        printf("Parent process Pid : %d\n", getpid());
        printf("Parent process childPID : %d\n", child_pid);
        sleep(10);
        printf("Parent process terminating ...");
    }else{
        printf("Fork failed!");
    }
}
