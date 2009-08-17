#ifndef _SD_SUPPORT_H_
#define _SD_SUPPORT_H_

#define USE_SD_CARD

#define SD_SUCCESS                0
#define SD_ERR_NO_CARD_PRESENT    1
#define SD_ERR_INIT_FAILED        2
#define SD_ERR_PARTITION_READ     3
#define SD_ERR_OPEN_FILESYSTEM    4
#define SD_ERR_NO_ROOT            5
#define SD_ERR_CARD_LOCKED        6
#define SD_ERR_FILE_NOT_FOUND     7
#define SD_ERR_GENERIC            8


#include <stdint.h>

extern bool capturing;

inline bool is_capturing() { return capturing; }

uint8_t start_capture(char* filename);
uint32_t finish_capture();

#endif // _SD_SUPPORT_H_
