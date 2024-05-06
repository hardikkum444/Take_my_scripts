#include <stdio.h>
#include <dirent.h>

int main(){

    DIR *dir;
    struct dirent *entry;

    dir = opendir(".");

    if(dir){
        printf("here are the contents of the file\n");

        while((entry = readdir(dir))!=NULL){
            printf("%s\n",entry->d_name);
        }
    }
}
