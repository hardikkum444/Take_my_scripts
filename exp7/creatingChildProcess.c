#include <stdio.h>
#include <unistd.h>

int main() {

    pid_t child_pid;

    child_pid = fork();

    if(child_pid == 0){
        // child process
        printf("This is a child process %d\n",getpid());
    }else if(child_pid>0){
        // parent process
        printf("This is a parent process %d\n",child_pid);
    }else{
        //fork failed
        printf("Fork failed!");
    }

    
}
