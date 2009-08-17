#include "SDSupport.h"
#include <RepRapSDCard.h>
#include <stddef.h>

bool capturing = false;
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
    sdcard.close_file(file);
    capturing = false;
  }
  return capturedBytes;
}
