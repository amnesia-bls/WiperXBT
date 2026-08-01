#ifndef WIPER_H
#define WIPER_H

#include <ftw.h>
#include <sys/stat.h>

int Unlinker(const char *path, const struct stat *sb, int typeflag, struct FTW *ftwbuf);
int WipeRecursionWorker();

#endif