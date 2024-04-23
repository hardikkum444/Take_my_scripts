#include <stdio.h>
#include <unistd.h>

int main(){

    int pipe_id[2];
    char data[100];

    if(pipe(pipe_id)<0){
        printf("Pipe creation failed!");
        return 1;
    }

    pid_t pid = fork();

    if(pid<0){
        printf("Fork failed");
        return 1;
    }

    if(pid>0){
        
        close(pipe_id[0]); //closing the reading end of the pipe
        char message [] = "Hello, child process";
        write(pipe_id[1], message, sizeof(message));
        close(pipe_id[1]);
    
    }else{
        
        close(pipe_id[1]); //closing the reading end of the pipe
        read(pipe_id[0], data, sizeof(data));
        printf("Recieved message in child: %s\n",data);
        close(pipe_id[0]);
    }
}
