#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <sys/user.h>
#include <sys/reg.h>
#include <stdio.h>

int main (int argc, char *argv[]) {
    // pid_t child;
    int child = 8;
    long orig_eax;
    for(int i = 0; i < 3; ++i){
        printf ("i : %d\n", i);
        fork();
    }
    printf("Hello\n");
    // child = fork();
    return 0;
}