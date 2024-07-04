# FFmpeg

### ffmpeg 合并ts命令:

``` shell
    ffmpeg -i xxx.m3u8 -vcodec copy -acodec copy xxx.mp4
```

### 音频视频合并命令:

``` shell 
    保留输入文件
    ffmpeg -i "音频文件名" -i "视频文件名"  -c copy "output.mp4"
    ffmpeg -i "834297465_nb3-1-30280.m4s" -i "834297465-1-100026.m4s" -c copy "output.mp4"
``` 

### ffmpeg 长视频切片命令:

``` shell

[//]: # 使用 ffmpeg 将视频切片成每段10秒，并保持视频的清晰度不变 ()
ffmpeg -i input.mp4 -c copy -map 0 -f segment -segment_time 10  output%03d.mp4
ffmpeg -i input.mp4 -c copy -map 0 -f segment -segment_time 10 -segment_list playlist.m3u8 -segment_list_entry_prefix /path/to/segments/ output%03d.ts

ffmpeg -i input.mp4 -f segment -segment_time 10 -segment_format avi output_%d.avi
ffmpeg -i input.mp4 -f segment -segment_time 10 -segment_format mp4 output_%d.mp4

[//]: # (  copy 复制原视频编码格式  )
    ffmpeg -i input.mp4 -f segment -segment_time 10 -segment_format copy output_%d.mp4
```

### ffmpeg 提取音频命令:
``` shell
ffmpeg -i input.mp4 -vn -acodec copy output.aac
```
