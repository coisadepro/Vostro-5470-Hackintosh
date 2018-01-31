## Clover ACPI Patches List

### Disable Optimus GPU
Comment: ```Rename _INI to XINI```
Find: ```5f494e49 0070005c 2f055f```
Replace: ```58494e49 0070005c 2f055f```

### Intel HD Graphics QE/CI
Comment: ```Change GFX0 to IGPU```
Find: ```47465830```
Replace: ```49475055```

### Battery Status
Comment: ```Rename _BIF to XBIF```
Find: ```5f424946 08085f54 5f3200```
Replace: ```58424946 08085f54 5f3200```

Comment: ```Rename _BST to XBST```
Find: ```5f425354 005b235e 5e2f04```
Replace: ```58425354 005b235e 5e2f04```

### Sleep
Comment: ```Rename _PTS to ZPTS```
Find: ```5f505453 01700050 383044```
Replace: ```5a505453 01700050 383044```

Comment: ```Rename _WAK to ZWAK```
Find: ```5f57414b 09503858 48010aab```
Replace: ```5a57414b 09503858 48010aab```

### Other (required)
Comment: ```Change EHC1 to EH01```
Find: ```45484331```
Replace: ```45483031```

Comment: ```Change EHC2 to EH02```
Find: ```45484332```
Replace: ```45483032```

Comment: ```Change _DSM to XDSM```
Find: ```5f44534d```
Replace: ```5844534d```

Comment: ```Replace Mutex 1```
Find: ```5b01574d 495801```
Replace: ```5b01574d 495800```