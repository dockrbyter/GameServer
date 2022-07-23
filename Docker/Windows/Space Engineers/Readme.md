# Space Engineers Dedicated Server
![Help Wanted](https://img.shields.io/badge/code-Help%20Wanted-red?logo=github)
# UNFINISHED! Not pushed to Docker Hub!
Contributers welcome! I don't get it to start.  
Here's my work so far...  

The container starts up and after two or three minutes the servcies fails and the container keeps running. The srv directory will be written with data, but the container do not write in the world directory. I can't find any logs.

## Testing Only
## How To
##### Open Firewall Ports:
 - 27016/UDP
 - 8080/TCP
 
#### Create Data Location
```
New-Item -Type Directory C:\docker\spaceengineers\srv
New-Item -Type Directory C:\docker\spaceengineers\world
 ```
