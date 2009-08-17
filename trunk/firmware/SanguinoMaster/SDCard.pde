// Yep, this is actually -*- c++ -*-
#ifdef USE_SD_CARD

void init_sd_card()
{
  if (!card.init_card())
  {
    if (!card.isAvailable())
    {
      Serial.println("No card present"); 
      error = 1;
    }
    else
    {
      Serial.println("Card init failed"); 
      error = 2;
    }
  }
  else if (!card.open_partition())
  {
    Serial.println("No partition"); 
    error = 3;
  }
  else if (!card.open_filesys())
  {
    Serial.println("Can't open filesys"); 
    error = 4;
  }
  else if (!card.open_dir("/"))
  {
    Serial.println("Can't open /");
    error = 5;
  }
  else if (card.isLocked())
  {
    Serial.println("Card is locked");
    error = 6;
  }
}

void open_file()
{
  open_new_file();

  if (error == 0)
  {
    bufferIndex = 0;
    for (char c = 'a'; c<= 'z'; c++)
    {
      buffer[bufferIndex] = c;
      bufferIndex++;
    }

    card.write_file(f, (uint8_t *) buffer, bufferIndex);
    card.close_file(f);
  }

  read_first_file();        
}

void open_new_file()
{
  strcpy(buffer, "RRJOB00.TXT");
  for (buffer[5] = '0'; buffer[5] <= '9'; buffer[5]++)
  {
    for (buffer[6] = '0'; buffer[6] <= '9'; buffer[6]++)
    {
      f = card.open_file(buffer);
      if (!f)
        break;        // found a file!      
      card.close_file(f);
    }
    if (!f) 
      break;
  }

  if(!card.create_file(buffer))
  {
    Serial.print("couldnt create: ");
    Serial.println(buffer);
    error = 7;
  }
  else
  {
    f = card.open_file(buffer);
    if (!f)
    {
      Serial.print("error opening: ");
      Serial.println(buffer);
      error = 8;
    }
    else
    {
      Serial.print("writing to: ");
      Serial.println(buffer);
    }
  }
}

void read_first_file()
{
  strcpy(buffer, "RRJOB00.TXT");
  f = card.open_file(buffer);

  if (!f)
  {
    Serial.print("error opening: ");
    Serial.println(buffer);
    error = 8;
  }
  else
  {
    Serial.print("reading from: ");
    Serial.println(buffer);

    uint8_t result = card.read_file(f, (uint8_t *)buffer, 8);

    if (result >0)
      Serial.print(buffer);
    else if (result == 0)
      Serial.println("end of file.");
    else
    {
      Serial.print("read error: ");
      Serial.println(result, DEC);
    }
  }
}

#endif
