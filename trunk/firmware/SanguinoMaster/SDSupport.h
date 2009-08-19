#ifndef _SD_SUPPORT_H_
#define _SD_SUPPORT_H_

#define USE_SD_CARD

enum {
  SD_SUCCESS              = 0,
  SD_ERR_NO_CARD_PRESENT  = 1,
  SD_ERR_INIT_FAILED      = 2,
  SD_ERR_PARTITION_READ   = 3,
  SD_ERR_OPEN_FILESYSTEM  = 4,
  SD_ERR_NO_ROOT          = 5,
  SD_ERR_CARD_LOCKED      = 6,
  SD_ERR_FILE_NOT_FOUND   = 7,
  SD_ERR_GENERIC          = 8
};


#include <stdint.h>
#include <SimplePacket.h>

extern bool capturing;
extern bool playing;

inline bool is_capturing() { return capturing; }
inline bool is_playing() { return playing; }

uint8_t start_capture(char* filename);
void capture_packet(SimplePacket& packet);
uint32_t finish_capture();

int start_playback(char* filename);
bool playback_has_next();
uint8_t playback_next();
void playback_rewind(uint8_t bytes);

#endif // _SD_SUPPORT_H_
