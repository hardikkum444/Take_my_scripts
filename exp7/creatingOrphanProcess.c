#include <stdio.h>
#include <unistd.h>

int main(){

    pid_t child_pid = fork();

    if(child_pid == 0){

        printf("child process PID : %d\n",getpid());
        sleep(2);
        printf("child process: my parents PID : %d\n",getppid());
    
    }else if(child_pid>0){
    
        printf("Parent process PID : %d\n",getpid());
        printf("Terminating parent process ....");
    
    }else{
    
        printf("fork failed \n");
        return 1;
    }
}
