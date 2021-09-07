# asuswrt-snmp

Scripts for extending SNMP on Asuswrt-Merlin routers to include the following values:
- CPU temp
- DHCP leases
- Connected clients
- 2.4GHz radio temp
- 5GHz radio temp
- Memory used
- Idle CPU
- Uptime
- Partition use
- WAN traffic up
- WAN traffic down

### Supported devices

This has been tested on ASUS **RT-AC68U** and **RT-AX86U**. Other devices may require tweaks to scripts. Pull requests are welcome.

### Background
This was created for [Home Assistant](https://www.home-assistant.io/) users wanting more stats than provided by the [ASUSWRT integration](https://www.home-assistant.io/integrations/asuswrt/) or who wish to track multiple ASUSWRT devices, as the integration is limited to one instance. It should of course work with any platform with SNMP support.

## Requirements
- [Asuswrt-Merlin firmware](https://www.asuswrt-merlin.net) installed
- SSH enabled (during installation)
- JFFS scripts enabled
- SNMP v2 enabled

## Installation
1. SSH to the router
2. Create an snmp directory in the jffs scripts directory `mkdir /jffs/scripts/snmp/`
3. Copy all script files into the snmp directory
4. Copy the file `snmp.conf.add` to `/jffs/configs/` directory
5. Restart SNMP (disable/enable) or reboot the router
6. (optional) disable SSH

## Sensor Details
Technically everything is returned as a string but the string type is defined below. All results are returned as raw data without units symbols.
| Sensor            | Baseoid                                                       | Type  | Units |
|-------------------|---------------------------------------------------------------|-------|-------|
| CPU temp          | 1.3.6.1.2.1.25.1.8.3.1.1.4.116.101.109.112                    | INT   | °C    |
| DHCP leases       | 1.3.6.1.2.1.25.1.9.3.1.1.4.100.104.99.112                     | INT   | #     |
| Connected clients | 1.3.6.1.2.1.25.1.10.3.1.1.9.99.111.110.110.101.99.116.101.100 | INT   | #     |
| 2.4GHz radio temp | 1.3.6.1.2.1.25.1.11.3.1.1.5.99.104.105.112.49                 | INT   | °C    |
| 5GHz radio temp   | 1.3.6.1.2.1.25.1.12.3.1.1.5.99.104.105.112.50                 | INT   | °C    |
| Memory used       | 1.3.6.1.2.1.25.1.13.3.1.1.3.109.101.109                       | FLOAT | %     |
| Idle CPU          | 1.3.6.1.2.1.25.1.14.3.1.1.4.105.100.108.101                   | FLOAT | %     |
| Uptime            | 1.3.6.1.2.1.25.1.15.3.1.1.6.117.112.116.105.109.101           | INT   | days  |
| Partition use (/jffs)    | 1.3.6.1.2.1.25.1.16.3.1.1.4.106.102.102.115                   | INT   | %     |
| WAN traffic up    | 1.3.6.1.2.1.25.1.18.3.1.1.6.117.112.108.111.97.100            | FLOAT | Mbps  |
| WAN traffic down  | 1.3.6.1.2.1.25.1.17.3.1.1.8.100.111.119.110.108.111.97.100    | FLOAT | Mbps  |
