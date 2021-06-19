#include "apue.h"
#include <dirent.h>

/*
 * settin this variable for 
 * logging functions.
 */

int log_to_stderr = 1;
 

int
main (int argc, char *argv[] )
{
	DIR 	*dp;
	struct dirent 	*dirp;
	char 	*directory = NULL;
	
	if(argc != 2){
		directory = ".";
//		err_quit("usage ls directory_name");
	} else {
		directory = argv[1];
	}
	if((dp = opendir(directory)) == NULL)
		err_sys("can't open %s",directory);
	while((dirp = readdir(dp)) != NULL)
		printf("%s\n",dirp->d_name);
	

	closedir(dp);
	exit(0);
}
