#include <stdio.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>

int main(){

    char *fifo = "/tmp/myfifo";
    mkfifo(fifo, 0666);
    int fd;
    char data[100];

    fd = open(fifo, O_WRONLY);
    write(fd,"Hello from writer", sizeof("Hello from writer"));
    close(fd);

    sleep(1);

    fd = open(fifo, O_RDONLY);
    read(fd, data, sizeof(data));
    printf("Recieved message: %s\n",data);
    close(fd);
}


/* #include <stdio.h> */
/* #include <stdlib.h> */
/* #include <unistd.h> */
/* #include <sys/types.h> */
/* #include <sys/stat.h> */
/* #include <fcntl.h> */
/* #include <string.h> */

/* #define FIFO_FILE "/tmp/myfifo" */

/* int main() { */
/*     int fd; */
/*     char data[100]; */

/*     // Create the named pipe */
/*     mkfifo(FIFO_FILE, 0666); */

/*     // Open the named pipe for writing */
/*     fd = open(FIFO_FILE, O_WRONLY); */

/*     // Write data to the named pipe */
/*     write(fd, "Hello, named pipe!", strlen("Hello, named pipe!")+1); */

/*     // Close the writing end */
/*     close(fd); */

/*     // Open the named pipe for reading */
/*     fd = open(FIFO_FILE, O_RDONLY); */

/*     // Read data from the named pipe */
/*     read(fd, data, sizeof(data)); */

/*     // Print the received message */
/*     printf("Received message: %s\n", data); */

/*     // Close the reading end */
/*     close(fd); */

/*     // Remove the named pipe */
/*     unlink(FIFO_FILE); */

/*     return 0; */
/* } */

