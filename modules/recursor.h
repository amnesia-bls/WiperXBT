#ifndef WIPER_H
#define WIPER_H

#include <ftw.h>
#include <sys/stat.h>

/**
 * @brief Callback function for nftw traversal.
 * Processes each file/link/directory found during the walk.
 * * @return 0 to continue the recursion, or a non-zero value to stop.
 */
int Unlinker(const char *path, const struct stat *sb, int typeflag, struct FTW *ftwbuf);

/**
 * @brief Initiates the recursive deletion from a specified target path.
 * Uses FTW_DEPTH to ensure children are unlinked before parents.
 * @return 0 on success, -1 on nftw failure.
 */
int WipeRecursionWorker();

#endif /* WIPER_H */