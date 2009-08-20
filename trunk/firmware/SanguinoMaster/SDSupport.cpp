#include "SDSupport.h"
#include <RepRapSDCard.h>
#include <stddef.h>

bool capturing = false;
bool playing = false;
uint32_t capturedBytes = 0L;

RepRapSDCard sdcard;

File file;

uint8_t init_sd_card()
{
  if (!sdcard.init_card()) {
    if (!sdcard.isAvailable()) {
      sdcard.reset();
      return SD_ERR_NO_CARD_PRESENT;
    }
    else
    {
      sdcard.reset();
      return SD_ERR_INIT_FAILED;
    }
  }
  else if (!sdcard.open_partition())
  {
    sdcard.reset();
    return SD_ERR_PARTITION_READ;
  }
  else if (!sdcard.open_filesys())
  {
    sdcard.reset();
    return SD_ERR_OPEN_FILESYSTEM;
  }
  else if (!sdcard.open_dir("/"))
  {
    sdcard.reset();
    return SD_ERR_NO_ROOT;
  }
  else if (sdcard.isLocked())
  {
    return SD_ERR_CARD_LOCKED;
  }
  return SD_SUCCESS;
}


uint8_t start_capture(char* filename) 
{
  uint8_t result = init_sd_card();
  if (result != SD_SUCCESS) {
    return result;
  }
  capturedBytes = 0L;
  file = NULL;
  if (sdcard.create_file(filename)) {
    file = sdcard.open_file(filename);
  } else {
    file = sdcard.open_file(filename);
  }

  if (file == NULL) {
    return SD_ERR_GENERIC;
  }

  capturing = true;
  return SD_SUCCESS;
}

uint32_t finish_capture()
{
  if (capturing) {
    if (file != NULL) {
      sdcard.close_file(file);
    }
    file = NULL;
    capturing = false;
  }
  sdcard.reset();
  return capturedBytes;
}

void capture_byte(uint8_t b) {
  if (file != NULL) {
    sdcard.write_file(file, &b, 1);
    ++capturedBytes;
  }
}

void capture_packet(SimplePacket& packet)
{
  for (uint8_t i = 0; i < packet.getLength(); i++) {
    capture_byte(packet.get_8(i));
  }
}

uint8_t next_byte;
bool has_more;

void fetch_next_byte() {
  int16_t read = fat16_read_file(file, &next_byte, 1);
  has_more = read > 0;
}

bool playback_has_next() {
  return has_more;
}

uint8_t playback_next() {
  uint8_t rv = next_byte;
  fetch_next_byte();
  return rv;
}

uint8_t start_playback(char* filename) {
  uint8_t result = init_sd_card();
  if (result != SD_SUCCESS) {
    return result;
  }
  capturedBytes = 0L;
  file = NULL;
  file = sdcard.open_file(filename);

  if (file == NULL) {
    return SD_ERR_FILE_NOT_FOUND;
  }

  playing = true;
  fetch_next_byte();
  return SD_SUCCESS;
}

void playback_rewind(uint8_t bytes) {
  int32_t offset = -((int32_t)bytes);
  sdcard.seek_file(file, &offset, FAT16_SEEK_CUR);
}

void finish_playback() {
  playing = false;
  if (file != NULL) sdcard.close_file(file);
  sdcard.reset();
  file = NULL;
}

void sd_reset() {
  if (playing) finish_playback();
  if (capturing) finish_capture();
  sdcard.reset();
}
