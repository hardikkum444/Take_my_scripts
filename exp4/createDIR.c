#include <stdio.h>
#include <sys/stat.h>
int main(){
    const char *name = "mandom";
    mkdir(name,0777);
}
